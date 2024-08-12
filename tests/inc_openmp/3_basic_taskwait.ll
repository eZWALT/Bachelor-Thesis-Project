; ModuleID = '/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/3_basic_taskwait.c'
source_filename = "/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/3_basic_taskwait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

; Function Attrs: noinline nounwind optnone
define void @omp_taskwait_1() #0 !dbg !3 {
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  %1 = call i32 @__kmpc_omp_taskwait(ptr @1, i32 %omp_global_thread_num)
  ret void, !dbg !7
}

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 !dbg !8 {
  %1 = alloca i32, i64 1, align 4, !dbg !9
  call void @omp_taskwait_1(), !dbg !10
  %2 = load i32, ptr %1, align 4, !dbg !9
  ret i32 %2, !dbg !9
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #1

; Function Attrs: convergent nounwind
declare i32 @__kmpc_omp_taskwait(ptr, i32) #2

attributes #0 = { noinline nounwind optnone }
attributes #1 = { nounwind }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "MLIR", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!2 = !DIFile(filename: "3_basic_taskwait.c", directory: "/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp")
!3 = distinct !DISubprogram(name: "omp_taskwait_1", linkageName: "omp_taskwait_1", scope: !4, file: !4, line: 2, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!4 = !DIFile(filename: "3_basic_taskwait.c", directory: "")
!5 = !DISubroutineType(cc: DW_CC_normal, types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 1, scope: !3)
!8 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !4, file: !4, line: 7, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!9 = !DILocation(line: 9, column: 1, scope: !8)
!10 = !DILocation(line: 8, column: 2, scope: !8)
