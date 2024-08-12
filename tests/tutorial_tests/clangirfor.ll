; ModuleID = '/home/walterjtv/Escritorio/Q8/TFG/tutorial/test2.c'
source_filename = "/home/walterjtv/Escritorio/Q8/TFG/tutorial/test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline optnone
define i32 @main() #0 !dbg !3 {
  %1 = alloca i32, i64 1, align 4, !dbg !7
  %2 = alloca i32, i64 1, align 4, !dbg !8
  store i32 5, ptr %2, align 4, !dbg !8
  br label %3, !dbg !9

3:                                                ; preds = %0
  %4 = alloca i32, i64 1, align 4, !dbg !10
  store i32 0, ptr %4, align 4, !dbg !10
  br label %5, !dbg !9

5:                                                ; preds = %17, %3
  %6 = load i32, ptr %4, align 4, !dbg !11
  %7 = icmp slt i32 %6, 10, !dbg !10
  %8 = zext i1 %7 to i32, !dbg !10
  %9 = icmp ne i32 %8, 0, !dbg !12
  %10 = zext i1 %9 to i8, !dbg !12
  %11 = trunc i8 %10 to i1, !dbg !12
  br i1 %11, label %12, label %20, !dbg !12

12:                                               ; preds = %5
  br label %13, !dbg !9

13:                                               ; preds = %12
  %14 = load i32, ptr %2, align 4, !dbg !13
  %15 = add i32 %14, 1, !dbg !13
  store i32 %15, ptr %2, align 4, !dbg !14
  br label %16, !dbg !15

16:                                               ; preds = %13
  br label %17, !dbg !15

17:                                               ; preds = %16
  %18 = load i32, ptr %4, align 4, !dbg !16
  %19 = add i32 %18, 1, !dbg !16
  store i32 %19, ptr %4, align 4, !dbg !10
  br label %5, !dbg !9

20:                                               ; preds = %5
  br label %21, !dbg !15

21:                                               ; preds = %20
  store i32 0, ptr %1, align 4, !dbg !17
  %22 = load i32, ptr %1, align 4, !dbg !17
  ret i32 %22, !dbg !17
}

attributes #0 = { noinline optnone }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "MLIR", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!2 = !DIFile(filename: "test2.c", directory: "/home/walterjtv/Escritorio/Q8/TFG/tutorial")
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !4, file: !4, line: 2, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!4 = !DIFile(filename: "test2.c", directory: "")
!5 = !DISubroutineType(cc: DW_CC_normal, types: !6)
!6 = !{}
!7 = !DILocation(line: 8, column: 1, scope: !3)
!8 = !DILocation(line: 3, scope: !3)
!9 = !DILocation(line: 0, scope: !3)
!10 = !DILocation(line: 4, scope: !3)
!11 = !DILocation(line: 4, column: 17, scope: !3)
!12 = !DILocation(line: 4, column: 19, scope: !3)
!13 = !DILocation(line: 5, column: 3, scope: !3)
!14 = !DILocation(line: 5, scope: !3)
!15 = !DILocation(line: 6, column: 2, scope: !3)
!16 = !DILocation(line: 4, column: 25, scope: !3)
!17 = !DILocation(line: 7, scope: !3)
