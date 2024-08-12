; ModuleID = '/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp/el_millor_tfg_es_aquest.c'
source_filename = "/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp/el_millor_tfg_es_aquest.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [95 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp/el_millor_tfg_es_aquest.c;main;11;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 94, ptr @0 }, align 8
@2 = private unnamed_addr constant [95 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp/el_millor_tfg_es_aquest.c;main;13;0;;\00", align 1
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 94, ptr @2 }, align 8
@4 = private unnamed_addr constant [95 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp/el_millor_tfg_es_aquest.c;main;16;0;;\00", align 1
@5 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 94, ptr @4 }, align 8
@6 = private unnamed_addr constant [95 x i8] c";/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp/el_millor_tfg_es_aquest.c;main;18;0;;\00", align 1
@7 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 94, ptr @6 }, align 8
@.gomp_critical_user_.var = common global [8 x i32] zeroinitializer, align 8
@8 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 94, ptr @2 }, align 8
@9 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@10 = private unnamed_addr constant %struct.ident_t { i32 0, i32 34, i32 0, i32 22, ptr @9 }, align 8
@11 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @9 }, align 8

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 !dbg !3 {
  %structArg31 = alloca { ptr, ptr }, align 8
  %1 = alloca i32, i64 1, align 4, !dbg !7
  %2 = alloca [10000 x i32], i64 1, align 16, !dbg !8
  %3 = alloca i32, i64 1, align 4, !dbg !9
  br label %4, !dbg !10

4:                                                ; preds = %0
  %5 = alloca i32, i64 1, align 4, !dbg !11
  store i32 0, ptr %5, align 4, !dbg !11
  br label %6, !dbg !10

6:                                                ; preds = %17, %4
  %7 = load i32, ptr %5, align 4, !dbg !12
  %8 = icmp slt i32 %7, 10000, !dbg !11
  %9 = zext i1 %8 to i32, !dbg !11
  %10 = icmp ne i32 %9, 0, !dbg !13
  br i1 %10, label %11, label %20, !dbg !13

11:                                               ; preds = %6
  %12 = load i32, ptr %5, align 4, !dbg !14
  %13 = add i32 %12, 1, !dbg !15
  %14 = load i32, ptr %5, align 4, !dbg !16
  %15 = sext i32 %14 to i64, !dbg !16
  %16 = getelementptr i32, ptr %2, i64 %15, !dbg !17
  store i32 %13, ptr %16, align 4, !dbg !15
  br label %17, !dbg !18

17:                                               ; preds = %11
  %18 = load i32, ptr %5, align 4, !dbg !19
  %19 = add i32 %18, 1, !dbg !11
  store i32 %19, ptr %5, align 4, !dbg !11
  br label %6, !dbg !10

20:                                               ; preds = %6
  br label %21, !dbg !18

21:                                               ; preds = %20
  store i32 0, ptr %3, align 4, !dbg !9
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1), !dbg !20
  br label %omp_parallel

omp_parallel:                                     ; preds = %21
  %gep_32 = getelementptr { ptr, ptr }, ptr %structArg31, i32 0, i32 0
  store ptr %2, ptr %gep_32, align 8
  %gep_33 = getelementptr { ptr, ptr }, ptr %structArg31, i32 0, i32 1
  store ptr %3, ptr %gep_33, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @main..omp_par.1, ptr %structArg31), !dbg !20
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %omp_global_thread_num26 = call i32 @__kmpc_global_thread_num(ptr @11)
  call void @__kmpc_barrier(ptr @10, i32 %omp_global_thread_num26)
  %22 = load i32, ptr %3, align 4, !dbg !21
  store i32 %22, ptr %1, align 4, !dbg !22
  %23 = load i32, ptr %1, align 4, !dbg !22
  ret i32 %23, !dbg !22
}

; Function Attrs: noinline nounwind optnone
define internal void @main..omp_par.1(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 !dbg !23 {
omp.par.entry:
  %gep_ = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %structArg = alloca { ptr, ptr, ptr }, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.par.entry
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  br label %omp.par.region2, !dbg !25

omp.par.region2:                                  ; preds = %omp.par.region1
  %omp_global_thread_num4 = call i32 @__kmpc_global_thread_num(ptr @3), !dbg !26
  %2 = call i32 @__kmpc_single(ptr @3, i32 %omp_global_thread_num4), !dbg !26
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %omp_region.body, label %omp_region.end

omp_region.end:                                   ; preds = %omp.par.region2, %omp.region.cont5
  %omp_global_thread_num25 = call i32 @__kmpc_global_thread_num(ptr @3), !dbg !26
  call void @__kmpc_barrier(ptr @8, i32 %omp_global_thread_num25), !dbg !26
  br label %omp.par.region3, !dbg !27

omp.par.region3:                                  ; preds = %omp_region.end
  br label %omp.region.cont, !dbg !27

omp.region.cont:                                  ; preds = %omp.par.region3
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_region.body:                                  ; preds = %omp.par.region2
  br label %omp.single.region

omp.single.region:                                ; preds = %omp_region.body
  br label %omp.single.region6, !dbg !26

omp.single.region6:                               ; preds = %omp.single.region
  br label %omp.single.region7, !dbg !28

omp.single.region7:                               ; preds = %omp.single.region6
  %4 = alloca i32, i64 1, align 4, !dbg !29
  store i32 0, ptr %4, align 4, !dbg !29
  br label %omp.single.region8, !dbg !28

omp.single.region8:                               ; preds = %omp.single.region12, %omp.single.region7
  %5 = load i32, ptr %4, align 4, !dbg !30
  %6 = icmp slt i32 %5, 10000, !dbg !29
  %7 = zext i1 %6 to i32, !dbg !29
  %8 = icmp ne i32 %7, 0, !dbg !31
  br i1 %8, label %omp.single.region9, label %omp.single.region13, !dbg !31

omp.single.region13:                              ; preds = %omp.single.region8
  br label %omp.single.region14, !dbg !32

omp.single.region14:                              ; preds = %omp.single.region13
  br label %omp.single.region15, !dbg !33

omp.single.region15:                              ; preds = %omp.single.region14
  br label %omp.region.cont5, !dbg !33

omp.region.cont5:                                 ; preds = %omp.single.region15
  call void @__kmpc_end_single(ptr @3, i32 %omp_global_thread_num4), !dbg !26
  br label %omp_region.end

omp.single.region9:                               ; preds = %omp.single.region8
  br label %omp.single.region10, !dbg !28

omp.single.region10:                              ; preds = %omp.single.region9
  br label %codeRepl

codeRepl:                                         ; preds = %omp.single.region10
  %gep_3 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %4, ptr %gep_3, align 8
  %gep_27 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %loadgep_, ptr %gep_27, align 8
  %gep_28 = getelementptr { ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %loadgep_2, ptr %gep_28, align 8
  %omp_global_thread_num29 = call i32 @__kmpc_global_thread_num(ptr @5), !dbg !34
  %9 = call ptr @__kmpc_omp_task_alloc(ptr @5, i32 %omp_global_thread_num29, i32 1, i64 40, i64 24, ptr @main..omp_par), !dbg !34
  %10 = load ptr, ptr %9, align 8, !dbg !34
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %10, ptr align 1 %structArg, i64 24, i1 false), !dbg !34
  %11 = call i32 @__kmpc_omp_task(ptr @5, i32 %omp_global_thread_num29, ptr %9), !dbg !34
  br label %task.exit

task.exit:                                        ; preds = %codeRepl
  br label %omp.single.region11, !dbg !32

omp.single.region11:                              ; preds = %task.exit
  br label %omp.single.region12, !dbg !32

omp.single.region12:                              ; preds = %omp.single.region11
  %12 = load i32, ptr %4, align 4, !dbg !35
  %13 = add i32 %12, 1, !dbg !29
  store i32 %13, ptr %4, align 4, !dbg !29
  br label %omp.single.region8, !dbg !28

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @main..omp_par(i32 %global.tid.val, ptr %0) #0 !dbg !36 {
task.alloca:
  %1 = load ptr, ptr %0, align 8
  %gep_ = getelementptr { ptr, ptr, ptr }, ptr %1, i32 0, i32 0
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr }, ptr %1, i32 0, i32 1
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr }, ptr %1, i32 0, i32 2
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  br label %task.body

task.body:                                        ; preds = %task.alloca
  br label %omp.task.region

omp.task.region:                                  ; preds = %task.body
  br label %omp.task.region17, !dbg !37

omp.task.region17:                                ; preds = %omp.task.region
  %omp_global_thread_num19 = call i32 @__kmpc_global_thread_num(ptr @7), !dbg !38
  call void @__kmpc_critical(ptr @7, i32 %omp_global_thread_num19, ptr @.gomp_critical_user_.var), !dbg !38
  br label %omp.critical.region

omp.critical.region:                              ; preds = %omp.task.region17
  br label %omp.critical.region23, !dbg !38

omp.critical.region23:                            ; preds = %omp.critical.region
  %2 = load i32, ptr %loadgep_, align 4, !dbg !39
  %3 = sext i32 %2 to i64, !dbg !39
  %4 = getelementptr i32, ptr %loadgep_2, i64 %3, !dbg !40
  %5 = load i32, ptr %4, align 4, !dbg !40
  %6 = load i32, ptr %loadgep_4, align 4, !dbg !41
  %7 = add i32 %6, %5, !dbg !42
  store i32 %7, ptr %loadgep_4, align 4, !dbg !42
  br label %omp.critical.region24, !dbg !43

omp.critical.region24:                            ; preds = %omp.critical.region23
  br label %omp.region.cont22, !dbg !43

omp.region.cont22:                                ; preds = %omp.critical.region24
  call void @__kmpc_end_critical(ptr @7, i32 %omp_global_thread_num19, ptr @.gomp_critical_user_.var), !dbg !38
  br label %omp.task.region18, !dbg !44

omp.task.region18:                                ; preds = %omp.region.cont22
  br label %omp.region.cont16, !dbg !44

omp.region.cont16:                                ; preds = %omp.task.region18
  br label %task.exit.exitStub

task.exit.exitStub:                               ; preds = %omp.region.cont16
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #1

; Function Attrs: convergent nounwind
declare i32 @__kmpc_single(ptr, i32) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_end_single(ptr, i32) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_critical(ptr, i32, ptr) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_end_critical(ptr, i32, ptr) #2

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #2

; Function Attrs: nounwind
declare noalias ptr @__kmpc_omp_task_alloc(ptr, i32, i32, i64, i64, ptr) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i32 @__kmpc_omp_task(ptr, i32, ptr) #1

; Function Attrs: nounwind
declare !callback !45 void @__kmpc_fork_call(ptr, i32, ptr, ...) #1

attributes #0 = { noinline nounwind optnone }
attributes #1 = { nounwind }
attributes #2 = { convergent nounwind }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DICompileUnit(language: DW_LANG_C, file: !2, producer: "MLIR", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!2 = !DIFile(filename: "el_millor_tfg_es_aquest.c", directory: "/home/walterjtv/Escritorio/Q8/TFG/tutorial/tests_openmp")
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !4, file: !4, line: 4, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!4 = !DIFile(filename: "el_millor_tfg_es_aquest.c", directory: "")
!5 = !DISubroutineType(cc: DW_CC_normal, types: !6)
!6 = !{}
!7 = !DILocation(line: 30, column: 1, scope: !3)
!8 = !DILocation(line: 5, scope: !3)
!9 = !DILocation(line: 9, scope: !3)
!10 = !DILocation(line: 0, scope: !3)
!11 = !DILocation(line: 6, scope: !3)
!12 = !DILocation(line: 6, column: 21, scope: !3)
!13 = !DILocation(line: 6, column: 23, scope: !3)
!14 = !DILocation(line: 7, column: 18, scope: !3)
!15 = !DILocation(line: 7, scope: !3)
!16 = !DILocation(line: 7, column: 13, scope: !3)
!17 = !DILocation(line: 7, column: 9, scope: !3)
!18 = !DILocation(line: 7, column: 22, scope: !3)
!19 = !DILocation(line: 6, column: 32, scope: !3)
!20 = !DILocation(line: 11, scope: !3)
!21 = !DILocation(line: 29, column: 12, scope: !3)
!22 = !DILocation(line: 29, scope: !3)
!23 = distinct !DISubprogram(name: "main..omp_par.1", linkageName: "main..omp_par.1", scope: null, file: !4, type: !24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!24 = !DISubroutineType(types: !6)
!25 = !DILocation(line: 11, scope: !23)
!26 = !DILocation(line: 13, scope: !23)
!27 = !DILocation(line: 11, column: 25, scope: !23)
!28 = !DILocation(line: 0, scope: !23)
!29 = !DILocation(line: 15, scope: !23)
!30 = !DILocation(line: 15, column: 29, scope: !23)
!31 = !DILocation(line: 15, column: 31, scope: !23)
!32 = !DILocation(line: 23, column: 13, scope: !23)
!33 = !DILocation(line: 13, column: 27, scope: !23)
!34 = !DILocation(line: 16, scope: !23)
!35 = !DILocation(line: 15, column: 40, scope: !23)
!36 = distinct !DISubprogram(name: "main..omp_par", linkageName: "main..omp_par", scope: null, file: !4, type: !24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !1)
!37 = !DILocation(line: 16, scope: !36)
!38 = !DILocation(line: 18, scope: !36)
!39 = !DILocation(line: 20, column: 36, scope: !36)
!40 = !DILocation(line: 20, column: 32, scope: !36)
!41 = !DILocation(line: 20, column: 29, scope: !36)
!42 = !DILocation(line: 20, scope: !36)
!43 = !DILocation(line: 18, column: 41, scope: !36)
!44 = !DILocation(line: 16, column: 33, scope: !36)
!45 = !{!46}
!46 = !{i64 2, i64 -1, i64 -1, i1 true}
