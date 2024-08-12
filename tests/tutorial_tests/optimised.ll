; ModuleID = 'unoptimised.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @SpMV_ref(double* noundef %a, i64* noundef %ia, i64* noundef %ja, double* noundef %x, double* noundef %y, i32 noundef %nrows) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ]
  %cmp = icmp slt i32 %row.0, %nrows
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %row.0 to i64
  %arrayidx = getelementptr inbounds i64, i64* %ia, i64 %idxprom
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !5
  %conv = trunc i64 %0 to i32
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %idx.0 = phi i32 [ %conv, %for.body ], [ %inc, %for.inc ]
  %sum.0 = phi double [ 0.000000e+00, %for.body ], [ %5, %for.inc ]
  %conv2 = sext i32 %idx.0 to i64
  %add = add nsw i32 %row.0, 1
  %idxprom3 = sext i32 %add to i64
  %arrayidx4 = getelementptr inbounds i64, i64* %ia, i64 %idxprom3
  %1 = load i64, i64* %arrayidx4, align 8, !tbaa !5
  %cmp5 = icmp slt i64 %conv2, %1
  br i1 %cmp5, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond1
  %idxprom8 = sext i32 %idx.0 to i64
  %arrayidx9 = getelementptr inbounds double, double* %a, i64 %idxprom8
  %2 = load double, double* %arrayidx9, align 8, !tbaa !9
  %idxprom10 = sext i32 %idx.0 to i64
  %arrayidx11 = getelementptr inbounds i64, i64* %ja, i64 %idxprom10
  %3 = load i64, i64* %arrayidx11, align 8, !tbaa !5
  %arrayidx12 = getelementptr inbounds double, double* %x, i64 %3
  %4 = load double, double* %arrayidx12, align 8, !tbaa !9
  %5 = call double @llvm.fmuladd.f64(double %2, double %4, double %sum.0)
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %inc = add nsw i32 %idx.0, 1
  br label %for.cond1, !llvm.loop !11

for.end:                                          ; preds = %for.cond1
  %idxprom13 = sext i32 %row.0 to i64
  %arrayidx14 = getelementptr inbounds double, double* %y, i64 %idxprom13
  store double %sum.0, double* %arrayidx14, align 8, !tbaa !9
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %inc16 = add nsw i32 %row.0, 1
  br label %for.cond, !llvm.loop !13

for.end17:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  ret i32 0
}

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
