; ModuleID = 'sus.c'
source_filename = "sus.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local float @add(float noundef %a, float noundef %b) #0 {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4, !tbaa !5
  store float %b, float* %b.addr, align 4, !tbaa !5
  %0 = load float, float* %a.addr, align 4, !tbaa !5
  %1 = load float, float* %b.addr, align 4, !tbaa !5
  %add = fadd float %0, %1
  ret float %add
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  store i32 0, i32* %retval, align 4
  %0 = bitcast float* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  store float 0x40091EB860000000, float* %x, align 4, !tbaa !5
  %1 = bitcast float* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #2
  store float 4.200000e+02, float* %y, align 4, !tbaa !5
  %2 = load float, float* %x, align 4, !tbaa !5
  %3 = load float, float* %y, align 4, !tbaa !5
  %call = call float @add(float noundef %2, float noundef %3)
  %conv = fptosi float %call to i32
  %4 = bitcast float* %y to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %4) #2
  %5 = bitcast float* %x to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #2
  ret i32 %conv
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
