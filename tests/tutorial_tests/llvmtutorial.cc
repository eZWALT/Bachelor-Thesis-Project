#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/MC/TargetRegistry.h"
#include <optional>

int main() {
    // Initialize the LLVM context which holds global data used by LLVM
    llvm::LLVMContext Context;

    // Create a new LLVM module, which is a container for functions and global variables (Basically a program/file)
    std::unique_ptr<llvm::Module> Module = std::make_unique<llvm::Module>("my_module", Context);

    // Create an IRBuilder, which is a helper object to create LLVM instructions
    llvm::IRBuilder<> Builder(Context);

    // Define the 'add' function which takes two float arguments and returns a float
    llvm::FunctionType *AddFuncType = llvm::FunctionType::get(Builder.getFloatTy(), {Builder.getFloatTy(), Builder.getFloatTy()}, false);
    llvm::Function *AddFunction = llvm::Function::Create(AddFuncType, llvm::Function::ExternalLinkage, "add", Module.get());

    // Create a single basic block in the 'add' function
    llvm::BasicBlock *AddBB = llvm::BasicBlock::Create(Context, "entry", AddFunction);
    Builder.SetInsertPoint(AddBB);

    // Get the function arguments "a" and "b"
    auto Args = AddFunction->args().begin();
    llvm::Value *A = Args++;
    A->setName("a");
    llvm::Value *B = Args++;
    B->setName("b");

    // Create the addition instruction 
    llvm::Value *Sum = Builder.CreateFAdd(A, B, "sum");
    //Create a return instruction
    Builder.CreateRet(Sum);

    // Define the 'main' function which returns an int and takes no arguments
    llvm::FunctionType *MainFuncType = llvm::FunctionType::get(Builder.getInt32Ty(), false);
    llvm::Function *MainFunction = llvm::Function::Create(MainFuncType, llvm::Function::ExternalLinkage, "main", Module.get());

    // Create a single basic block in the 'main' function
    llvm::BasicBlock *MainBB = llvm::BasicBlock::Create(Context, "entry", MainFunction);
    Builder.SetInsertPoint(MainBB);

    // Create constants instructions for the float values 3.14 and 420.0
    llvm::Value *X = llvm::ConstantFP::get(Context, llvm::APFloat(3.14f));
    llvm::Value *Y = llvm::ConstantFP::get(Context, llvm::APFloat(420.0f));

    // Call the 'add' function through call instruction with X and Y as arguments and store the result
    llvm::Value *AddCall = Builder.CreateCall(AddFunction, {X, Y}, "call_add");

    // Return 0 from the 'main' function
    Builder.CreateRet(Builder.getInt32(0));

    // Verify the module to ensure it's well-formed
    if (llvm::verifyModule(*Module, &llvm::errs())) {
        llvm::errs() << "Error constructing function!\n";
        return 1;
    }

    // Optimize the module using various optimization passes
    // More info on https://llvm.org/docs/Passes.html
    llvm::legacy::PassManager PM;
    PM.add(llvm::createPromoteMemoryToRegisterPass());
    PM.add(llvm::createReassociatePass());
    PM.add(llvm::createCFGSimplificationPass());
    PM.run(*Module);

    // Initialize the native target to generate machine code for the host machine
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    // Set the target triple which specifies the target architecture, vendor, and OS
    //The triple here is hardcoded just to showcase it. Use the line below instead.
    std::string Error;
    auto TargetTriple = "x86_64-pc-linux-gnu";
    //auto TargetTriple = llvm::sys::getDefaultTargetTriple();
    Module->setTargetTriple(TargetTriple);

    // Lookup the target based on the target triple
    auto Target = llvm::TargetRegistry::lookupTarget(TargetTriple, Error);
    if (!Target) {
        llvm::errs() << Error;
        return 1;
    }

    // Create a target machine which generates code for the specified target
    // This target machine object encapsulates all the complexities of the target language
    auto CPU = "generic";
    auto Features = "";
    llvm::TargetOptions opt;
    auto RM = llvm::Optional<llvm::Reloc::Model>(); 
    auto TargetMachine = Target->createTargetMachine(TargetTriple, CPU, Features, opt, RM);

    //Set the data layout on the module
    Module->setDataLayout(TargetMachine->createDataLayout());

    // Open a file to write the generated object file
    std::string Filename = "output.o";
    std::error_code EC;
    llvm::raw_fd_ostream dest(Filename, EC, llvm::sys::fs::OF_None); // Use llvm::sys::fs::OF_None
    if (EC) {
        llvm::errs() << "Could not open file: " << EC.message();
        return 1;
    }

    // Create a pass manager to emit the object file
    llvm::legacy::PassManager pass;
    auto FileType = llvm::CGFT_ObjectFile;

    if (TargetMachine->addPassesToEmitFile(pass, dest, nullptr, FileType)) {
        llvm::errs() << "The TargetMachine can't emit a file of this type";
        return 1;
    }

    // Run the pass manager to generate the object file
    pass.run(*Module);
    dest.flush();
    return 0;
}
