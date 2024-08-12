#!/bin/bash

# Change to the workspace folder
cd $workspaceFolder

# Change to the clangir-build directory
cd clangir-build

# Run CMake configuration with specified options
cmake ../clangir/llvm -GNinja \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_INSTALL_PREFIX=$CLANGIR_INSTALLDIR \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DLLVM_ENABLE_PROJECTS="clang;mlir" \
  -DCLANG_ENABLE_CIR=ON \
  -DCMAKE_CXX_COMPILER=$(which clang++) \
  -DCMAKE_C_COMPILER=$(which clang) \
  -DLLVM_ENABLE_RUNTIMES="openmp" \
  -DLLVM_USE_LINKER=lld \
  -DLLVM_USE_SPLIT_DWARF=ON 
  
# Build LLVM compiler using Ninja
ninja

# Install the compiled LLVM compiler
ninja install

# CLANGIR_INSTALLDIR is a bashrc variable that points to $workspaceFolder/clangir-build
# Example of compilation using the compiled compiler clang-19
#$CLANGIR_INSTALLDIR/bin/clang-19 -fopenmp -fclangir-enable -emit-cir -S  file.c -o file.cir

#Example of clang AST visualization
#$CLANGIR-INSTALLDIR/bin/clang-19 -Xclang -ast-dump file.c

#Example of MLIR SSA visualiation
#$CLANGIR-INSTALLDIR/bin/mlir-opt -view-ssa file.mlir

#add_definitions(-U_GLIBCXX_ASSERTIONS)
#add_definitions(-U_LIBCPP_ENABLE_ASSERTIONS)
    
    
