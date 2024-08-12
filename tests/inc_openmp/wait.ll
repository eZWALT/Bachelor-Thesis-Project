; ModuleID = '/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/20_single.c'
source_filename = "/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/20_single.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [75 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/20_single.c;main;11;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 74, ptr @0 }, align 8
@2 = private unnamed_addr constant [75 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/20_single.c;main;14;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 74, ptr @2 }, align 8
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 74, ptr @2 }, align 8
@5 = private unnamed_addr constant [75 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp/20_single.c;main;19;0;;\00", align 1
@6 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 74, ptr @5 }, align 8
@7 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 74, ptr @5 }, align 8

; Function Attrs: nofree nosync nounwind memory(none)
define i32 @work1(i32 %0) local_unnamed_addr #0 !dbg !3 {
  %2 = icmp ult i32 %0, 2, !dbg !7
  br i1 %2, label %common.ret, label %tailrecurse, !dbg !8

common.ret:                                       ; preds = %tailrecurse, %1
  %accumulator.tr.lcssa = phi i32 [ 0, %1 ], [ %6, %tailrecurse ]
  %.tr.lcssa = phi i32 [ %0, %1 ], [ %5, %tailrecurse ]
  %accumulator.ret.tr = add i32 %.tr.lcssa, %accumulator.tr.lcssa, !dbg !9
  ret i32 %accumulator.ret.tr, !dbg !8

tailrecurse:                                      ; preds = %1, %tailrecurse
  %.tr7 = phi i32 [ %5, %tailrecurse ], [ %0, %1 ]
  %accumulator.tr6 = phi i32 [ %6, %tailrecurse ], [ 0, %1 ]
  %3 = add i32 %.tr7, -1, !dbg !9
  %4 = tail call i32 @work1(i32 %3), !dbg !10
  %5 = add i32 %.tr7, -2, !dbg !9
  %6 = add i32 %4, %accumulator.tr6, !dbg !9
  %7 = icmp ult i32 %5, 2, !dbg !7
  br i1 %7, label %common.ret, label %tailrecurse, !dbg !8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i32 @work2(i32 %0) local_unnamed_addr #1 !dbg !11 {
  %2 = add i32 %0, 1, !dbg !12
  %3 = mul i32 %0, %0, !dbg !12
  %4 = mul i32 %3, %2, !dbg !12
  ret i32 %4, !dbg !12
}

; Function Attrs: nounwind
define i32 @main() local_unnamed_addr #2 !dbg !13 {
entry:
  %omp_global_thread_num = tail call i32 @__kmpc_global_thread_num(ptr nonnull @1), !dbg !14
  tail call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr nonnull @1, i32 0, ptr nonnull @main..omp_par), !dbg !14
  ret i32 undef, !dbg !15
}

; Function Attrs: nounwind
define internal void @main..omp_par(ptr noalias nocapture readnone %tid.addr, ptr noalias nocapture readnone %zero.addr) #2 !dbg !16 {
omp.par.entry:
  %omp_global_thread_num4 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @3), !dbg !18
  %0 = tail call i32 @__kmpc_single(ptr nonnull @3, i32 %omp_global_thread_num4), !dbg !18
  %.not = icmp eq i32 %0, 0
  br i1 %.not, label %omp_region.end, label %omp.single.region6

omp_region.end:                                   ; preds = %omp.par.entry, %omp.single.region6
  %omp_global_thread_num8 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @3), !dbg !18
  tail call void @__kmpc_barrier(ptr nonnull @4, i32 %omp_global_thread_num8), !dbg !18
  %omp_global_thread_num9 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @6), !dbg !19
  %1 = tail call i32 @__kmpc_single(ptr nonnull @6, i32 %omp_global_thread_num9), !dbg !19
  %.not1 = icmp eq i32 %1, 0
  br i1 %.not1, label %omp_region.end10, label %omp.single.region14

omp_region.end10:                                 ; preds = %omp_region.end, %omp.single.region14
  %omp_global_thread_num16 = tail call i32 @__kmpc_global_thread_num(ptr nonnull @6), !dbg !19
  tail call void @__kmpc_barrier(ptr nonnull @7, i32 %omp_global_thread_num16), !dbg !19
  ret void

omp.single.region14:                              ; preds = %omp_region.end
  tail call void @__kmpc_end_single(ptr nonnull @6, i32 %omp_global_thread_num9), !dbg !19
  br label %omp_region.end10

omp.single.region6:                               ; preds = %omp.par.entry
  %2 = tail call i32 @work1(i32 5), !dbg !20
  tail call void @__kmpc_end_single(ptr nonnull @3, i32 %omp_global_thread_num4), !dbg !18
  br label %omp_region.end
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare i32 @__kmpc_single(ptr, i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare void @__kmpc_end_single(ptr, i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare !callback !21 void @__kmpc_fork_call(ptr, i32, ptr, ...) local_unnamed_addr #2

attributes #0 = { nofree nosync nounwind memory(none) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #2 = { nounwind }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "MLIR", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!2 = !DIFile(filename: "20_single.c", directory: "/home/walterjtv/Escritorio/Q8/TFG/tutorial/openmp")
!3 = distinct !DISubprogram(name: "work1", linkageName: "work1", scope: !4, file: !4, line: 1, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!4 = !DIFile(filename: "20_single.c", directory: "")
!5 = !DISubroutineType(cc: DW_CC_normal, types: !6)
!6 = !{}
!7 = !DILocation(line: 2, scope: !3)
!8 = !DILocation(line: 0, scope: !3)
!9 = !DILocation(line: 3, scope: !3)
!10 = !DILocation(line: 3, column: 17, scope: !3)
!11 = distinct !DISubprogram(name: "work2", linkageName: "work2", scope: !4, file: !4, line: 6, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!12 = !DILocation(line: 7, scope: !11)
!13 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !4, file: !4, line: 10, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!14 = !DILocation(line: 11, scope: !13)
!15 = !DILocation(line: 25, column: 1, scope: !13)
!16 = distinct !DISubprogram(name: "main..omp_par", linkageName: "main..omp_par", scope: null, file: !4, type: !17, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!17 = !DISubroutineType(types: !6)
!18 = !DILocation(line: 14, scope: !16)
!19 = !DILocation(line: 19, scope: !16)
!20 = !DILocation(line: 16, column: 17, scope: !16)
!21 = !{!22}
!22 = !{i64 2, i64 -1, i64 -1, i1 true}
