; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @SpMV_ref(double* noundef %a, i64* noundef %ia, i64* noundef %ja, double* noundef %x, double* noundef %y, i32 noundef %nrows) #0 {
entry:
  %a.addr = alloca double*, align 8
  %ia.addr = alloca i64*, align 8
  %ja.addr = alloca i64*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %nrows.addr = alloca i32, align 4
  %row = alloca i32, align 4
  %idx = alloca i32, align 4
  %sum = alloca double, align 8
  store double* %a, double** %a.addr, align 8, !tbaa !5
  store i64* %ia, i64** %ia.addr, align 8, !tbaa !5
  store i64* %ja, i64** %ja.addr, align 8, !tbaa !5
  store double* %x, double** %x.addr, align 8, !tbaa !5
  store double* %y, double** %y.addr, align 8, !tbaa !5
  store i32 %nrows, i32* %nrows.addr, align 4, !tbaa !9
  %0 = bitcast i32* %row to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %idx to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %row, align 4, !tbaa !9
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %2 = load i32, i32* %row, align 4, !tbaa !9
  %3 = load i32, i32* %nrows.addr, align 4, !tbaa !9
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %4 = bitcast double* %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  store double 0.000000e+00, double* %sum, align 8, !tbaa !11
  %5 = load i64*, i64** %ia.addr, align 8, !tbaa !5
  %6 = load i32, i32* %row, align 4, !tbaa !9
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %idxprom
  %7 = load i64, i64* %arrayidx, align 8, !tbaa !13
  %conv = trunc i64 %7 to i32
  store i32 %conv, i32* %idx, align 4, !tbaa !9
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %idx, align 4, !tbaa !9
  %conv2 = sext i32 %8 to i64
  %9 = load i64*, i64** %ia.addr, align 8, !tbaa !5
  %10 = load i32, i32* %row, align 4, !tbaa !9
  %add = add nsw i32 %10, 1
  %idxprom3 = sext i32 %add to i64
  %arrayidx4 = getelementptr inbounds i64, i64* %9, i64 %idxprom3
  %11 = load i64, i64* %arrayidx4, align 8, !tbaa !13
  %cmp5 = icmp slt i64 %conv2, %11
  br i1 %cmp5, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond1
  %12 = load double*, double** %a.addr, align 8, !tbaa !5
  %13 = load i32, i32* %idx, align 4, !tbaa !9
  %idxprom8 = sext i32 %13 to i64
  %arrayidx9 = getelementptr inbounds double, double* %12, i64 %idxprom8
  %14 = load double, double* %arrayidx9, align 8, !tbaa !11
  %15 = load double*, double** %x.addr, align 8, !tbaa !5
  %16 = load i64*, i64** %ja.addr, align 8, !tbaa !5
  %17 = load i32, i32* %idx, align 4, !tbaa !9
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds i64, i64* %16, i64 %idxprom10
  %18 = load i64, i64* %arrayidx11, align 8, !tbaa !13
  %arrayidx12 = getelementptr inbounds double, double* %15, i64 %18
  %19 = load double, double* %arrayidx12, align 8, !tbaa !11
  %20 = load double, double* %sum, align 8, !tbaa !11
  %21 = call double @llvm.fmuladd.f64(double %14, double %19, double %20)
  store double %21, double* %sum, align 8, !tbaa !11
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %22 = load i32, i32* %idx, align 4, !tbaa !9
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %idx, align 4, !tbaa !9
  br label %for.cond1, !llvm.loop !15

for.end:                                          ; preds = %for.cond1
  %23 = load double, double* %sum, align 8, !tbaa !11
  %24 = load double*, double** %y.addr, align 8, !tbaa !5
  %25 = load i32, i32* %row, align 4, !tbaa !9
  %idxprom13 = sext i32 %25 to i64
  %arrayidx14 = getelementptr inbounds double, double* %24, i64 %idxprom13
  store double %23, double* %arrayidx14, align 8, !tbaa !11
  %26 = bitcast double* %sum to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #3
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %27 = load i32, i32* %row, align 4, !tbaa !9
  %inc16 = add nsw i32 %27, 1
  store i32 %inc16, i32* %row, align 4, !tbaa !9
  br label %for.cond, !llvm.loop !17

for.end17:                                        ; preds = %for.cond
  %28 = bitcast i32* %idx to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3
  %29 = bitcast i32* %row to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3
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
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !7, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !7, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
