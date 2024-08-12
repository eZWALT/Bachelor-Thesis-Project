; ModuleID = '/home/walterjtv/Escritorio/Q8/TFG/tutorial/foldsum/foldsum.c'
source_filename = "/home/walterjtv/Escritorio/Q8/TFG/tutorial/foldsum/foldsum.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define i32 @fold_sum(ptr nocapture readonly %0, i32 %1) local_unnamed_addr #0 !dbg !3 {
  %3 = icmp sgt i32 %1, 0, !dbg !7
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge, !dbg !8

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext nneg i32 %1 to i64, !dbg !7
  br label %.lr.ph, !dbg !8

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.078 = phi i32 [ 0, %.lr.ph.preheader ], [ %6, %.lr.ph ]
  %4 = getelementptr i32, ptr %0, i64 %indvars.iv, !dbg !9
  %5 = load i32, ptr %4, align 4, !dbg !10
  %6 = add i32 %5, %.078, !dbg !11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !12
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !7
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !dbg !8

._crit_edge:                                      ; preds = %.lr.ph, %2
  %.07.lcssa = phi i32 [ 0, %2 ], [ %6, %.lr.ph ], !dbg !13
  ret i32 %.07.lcssa, !dbg !14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @main() local_unnamed_addr #1 !dbg !15 {
  ret i32 0, !dbg !16
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "MLIR", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!2 = !DIFile(filename: "foldsum.c", directory: "/home/walterjtv/Escritorio/Q8/TFG/tutorial/foldsum")
!3 = distinct !DISubprogram(name: "fold_sum", linkageName: "fold_sum", scope: !4, file: !4, line: 1, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!4 = !DIFile(filename: "foldsum.c", directory: "")
!5 = !DISubroutineType(cc: DW_CC_normal, types: !6)
!6 = !{}
!7 = !DILocation(line: 3, scope: !3)
!8 = !DILocation(line: 3, column: 21, scope: !3)
!9 = !DILocation(line: 4, column: 13, scope: !3)
!10 = !DILocation(line: 4, column: 10, scope: !3)
!11 = !DILocation(line: 4, scope: !3)
!12 = !DILocation(line: 3, column: 26, scope: !3)
!13 = !DILocation(line: 0, scope: !3)
!14 = !DILocation(line: 6, scope: !3)
!15 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !4, file: !4, line: 9, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!16 = !DILocation(line: 10, scope: !15)
