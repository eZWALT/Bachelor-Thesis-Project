#loop_annotation = #llvm.loop_annotation<mustProgress = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "long", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "double", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc2, access_type = #tbaa_type_desc2, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>, #dlti.dl_entry<"dlti.endianness", "little">>} {
  llvm.func @SpMV_ref(%arg0: !llvm.ptr {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}, %arg2: !llvm.ptr {llvm.noundef}, %arg3: !llvm.ptr {llvm.noundef}, %arg4: !llvm.ptr {llvm.noundef}, %arg5: i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, passthrough = ["nounwind", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["tune-cpu", "generic"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %2 = llvm.mlir.constant(1 : i32) : i32
    llvm.br ^bb1(%0 : i32)
  ^bb1(%3: i32):  // 2 preds: ^bb0, ^bb7
    %4 = llvm.icmp "slt" %3, %arg5 : i32
    llvm.cond_br %4, ^bb2, ^bb8
  ^bb2:  // pred: ^bb1
    %5 = llvm.sext %3 : i32 to i64
    %6 = llvm.getelementptr inbounds %arg1[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %7 = llvm.load %6 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i64
    %8 = llvm.trunc %7 : i64 to i32
    llvm.br ^bb3(%8, %1 : i32, f64)
  ^bb3(%9: i32, %10: f64):  // 2 preds: ^bb2, ^bb5
    %11 = llvm.sext %9 : i32 to i64
    %12 = llvm.add %3, %2 overflow<nsw>  : i32
    %13 = llvm.sext %12 : i32 to i64
    %14 = llvm.getelementptr inbounds %arg1[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %15 = llvm.load %14 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i64
    %16 = llvm.icmp "slt" %11, %15 : i64
    llvm.cond_br %16, ^bb4, ^bb6
  ^bb4:  // pred: ^bb3
    %17 = llvm.sext %9 : i32 to i64
    %18 = llvm.getelementptr inbounds %arg0[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %19 = llvm.load %18 {alignment = 8 : i64, tbaa = [#tbaa_tag1]} : !llvm.ptr -> f64
    %20 = llvm.sext %9 : i32 to i64
    %21 = llvm.getelementptr inbounds %arg2[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %22 = llvm.load %21 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i64
    %23 = llvm.getelementptr inbounds %arg3[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %24 = llvm.load %23 {alignment = 8 : i64, tbaa = [#tbaa_tag1]} : !llvm.ptr -> f64
    %25 = llvm.intr.fmuladd(%19, %24, %10)  : (f64, f64, f64) -> f64
    llvm.br ^bb5
  ^bb5:  // pred: ^bb4
    %26 = llvm.add %9, %2 overflow<nsw>  : i32
    llvm.br ^bb3(%26, %25 : i32, f64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb3
    %27 = llvm.sext %3 : i32 to i64
    %28 = llvm.getelementptr inbounds %arg4[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %10, %28 {alignment = 8 : i64, tbaa = [#tbaa_tag1]} : f64, !llvm.ptr
    llvm.br ^bb7
  ^bb7:  // pred: ^bb6
    %29 = llvm.add %3, %2 overflow<nsw>  : i32
    llvm.br ^bb1(%29 : i32) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() -> i32 attributes {frame_pointer = #llvm.framePointerKind<none>, passthrough = ["nounwind", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["tune-cpu", "generic"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
}
