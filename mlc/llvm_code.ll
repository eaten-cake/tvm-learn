; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { double }

@__tvm_module_ctx = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMFuncCall = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMBackendGetFuncFromEnv = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMAPISetLastError = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [55 x i8] c"Assert fail: num_args == 3, main: num_args should be 3\00", align 1
@.str.1 = private constant [73 x i8] c"Assert fail: not T.isnullptr(args), main: TVMValue* arg pointer was NULL\00", align 1
@.str.2 = private constant [75 x i8] c"Assert fail: not T.isnullptr(arg_type_ids), main: int* type_codes was NULL\00", align 1
@.str.3 = private constant [134 x i8] c"Assert fail: A_handle_code == 3 or A_handle_code == 13 or A_handle_code == 7 or A_handle_code == 4, main: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [134 x i8] c"Assert fail: B_handle_code == 3 or B_handle_code == 13 or B_handle_code == 7 or B_handle_code == 4, main: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [134 x i8] c"Assert fail: C_handle_code == 3 or C_handle_code == 13 or C_handle_code == 7 or C_handle_code == 4, main: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [101 x i8] c"Assert fail: not T.isnullptr(A_handle), main.A_handle is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.7 = private constant [103 x i8] c"Assert fail: 2 == T.tvm_struct_get(A_handle, 0, 4, \22int32\22), main.A_handle.ndim is expected to equal 2\00", align 1
@.str.8 = private constant [101 x i8] c"Assert fail: not T.isnullptr(B_handle), main.B_handle is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.9 = private constant [103 x i8] c"Assert fail: 2 == T.tvm_struct_get(B_handle, 0, 4, \22int32\22), main.B_handle.ndim is expected to equal 2\00", align 1
@.str.10 = private constant [101 x i8] c"Assert fail: not T.isnullptr(C_handle), main.C_handle is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.11 = private constant [103 x i8] c"Assert fail: 2 == T.tvm_struct_get(C_handle, 0, 4, \22int32\22), main.C_handle.ndim is expected to equal 2\00", align 1
@.str.12 = private constant [239 x i8] c"Assert fail: T.tvm_struct_get(A_handle, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(A_handle, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(A_handle, 0, 7, \22uint16\22) == T.uint16(1), main.A_handle.dtype is expected to be float32\00", align 1
@.str.13 = private constant [173 x i8] c"Assert fail: T.Cast(\22int32\22, main_A_handle_shape[0]) == 1024, Argument main.A_handle.shape[0] has an unsatisfied constraint: 1024 == T.Cast(\22int32\22, main_A_handle_shape[0])\00", align 1
@.str.14 = private constant [173 x i8] c"Assert fail: T.Cast(\22int32\22, main_A_handle_shape[1]) == 1024, Argument main.A_handle.shape[1] has an unsatisfied constraint: 1024 == T.Cast(\22int32\22, main_A_handle_shape[1])\00", align 1
@.str.15 = private constant [167 x i8] c"Assert fail: 1 == T.Cast(\22int32\22, main_A_handle_strides[1]) and 1024 == T.Cast(\22int32\22, main_A_handle_strides[0]), main.A_handle.strides: expected to be compact array\00", align 1
@.str.16 = private constant [196 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(A_handle, 0, 8, \22uint64\22), Argument main.A_handle.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(A_handle, 0, 8, \22uint64\22)\00", align 1
@.str.17 = private constant [176 x i8] c"Assert fail: T.tvm_struct_get(A_handle, 0, 10, \22int32\22) == 2, Argument main.A_handle.device_type has an unsatisfied constraint: 2 == T.tvm_struct_get(A_handle, 0, 10, \22int32\22)\00", align 1
@.str.18 = private constant [89 x i8] c"Assert fail: not T.isnullptr(A), main.A_handle is expected to have non-NULL data pointer\00", align 1
@.str.19 = private constant [239 x i8] c"Assert fail: T.tvm_struct_get(B_handle, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(B_handle, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(B_handle, 0, 7, \22uint16\22) == T.uint16(1), main.B_handle.dtype is expected to be float32\00", align 1
@.str.20 = private constant [173 x i8] c"Assert fail: T.Cast(\22int32\22, main_B_handle_shape[0]) == 1024, Argument main.B_handle.shape[0] has an unsatisfied constraint: 1024 == T.Cast(\22int32\22, main_B_handle_shape[0])\00", align 1
@.str.21 = private constant [173 x i8] c"Assert fail: T.Cast(\22int32\22, main_B_handle_shape[1]) == 1024, Argument main.B_handle.shape[1] has an unsatisfied constraint: 1024 == T.Cast(\22int32\22, main_B_handle_shape[1])\00", align 1
@.str.22 = private constant [167 x i8] c"Assert fail: 1 == T.Cast(\22int32\22, main_B_handle_strides[1]) and 1024 == T.Cast(\22int32\22, main_B_handle_strides[0]), main.B_handle.strides: expected to be compact array\00", align 1
@.str.23 = private constant [196 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(B_handle, 0, 8, \22uint64\22), Argument main.B_handle.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(B_handle, 0, 8, \22uint64\22)\00", align 1
@.str.24 = private constant [176 x i8] c"Assert fail: T.tvm_struct_get(B_handle, 0, 10, \22int32\22) == 2, Argument main.B_handle.device_type has an unsatisfied constraint: 2 == T.tvm_struct_get(B_handle, 0, 10, \22int32\22)\00", align 1
@.str.25 = private constant [182 x i8] c"Assert fail: dev_id == T.tvm_struct_get(B_handle, 0, 9, \22int32\22), Argument main.B_handle.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(B_handle, 0, 9, \22int32\22)\00", align 1
@.str.26 = private constant [89 x i8] c"Assert fail: not T.isnullptr(B), main.B_handle is expected to have non-NULL data pointer\00", align 1
@.str.27 = private constant [239 x i8] c"Assert fail: T.tvm_struct_get(C_handle, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(C_handle, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(C_handle, 0, 7, \22uint16\22) == T.uint16(1), main.C_handle.dtype is expected to be float32\00", align 1
@.str.28 = private constant [173 x i8] c"Assert fail: T.Cast(\22int32\22, main_C_handle_shape[0]) == 1024, Argument main.C_handle.shape[0] has an unsatisfied constraint: 1024 == T.Cast(\22int32\22, main_C_handle_shape[0])\00", align 1
@.str.29 = private constant [173 x i8] c"Assert fail: T.Cast(\22int32\22, main_C_handle_shape[1]) == 1024, Argument main.C_handle.shape[1] has an unsatisfied constraint: 1024 == T.Cast(\22int32\22, main_C_handle_shape[1])\00", align 1
@.str.30 = private constant [167 x i8] c"Assert fail: 1 == T.Cast(\22int32\22, main_C_handle_strides[1]) and 1024 == T.Cast(\22int32\22, main_C_handle_strides[0]), main.C_handle.strides: expected to be compact array\00", align 1
@.str.31 = private constant [196 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(C_handle, 0, 8, \22uint64\22), Argument main.C_handle.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(C_handle, 0, 8, \22uint64\22)\00", align 1
@.str.32 = private constant [176 x i8] c"Assert fail: T.tvm_struct_get(C_handle, 0, 10, \22int32\22) == 2, Argument main.C_handle.device_type has an unsatisfied constraint: 2 == T.tvm_struct_get(C_handle, 0, 10, \22int32\22)\00", align 1
@.str.33 = private constant [182 x i8] c"Assert fail: dev_id == T.tvm_struct_get(C_handle, 0, 9, \22int32\22), Argument main.C_handle.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(C_handle, 0, 9, \22int32\22)\00", align 1
@.str.34 = private constant [89 x i8] c"Assert fail: not T.isnullptr(C), main.C_handle is expected to have non-NULL data pointer\00", align 1
@.tvm_func.__tvm_set_device = internal unnamed_addr global ptr null, align 8
@.str.35 = private constant [17 x i8] c"__tvm_set_device\00", align 1
@.tvm_func.main_kernel = internal unnamed_addr global ptr null, align 8
@.str.36 = private constant [12 x i8] c"main_kernel\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [5 x i8] c"main\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport i32 @main(ptr noalias readonly %args, ptr noalias readonly %arg_type_ids, i32 %num_args, ptr noalias nocapture readnone %out_ret_value, ptr noalias nocapture readnone %out_ret_tcode, ptr noalias nocapture readnone %resource_handle) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %args, !12, !DIExpression(), !18)
    #dbg_value(ptr %arg_type_ids, !13, !DIExpression(), !18)
    #dbg_value(i32 %num_args, !14, !DIExpression(), !18)
    #dbg_value(ptr %out_ret_value, !15, !DIExpression(), !18)
    #dbg_value(ptr %out_ret_tcode, !16, !DIExpression(), !18)
    #dbg_value(ptr %resource_handle, !17, !DIExpression(), !18)
  %0 = alloca ptr, align 8, !dbg !18
  %stack_value79 = alloca [8 x %0], align 8, !dbg !18
  %stack_tcode80 = alloca [8 x i32], align 4, !dbg !18
    #dbg_declare(ptr %stack_tcode80, !19, !DIExpression(), !18)
    #dbg_declare(ptr %stack_tcode80, !19, !DIExpression(), !18)
    #dbg_declare(ptr %stack_value79, !20, !DIExpression(), !18)
    #dbg_declare(ptr %stack_value79, !20, !DIExpression(), !18)
  %1 = icmp eq i32 %num_args, 3, !dbg !18
  br i1 %1, label %assert_end, label %assert_fail, !dbg !18, !prof !21

common.ret:                                       ; preds = %call_end74, %handle_init_end, %handle_init, %assert_fail71, %assert_fail69, %assert_fail67, %assert_fail65, %assert_fail63, %assert_fail59, %assert_fail57, %assert_fail55, %assert_fail53, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail53 ], [ -1, %assert_fail55 ], [ -1, %assert_fail57 ], [ -1, %assert_fail59 ], [ -1, %assert_fail63 ], [ -1, %assert_fail65 ], [ -1, %assert_fail67 ], [ -1, %assert_fail69 ], [ -1, %assert_fail71 ], [ %168, %handle_init ], [ %171, %handle_init_end ], [ %174, %call_end74 ]
  ret i32 %common.ret.op, !dbg !18

assert_fail:                                      ; preds = %entry
  %2 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %2(ptr nonnull @.str), !dbg !18
  br label %common.ret, !dbg !18

assert_end:                                       ; preds = %entry
  %.not = icmp eq ptr %args, null, !dbg !18
  br i1 %.not, label %assert_fail1, label %assert_end2, !dbg !18, !prof !25

assert_fail1:                                     ; preds = %assert_end
  %3 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %3(ptr nonnull @.str.1), !dbg !18
  br label %common.ret, !dbg !18

assert_end2:                                      ; preds = %assert_end
  %.not81 = icmp eq ptr %arg_type_ids, null, !dbg !18
  br i1 %.not81, label %assert_fail3, label %assert_end4, !dbg !18, !prof !25

assert_fail3:                                     ; preds = %assert_end2
  %4 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %4(ptr nonnull @.str.2), !dbg !18
  br label %common.ret, !dbg !18

assert_end4:                                      ; preds = %assert_end2
  %A_handle.code = load i32, ptr %arg_type_ids, align 4, !dbg !18, !tbaa !26
    #dbg_declare(i32 %A_handle.code, !37, !DIExpression(), !18)
    #dbg_declare(i32 %A_handle.code, !37, !DIExpression(), !18)
  switch i32 %A_handle.code, label %assert_fail5 [
    i32 13, label %assert_end6
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 3, label %assert_end6
  ], !dbg !18

assert_fail5:                                     ; preds = %assert_end4
  %5 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %5(ptr nonnull @.str.3), !dbg !18
  br label %common.ret, !dbg !18

assert_end6:                                      ; preds = %assert_end4, %assert_end4, %assert_end4, %assert_end4
  %6 = getelementptr inbounds i8, ptr %arg_type_ids, i64 4, !dbg !18
  %B_handle.code = load i32, ptr %6, align 4, !dbg !18, !tbaa !38
    #dbg_declare(i32 %B_handle.code, !40, !DIExpression(), !18)
    #dbg_declare(i32 %B_handle.code, !40, !DIExpression(), !18)
  switch i32 %B_handle.code, label %assert_fail7 [
    i32 13, label %assert_end8
    i32 7, label %assert_end8
    i32 4, label %assert_end8
    i32 3, label %assert_end8
  ], !dbg !18

assert_fail7:                                     ; preds = %assert_end6
  %7 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %7(ptr nonnull @.str.4), !dbg !18
  br label %common.ret, !dbg !18

assert_end8:                                      ; preds = %assert_end6, %assert_end6, %assert_end6, %assert_end6
  %8 = getelementptr inbounds i8, ptr %arg_type_ids, i64 8, !dbg !18
  %C_handle.code = load i32, ptr %8, align 4, !dbg !18, !tbaa !41
    #dbg_declare(i32 %C_handle.code, !44, !DIExpression(), !18)
    #dbg_declare(i32 %C_handle.code, !44, !DIExpression(), !18)
  switch i32 %C_handle.code, label %assert_fail9 [
    i32 13, label %assert_end10
    i32 7, label %assert_end10
    i32 4, label %assert_end10
    i32 3, label %assert_end10
  ], !dbg !18

assert_fail9:                                     ; preds = %assert_end8
  %9 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %9(ptr nonnull @.str.5), !dbg !18
  br label %common.ret, !dbg !18

assert_end10:                                     ; preds = %assert_end8, %assert_end8, %assert_end8, %assert_end8
  %A_handle = load ptr, ptr %args, align 8, !dbg !18
    #dbg_declare(ptr %A_handle, !45, !DIExpression(), !18)
    #dbg_declare(ptr %A_handle, !45, !DIExpression(), !18)
  %10 = getelementptr inbounds i8, ptr %args, i64 8, !dbg !18
  %B_handle = load ptr, ptr %10, align 8, !dbg !18
    #dbg_declare(ptr %B_handle, !46, !DIExpression(), !18)
    #dbg_declare(ptr %B_handle, !46, !DIExpression(), !18)
  %11 = getelementptr inbounds i8, ptr %args, i64 16, !dbg !18
  %C_handle = load ptr, ptr %11, align 8, !dbg !18
    #dbg_declare(ptr %C_handle, !47, !DIExpression(), !18)
    #dbg_declare(ptr %C_handle, !47, !DIExpression(), !18)
  %.not82 = icmp eq ptr %A_handle, null, !dbg !18
  br i1 %.not82, label %assert_fail11, label %assert_end12, !dbg !18, !prof !25

assert_fail11:                                    ; preds = %assert_end10
  %12 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %12(ptr nonnull @.str.6), !dbg !18
  br label %common.ret, !dbg !18

assert_end12:                                     ; preds = %assert_end10
  %13 = getelementptr inbounds i8, ptr %A_handle, i64 16, !dbg !18
  %14 = load i32, ptr %13, align 4, !dbg !18
  %15 = icmp eq i32 %14, 2, !dbg !18
  br i1 %15, label %assert_end14, label %assert_fail13, !dbg !18, !prof !21

assert_fail13:                                    ; preds = %assert_end12
  %16 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %16(ptr nonnull @.str.7), !dbg !18
  br label %common.ret, !dbg !18

assert_end14:                                     ; preds = %assert_end12
  %17 = getelementptr inbounds i8, ptr %A_handle, i64 24, !dbg !18
  %main.A_handle.shape = load ptr, ptr %17, align 8, !dbg !18
    #dbg_declare(ptr %main.A_handle.shape, !48, !DIExpression(), !18)
    #dbg_declare(ptr %main.A_handle.shape, !48, !DIExpression(), !18)
  %18 = getelementptr inbounds i8, ptr %A_handle, i64 32, !dbg !18
  %main.A_handle.strides = load ptr, ptr %18, align 8, !dbg !18
    #dbg_declare(ptr %main.A_handle.strides, !51, !DIExpression(), !18)
    #dbg_declare(ptr %main.A_handle.strides, !51, !DIExpression(), !18)
  %19 = getelementptr inbounds i8, ptr %A_handle, i64 12, !dbg !18
  %dev_id = load i32, ptr %19, align 4, !dbg !18
    #dbg_declare(i32 %dev_id, !52, !DIExpression(), !18)
    #dbg_declare(i32 %dev_id, !52, !DIExpression(), !18)
  %A = load ptr, ptr %A_handle, align 8, !dbg !18
    #dbg_declare(ptr %A, !53, !DIExpression(), !18)
    #dbg_declare(ptr %A, !53, !DIExpression(), !18)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !18
  %.not83 = icmp eq ptr %B_handle, null, !dbg !18
  br i1 %.not83, label %assert_fail15, label %assert_end16, !dbg !18, !prof !25

assert_fail15:                                    ; preds = %assert_end14
  %20 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %20(ptr nonnull @.str.8), !dbg !18
  br label %common.ret, !dbg !18

assert_end16:                                     ; preds = %assert_end14
  %21 = getelementptr inbounds i8, ptr %B_handle, i64 16, !dbg !18
  %22 = load i32, ptr %21, align 4, !dbg !18
  %23 = icmp eq i32 %22, 2, !dbg !18
  br i1 %23, label %assert_end18, label %assert_fail17, !dbg !18, !prof !21

assert_fail17:                                    ; preds = %assert_end16
  %24 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %24(ptr nonnull @.str.9), !dbg !18
  br label %common.ret, !dbg !18

assert_end18:                                     ; preds = %assert_end16
  %25 = getelementptr inbounds i8, ptr %B_handle, i64 24, !dbg !18
  %main.B_handle.shape = load ptr, ptr %25, align 8, !dbg !18
    #dbg_declare(ptr %main.B_handle.shape, !56, !DIExpression(), !18)
    #dbg_declare(ptr %main.B_handle.shape, !56, !DIExpression(), !18)
  %26 = getelementptr inbounds i8, ptr %B_handle, i64 32, !dbg !18
  %main.B_handle.strides = load ptr, ptr %26, align 8, !dbg !18
    #dbg_declare(ptr %main.B_handle.strides, !57, !DIExpression(), !18)
    #dbg_declare(ptr %main.B_handle.strides, !57, !DIExpression(), !18)
  %B = load ptr, ptr %B_handle, align 8, !dbg !18
    #dbg_declare(ptr %B, !58, !DIExpression(), !18)
    #dbg_declare(ptr %B, !58, !DIExpression(), !18)
  call void @llvm.assume(i1 true) [ "align"(ptr %B, i64 64) ], !dbg !18
  %.not84 = icmp eq ptr %C_handle, null, !dbg !18
  br i1 %.not84, label %assert_fail19, label %assert_end20, !dbg !18, !prof !25

assert_fail19:                                    ; preds = %assert_end18
  %27 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %27(ptr nonnull @.str.10), !dbg !18
  br label %common.ret, !dbg !18

assert_end20:                                     ; preds = %assert_end18
  %28 = getelementptr inbounds i8, ptr %C_handle, i64 16, !dbg !18
  %29 = load i32, ptr %28, align 4, !dbg !18
  %30 = icmp eq i32 %29, 2, !dbg !18
  br i1 %30, label %assert_end22, label %assert_fail21, !dbg !18, !prof !21

assert_fail21:                                    ; preds = %assert_end20
  %31 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %31(ptr nonnull @.str.11), !dbg !18
  br label %common.ret, !dbg !18

assert_end22:                                     ; preds = %assert_end20
  %32 = getelementptr inbounds i8, ptr %C_handle, i64 24, !dbg !18
  %main.C_handle.shape = load ptr, ptr %32, align 8, !dbg !18
    #dbg_declare(ptr %main.C_handle.shape, !59, !DIExpression(), !18)
    #dbg_declare(ptr %main.C_handle.shape, !59, !DIExpression(), !18)
  %33 = getelementptr inbounds i8, ptr %C_handle, i64 32, !dbg !18
  %main.C_handle.strides = load ptr, ptr %33, align 8, !dbg !18
    #dbg_declare(ptr %main.C_handle.strides, !60, !DIExpression(), !18)
    #dbg_declare(ptr %main.C_handle.strides, !60, !DIExpression(), !18)
  %C = load ptr, ptr %C_handle, align 8, !dbg !18
    #dbg_declare(ptr %C, !61, !DIExpression(), !18)
    #dbg_declare(ptr %C, !61, !DIExpression(), !18)
  call void @llvm.assume(i1 true) [ "align"(ptr %C, i64 64) ], !dbg !18
  %34 = getelementptr inbounds i8, ptr %A_handle, i64 22, !dbg !18
  %35 = load i16, ptr %34, align 2, !dbg !18
  %36 = icmp eq i16 %35, 1, !dbg !18
  %37 = getelementptr inbounds i8, ptr %A_handle, i64 21, !dbg !18
  %38 = load i8, ptr %37, align 1, !dbg !18
  %39 = icmp eq i8 %38, 32, !dbg !18
  %40 = getelementptr inbounds i8, ptr %A_handle, i64 20, !dbg !18
  %41 = load i8, ptr %40, align 1, !dbg !18
  %42 = icmp eq i8 %41, 2, !dbg !18
  %43 = and i1 %39, %42, !dbg !18
  %44 = and i1 %36, %43, !dbg !18
  br i1 %44, label %assert_end24, label %assert_fail23, !dbg !18, !prof !21

assert_fail23:                                    ; preds = %assert_end22
  %45 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %45(ptr nonnull @.str.12), !dbg !18
  br label %common.ret, !dbg !18

assert_end24:                                     ; preds = %assert_end22
  %46 = load i64, ptr %main.A_handle.shape, align 8, !dbg !18, !tbaa !62
  %47 = and i64 %46, 4294967295, !dbg !18
  %48 = icmp eq i64 %47, 1024, !dbg !18
  br i1 %48, label %assert_end26, label %assert_fail25, !dbg !18, !prof !21

assert_fail25:                                    ; preds = %assert_end24
  %49 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %49(ptr nonnull @.str.13), !dbg !18
  br label %common.ret, !dbg !18

assert_end26:                                     ; preds = %assert_end24
  %50 = getelementptr inbounds i8, ptr %main.A_handle.shape, i64 8, !dbg !18
  %51 = load i64, ptr %50, align 8, !dbg !18, !tbaa !72
  %52 = and i64 %51, 4294967295, !dbg !18
  %53 = icmp eq i64 %52, 1024, !dbg !18
  br i1 %53, label %assert_end28, label %assert_fail27, !dbg !18, !prof !21

assert_fail27:                                    ; preds = %assert_end26
  %54 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %54(ptr nonnull @.str.14), !dbg !18
  br label %common.ret, !dbg !18

assert_end28:                                     ; preds = %assert_end26
  %.not85 = icmp eq ptr %main.A_handle.strides, null, !dbg !18
  br i1 %.not85, label %if_end, label %if_then, !dbg !18, !prof !25

if_then:                                          ; preds = %assert_end28
  %55 = load i64, ptr %main.A_handle.strides, align 8, !dbg !18, !tbaa !74
  %56 = and i64 %55, 4294967295, !dbg !18
  %57 = icmp eq i64 %56, 1024, !dbg !18
  %58 = getelementptr inbounds i8, ptr %main.A_handle.strides, i64 8, !dbg !18
  %59 = load i64, ptr %58, align 8, !dbg !18, !tbaa !84
  %60 = and i64 %59, 4294967295, !dbg !18
  %61 = icmp eq i64 %60, 1, !dbg !18
  %62 = and i1 %57, %61, !dbg !18
  br i1 %62, label %if_end, label %assert_fail29, !dbg !18, !prof !21

if_end:                                           ; preds = %if_then, %assert_end28
  %63 = getelementptr inbounds i8, ptr %A_handle, i64 40, !dbg !18
  %64 = load i64, ptr %63, align 8, !dbg !18
  %65 = icmp eq i64 %64, 0, !dbg !18
  br i1 %65, label %assert_end32, label %assert_fail31, !dbg !18, !prof !21

assert_fail29:                                    ; preds = %if_then
  %66 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %66(ptr nonnull @.str.15), !dbg !18
  br label %common.ret, !dbg !18

assert_fail31:                                    ; preds = %if_end
  %67 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %67(ptr nonnull @.str.16), !dbg !18
  br label %common.ret, !dbg !18

assert_end32:                                     ; preds = %if_end
  %68 = getelementptr inbounds i8, ptr %A_handle, i64 8, !dbg !18
  %69 = load i32, ptr %68, align 4, !dbg !18
  %70 = icmp eq i32 %69, 2, !dbg !18
  br i1 %70, label %assert_end34, label %assert_fail33, !dbg !18, !prof !21

assert_fail33:                                    ; preds = %assert_end32
  %71 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %71(ptr nonnull @.str.17), !dbg !18
  br label %common.ret, !dbg !18

assert_end34:                                     ; preds = %assert_end32
  %.not86 = icmp eq ptr %A, null, !dbg !18
  br i1 %.not86, label %assert_fail35, label %assert_end36, !dbg !18, !prof !25

assert_fail35:                                    ; preds = %assert_end34
  %72 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %72(ptr nonnull @.str.18), !dbg !18
  br label %common.ret, !dbg !18

assert_end36:                                     ; preds = %assert_end34
  %73 = getelementptr inbounds i8, ptr %B_handle, i64 22, !dbg !18
  %74 = load i16, ptr %73, align 2, !dbg !18
  %75 = icmp eq i16 %74, 1, !dbg !18
  %76 = getelementptr inbounds i8, ptr %B_handle, i64 21, !dbg !18
  %77 = load i8, ptr %76, align 1, !dbg !18
  %78 = icmp eq i8 %77, 32, !dbg !18
  %79 = getelementptr inbounds i8, ptr %B_handle, i64 20, !dbg !18
  %80 = load i8, ptr %79, align 1, !dbg !18
  %81 = icmp eq i8 %80, 2, !dbg !18
  %82 = and i1 %78, %81, !dbg !18
  %83 = and i1 %75, %82, !dbg !18
  br i1 %83, label %assert_end38, label %assert_fail37, !dbg !18, !prof !21

assert_fail37:                                    ; preds = %assert_end36
  %84 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %84(ptr nonnull @.str.19), !dbg !18
  br label %common.ret, !dbg !18

assert_end38:                                     ; preds = %assert_end36
  %85 = load i64, ptr %main.B_handle.shape, align 8, !dbg !18, !tbaa !86
  %86 = and i64 %85, 4294967295, !dbg !18
  %87 = icmp eq i64 %86, 1024, !dbg !18
  br i1 %87, label %assert_end40, label %assert_fail39, !dbg !18, !prof !21

assert_fail39:                                    ; preds = %assert_end38
  %88 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %88(ptr nonnull @.str.20), !dbg !18
  br label %common.ret, !dbg !18

assert_end40:                                     ; preds = %assert_end38
  %89 = getelementptr inbounds i8, ptr %main.B_handle.shape, i64 8, !dbg !18
  %90 = load i64, ptr %89, align 8, !dbg !18, !tbaa !96
  %91 = and i64 %90, 4294967295, !dbg !18
  %92 = icmp eq i64 %91, 1024, !dbg !18
  br i1 %92, label %assert_end42, label %assert_fail41, !dbg !18, !prof !21

assert_fail41:                                    ; preds = %assert_end40
  %93 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %93(ptr nonnull @.str.21), !dbg !18
  br label %common.ret, !dbg !18

assert_end42:                                     ; preds = %assert_end40
  %.not87 = icmp eq ptr %main.B_handle.strides, null, !dbg !18
  br i1 %.not87, label %if_end44, label %if_then43, !dbg !18, !prof !25

if_then43:                                        ; preds = %assert_end42
  %94 = load i64, ptr %main.B_handle.strides, align 8, !dbg !18, !tbaa !98
  %95 = and i64 %94, 4294967295, !dbg !18
  %96 = icmp eq i64 %95, 1024, !dbg !18
  %97 = getelementptr inbounds i8, ptr %main.B_handle.strides, i64 8, !dbg !18
  %98 = load i64, ptr %97, align 8, !dbg !18, !tbaa !108
  %99 = and i64 %98, 4294967295, !dbg !18
  %100 = icmp eq i64 %99, 1, !dbg !18
  %101 = and i1 %96, %100, !dbg !18
  br i1 %101, label %if_end44, label %assert_fail45, !dbg !18, !prof !21

if_end44:                                         ; preds = %if_then43, %assert_end42
  %102 = getelementptr inbounds i8, ptr %B_handle, i64 40, !dbg !18
  %103 = load i64, ptr %102, align 8, !dbg !18
  %104 = icmp eq i64 %103, 0, !dbg !18
  br i1 %104, label %assert_end48, label %assert_fail47, !dbg !18, !prof !21

assert_fail45:                                    ; preds = %if_then43
  %105 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %105(ptr nonnull @.str.22), !dbg !18
  br label %common.ret, !dbg !18

assert_fail47:                                    ; preds = %if_end44
  %106 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %106(ptr nonnull @.str.23), !dbg !18
  br label %common.ret, !dbg !18

assert_end48:                                     ; preds = %if_end44
  %107 = getelementptr inbounds i8, ptr %B_handle, i64 8, !dbg !18
  %108 = load i32, ptr %107, align 4, !dbg !18
  %109 = icmp eq i32 %108, 2, !dbg !18
  br i1 %109, label %assert_end50, label %assert_fail49, !dbg !18, !prof !21

assert_fail49:                                    ; preds = %assert_end48
  %110 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %110(ptr nonnull @.str.24), !dbg !18
  br label %common.ret, !dbg !18

assert_end50:                                     ; preds = %assert_end48
  %111 = getelementptr inbounds i8, ptr %B_handle, i64 12, !dbg !18
  %112 = load i32, ptr %111, align 4, !dbg !18
  %113 = icmp eq i32 %dev_id, %112, !dbg !18
  br i1 %113, label %assert_end52, label %assert_fail51, !dbg !18, !prof !21

assert_fail51:                                    ; preds = %assert_end50
  %114 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %114(ptr nonnull @.str.25), !dbg !18
  br label %common.ret, !dbg !18

assert_end52:                                     ; preds = %assert_end50
  %.not88 = icmp eq ptr %B, null, !dbg !18
  br i1 %.not88, label %assert_fail53, label %assert_end54, !dbg !18, !prof !25

assert_fail53:                                    ; preds = %assert_end52
  %115 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %115(ptr nonnull @.str.26), !dbg !18
  br label %common.ret, !dbg !18

assert_end54:                                     ; preds = %assert_end52
  %116 = getelementptr inbounds i8, ptr %C_handle, i64 22, !dbg !18
  %117 = load i16, ptr %116, align 2, !dbg !18
  %118 = icmp eq i16 %117, 1, !dbg !18
  %119 = getelementptr inbounds i8, ptr %C_handle, i64 21, !dbg !18
  %120 = load i8, ptr %119, align 1, !dbg !18
  %121 = icmp eq i8 %120, 32, !dbg !18
  %122 = getelementptr inbounds i8, ptr %C_handle, i64 20, !dbg !18
  %123 = load i8, ptr %122, align 1, !dbg !18
  %124 = icmp eq i8 %123, 2, !dbg !18
  %125 = and i1 %121, %124, !dbg !18
  %126 = and i1 %118, %125, !dbg !18
  br i1 %126, label %assert_end56, label %assert_fail55, !dbg !18, !prof !21

assert_fail55:                                    ; preds = %assert_end54
  %127 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %127(ptr nonnull @.str.27), !dbg !18
  br label %common.ret, !dbg !18

assert_end56:                                     ; preds = %assert_end54
  %128 = load i64, ptr %main.C_handle.shape, align 8, !dbg !18, !tbaa !110
  %129 = and i64 %128, 4294967295, !dbg !18
  %130 = icmp eq i64 %129, 1024, !dbg !18
  br i1 %130, label %assert_end58, label %assert_fail57, !dbg !18, !prof !21

assert_fail57:                                    ; preds = %assert_end56
  %131 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %131(ptr nonnull @.str.28), !dbg !18
  br label %common.ret, !dbg !18

assert_end58:                                     ; preds = %assert_end56
  %132 = getelementptr inbounds i8, ptr %main.C_handle.shape, i64 8, !dbg !18
  %133 = load i64, ptr %132, align 8, !dbg !18, !tbaa !120
  %134 = and i64 %133, 4294967295, !dbg !18
  %135 = icmp eq i64 %134, 1024, !dbg !18
  br i1 %135, label %assert_end60, label %assert_fail59, !dbg !18, !prof !21

assert_fail59:                                    ; preds = %assert_end58
  %136 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %136(ptr nonnull @.str.29), !dbg !18
  br label %common.ret, !dbg !18

assert_end60:                                     ; preds = %assert_end58
  %.not89 = icmp eq ptr %main.C_handle.strides, null, !dbg !18
  br i1 %.not89, label %if_end62, label %if_then61, !dbg !18, !prof !25

if_then61:                                        ; preds = %assert_end60
  %137 = load i64, ptr %main.C_handle.strides, align 8, !dbg !18, !tbaa !122
  %138 = and i64 %137, 4294967295, !dbg !18
  %139 = icmp eq i64 %138, 1024, !dbg !18
  %140 = getelementptr inbounds i8, ptr %main.C_handle.strides, i64 8, !dbg !18
  %141 = load i64, ptr %140, align 8, !dbg !18, !tbaa !132
  %142 = and i64 %141, 4294967295, !dbg !18
  %143 = icmp eq i64 %142, 1, !dbg !18
  %144 = and i1 %139, %143, !dbg !18
  br i1 %144, label %if_end62, label %assert_fail63, !dbg !18, !prof !21

if_end62:                                         ; preds = %if_then61, %assert_end60
  %145 = getelementptr inbounds i8, ptr %C_handle, i64 40, !dbg !18
  %146 = load i64, ptr %145, align 8, !dbg !18
  %147 = icmp eq i64 %146, 0, !dbg !18
  br i1 %147, label %assert_end66, label %assert_fail65, !dbg !18, !prof !21

assert_fail63:                                    ; preds = %if_then61
  %148 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %148(ptr nonnull @.str.30), !dbg !18
  br label %common.ret, !dbg !18

assert_fail65:                                    ; preds = %if_end62
  %149 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %149(ptr nonnull @.str.31), !dbg !18
  br label %common.ret, !dbg !18

assert_end66:                                     ; preds = %if_end62
  %150 = getelementptr inbounds i8, ptr %C_handle, i64 8, !dbg !18
  %151 = load i32, ptr %150, align 4, !dbg !18
  %152 = icmp eq i32 %151, 2, !dbg !18
  br i1 %152, label %assert_end68, label %assert_fail67, !dbg !18, !prof !21

assert_fail67:                                    ; preds = %assert_end66
  %153 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %153(ptr nonnull @.str.32), !dbg !18
  br label %common.ret, !dbg !18

assert_end68:                                     ; preds = %assert_end66
  %154 = getelementptr inbounds i8, ptr %C_handle, i64 12, !dbg !18
  %155 = load i32, ptr %154, align 4, !dbg !18
  %156 = icmp eq i32 %dev_id, %155, !dbg !18
  br i1 %156, label %assert_end70, label %assert_fail69, !dbg !18, !prof !21

assert_fail69:                                    ; preds = %assert_end68
  %157 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %157(ptr nonnull @.str.33), !dbg !18
  br label %common.ret, !dbg !18

assert_end70:                                     ; preds = %assert_end68
  %.not90 = icmp eq ptr %C, null, !dbg !18
  br i1 %.not90, label %assert_fail71, label %assert_end72, !dbg !18, !prof !25

assert_fail71:                                    ; preds = %assert_end70
  %158 = load ptr, ptr @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !22
  tail call void %158(ptr nonnull @.str.34), !dbg !18
  br label %common.ret, !dbg !18

assert_end72:                                     ; preds = %assert_end70
  store i64 2, ptr %stack_value79, align 8, !dbg !18
  store i32 0, ptr %stack_tcode80, align 4, !dbg !18, !tbaa !134
  %159 = sext i32 %dev_id to i64, !dbg !18
  %160 = getelementptr inbounds i8, ptr %stack_value79, i64 8, !dbg !18
  store i64 %159, ptr %160, align 8, !dbg !18
  %161 = getelementptr inbounds i8, ptr %stack_tcode80, i64 4, !dbg !18
  store i32 0, ptr %161, align 4, !dbg !18, !tbaa !145
  %162 = getelementptr inbounds i8, ptr %stack_value79, i64 16, !dbg !18
  %163 = getelementptr inbounds i8, ptr %stack_tcode80, i64 8, !dbg !18
  %164 = load ptr, ptr @__TVMFuncCall, align 8, !dbg !18, !tbaa !22
  %165 = load ptr, ptr @.tvm_func.__tvm_set_device, align 8, !dbg !18
  %.not91 = icmp eq ptr %165, null, !dbg !18
  br i1 %.not91, label %handle_init, label %handle_init_end, !dbg !18, !prof !25

handle_init:                                      ; preds = %assert_end72
  %166 = load ptr, ptr @__tvm_module_ctx, align 8, !dbg !18, !tbaa !22
  %167 = load ptr, ptr @__TVMBackendGetFuncFromEnv, align 8, !dbg !18, !tbaa !22
  %168 = call i32 %167(ptr %166, ptr nonnull @.str.35, ptr nonnull %0), !dbg !18
  %169 = icmp eq i32 %168, 0, !dbg !18
  br i1 %169, label %call_end, label %common.ret, !dbg !18, !prof !21

handle_init_end:                                  ; preds = %call_end, %assert_end72
  %170 = phi ptr [ %165, %assert_end72 ], [ %173, %call_end ], !dbg !18
  %171 = call i32 %164(ptr %170, ptr nonnull %stack_value79, ptr nonnull %stack_tcode80, i32 2, ptr nonnull %162, ptr nonnull %163), !dbg !18
  %172 = icmp eq i32 %171, 0, !dbg !18
  br i1 %172, label %call_end74, label %common.ret, !dbg !18, !prof !21

call_end:                                         ; preds = %handle_init
  %173 = load ptr, ptr %0, align 8, !dbg !18
  store ptr %173, ptr @.tvm_func.__tvm_set_device, align 8, !dbg !18
  br label %handle_init_end, !dbg !18

call_end74:                                       ; preds = %handle_init_end
  %174 = call fastcc i32 @main_compute_(ptr nonnull %stack_value79, ptr nonnull %A, ptr nonnull %stack_tcode80, ptr nonnull %B, ptr nonnull %C), !dbg !18
  br label %common.ret, !dbg !18
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: noinline
define internal fastcc i32 @main_compute_(ptr noalias %stack_value, ptr noalias align 64 %A, ptr noalias %stack_tcode, ptr noalias align 64 %B, ptr noalias align 64 %C) unnamed_addr #2 !dbg !147 {
entry:
    #dbg_value(ptr %stack_value, !151, !DIExpression(), !156)
    #dbg_value(ptr %A, !152, !DIExpression(), !156)
    #dbg_value(ptr %stack_tcode, !153, !DIExpression(), !156)
    #dbg_value(ptr %B, !154, !DIExpression(), !156)
    #dbg_value(ptr %C, !155, !DIExpression(), !156)
  %0 = alloca ptr, align 8, !dbg !156
  store ptr %A, ptr %stack_value, align 8, !dbg !156
  %1 = insertelement <2 x ptr> poison, ptr %A, i64 0, !dbg !156
  %2 = insertelement <2 x ptr> %1, ptr %B, i64 1, !dbg !156
  %3 = icmp eq <2 x ptr> %2, zeroinitializer, !dbg !156
  %4 = getelementptr inbounds i8, ptr %stack_value, i64 8, !dbg !156
  store ptr %B, ptr %4, align 8, !dbg !156
  %5 = select <2 x i1> %3, <2 x i32> <i32 4, i32 4>, <2 x i32> <i32 3, i32 3>, !dbg !156
  store <2 x i32> %5, ptr %stack_tcode, align 4, !dbg !156
  %6 = getelementptr inbounds i8, ptr %stack_value, i64 16, !dbg !156
  store ptr %C, ptr %6, align 8, !dbg !156
  %7 = icmp eq ptr %C, null, !dbg !156
  %.sink10 = select i1 %7, i32 4, i32 3, !dbg !156
  %8 = getelementptr inbounds i8, ptr %stack_tcode, i64 8, !dbg !156
  store i32 %.sink10, ptr %8, align 4, !dbg !156
  %9 = getelementptr inbounds i8, ptr %stack_value, i64 24, !dbg !156
  store i64 16, ptr %9, align 8, !dbg !156
  %10 = getelementptr inbounds i8, ptr %stack_tcode, i64 12, !dbg !156
  %11 = getelementptr inbounds i8, ptr %stack_value, i64 32, !dbg !156
  store i64 16, ptr %11, align 8, !dbg !156
  %12 = getelementptr inbounds i8, ptr %stack_value, i64 40, !dbg !156
  store i64 8, ptr %12, align 8, !dbg !156
  %13 = getelementptr inbounds i8, ptr %stack_value, i64 48, !dbg !156
  store i64 8, ptr %13, align 8, !dbg !156
  store <4 x i32> zeroinitializer, ptr %10, align 4, !dbg !156, !tbaa !157
  %14 = getelementptr inbounds i8, ptr %stack_value, i64 56, !dbg !156
  %15 = getelementptr inbounds i8, ptr %stack_tcode, i64 28, !dbg !156
  %16 = load ptr, ptr @__TVMFuncCall, align 8, !dbg !156, !tbaa !22
  %17 = load ptr, ptr @.tvm_func.main_kernel, align 8, !dbg !156
  %.not = icmp eq ptr %17, null, !dbg !156
  br i1 %.not, label %handle_init, label %handle_init_end, !dbg !156, !prof !25

handle_init:                                      ; preds = %entry
  %18 = load ptr, ptr @__tvm_module_ctx, align 8, !dbg !156, !tbaa !22
  %19 = load ptr, ptr @__TVMBackendGetFuncFromEnv, align 8, !dbg !156, !tbaa !22
  %20 = call i32 %19(ptr %18, ptr nonnull @.str.36, ptr nonnull %0), !dbg !156
  %21 = icmp eq i32 %20, 0, !dbg !156
  br i1 %21, label %call_end, label %common.ret, !dbg !156, !prof !21

handle_init_end:                                  ; preds = %call_end, %entry
  %22 = phi ptr [ %17, %entry ], [ %24, %call_end ], !dbg !156
  %23 = call i32 %16(ptr %22, ptr nonnull %stack_value, ptr nonnull %stack_tcode, i32 7, ptr nonnull %14, ptr nonnull %15), !dbg !156
  br label %common.ret, !dbg !156

common.ret:                                       ; preds = %handle_init_end, %handle_init
  %common.ret.op = phi i32 [ %20, %handle_init ], [ %23, %handle_init_end ]
  ret i32 %common.ret.op, !dbg !156

call_end:                                         ; preds = %handle_init
  %24 = load ptr, ptr %0, align 8, !dbg !156
  store ptr %24, ptr @.tvm_func.main_kernel, align 8, !dbg !156
  br label %handle_init_end, !dbg !156
}

; Function Attrs: nofree nosync nounwind memory(none)
define weak dso_local half @__truncsfhf2(float %a0) local_unnamed_addr #3 section ".text.tvm.fp16.conv" {
b0:
  %v0 = bitcast float %a0 to i32
  %0 = tail call float @llvm.fabs.f32(float %a0)
  %v1 = bitcast float %0 to i32
  %v2 = add nsw i32 %v1, -947912704
  %v3 = add nsw i32 %v1, -1199570944
  %v4 = icmp ult i32 %v2, %v3
  br i1 %v4, label %b1, label %b5

b1:                                               ; preds = %b0
  %v5 = lshr i32 %v0, 13
  %v7 = add nsw i32 %v5, -114688
  %v8 = and i32 %v0, 8191
  %v9 = icmp ugt i32 %v8, 4096
  br i1 %v9, label %b2, label %b3

b2:                                               ; preds = %b1
  %v10 = add nsw i32 %v5, -114687
  br label %b13

b3:                                               ; preds = %b1
  %v11 = icmp eq i32 %v8, 4096
  br i1 %v11, label %b4, label %b13

b4:                                               ; preds = %b3
  %v13 = and i32 %v5, 1
  %v14 = add nsw i32 %v7, %v13
  br label %b13

b5:                                               ; preds = %b0
  %v15 = icmp ugt i32 %v1, 2139095040
  br i1 %v15, label %b6, label %b7

b6:                                               ; preds = %b5
  %v16 = lshr i32 %v0, 13
  %v17 = and i32 %v16, 511
  %v18 = or disjoint i32 %v17, 32256
  br label %b13

b7:                                               ; preds = %b5
  %v19 = icmp ugt i32 %v1, 1199570943
  br i1 %v19, label %b13, label %b8

b8:                                               ; preds = %b7
  %v20 = icmp ult i32 %v1, 754974720
  br i1 %v20, label %b13, label %b9

b9:                                               ; preds = %b8
  %v21 = lshr i32 %v1, 23
  %v22 = sub nsw i32 113, %v21
  %v23 = and i32 %v0, 8388607
  %v24 = or disjoint i32 %v23, 8388608
  %v25 = add nsw i32 %v21, -81
  %v26 = shl i32 %v24, %v25
  %v27 = icmp ne i32 %v26, 0
  %v28 = lshr i32 %v24, %v22
  %v29 = zext i1 %v27 to i32
  %v30 = lshr i32 %v28, 13
  %v31 = and i32 %v28, 8191
  %v32 = or i32 %v31, %v29
  %v33 = icmp ugt i32 %v32, 4096
  br i1 %v33, label %b10, label %b11

b10:                                              ; preds = %b9
  %v34 = add nuw nsw i32 %v30, 1
  br label %b13

b11:                                              ; preds = %b9
  %v35 = icmp eq i32 %v32, 4096
  br i1 %v35, label %b12, label %b13

b12:                                              ; preds = %b11
  %v36 = and i32 %v30, 1
  %v37 = add nuw nsw i32 %v36, %v30
  br label %b13

b13:                                              ; preds = %b12, %b11, %b10, %b8, %b7, %b6, %b4, %b3, %b2
  %v38 = phi i32 [ %v18, %b6 ], [ %v10, %b2 ], [ %v14, %b4 ], [ %v7, %b3 ], [ 31744, %b7 ], [ 0, %b8 ], [ %v34, %b10 ], [ %v37, %b12 ], [ %v30, %b11 ]
  %v39 = lshr i32 %v0, 16
  %v40 = and i32 %v39, 32768
  %v41 = or i32 %v38, %v40
  %vlast = trunc i32 %v41 to i16
  %vres = bitcast i16 %vlast to half
  ret half %vres
}

; Function Attrs: nofree nosync nounwind memory(none)
define weak dso_local float @__extendhfsf2(half %a0) local_unnamed_addr #3 section ".text.tvm.fp16.conv" {
b0:
  %0 = tail call half @llvm.fabs.f16(half %a0)
  %v1 = bitcast half %0 to i16
  %v2 = zext nneg i16 %v1 to i32
  %v3 = add nsw i16 %v1, -1024
  %v4 = icmp ult i16 %v3, 30720
  br i1 %v4, label %b1, label %b2

b1:                                               ; preds = %b0
  %v5 = shl nuw nsw i32 %v2, 13
  %v6 = add nuw nsw i32 %v5, 939524096
  br label %b6

b2:                                               ; preds = %b0
  %v7 = icmp ugt i16 %v1, 31743
  br i1 %v7, label %b3, label %b4

b3:                                               ; preds = %b2
  %v8 = shl nuw nsw i32 %v2, 13
  %v9 = or i32 %v8, 2139095040
  br label %b6

b4:                                               ; preds = %b2
  %v10 = icmp eq i16 %v1, 0
  br i1 %v10, label %b6, label %b5

b5:                                               ; preds = %b4
  %v11 = icmp ult i16 %v1, 256
  %v12 = lshr i32 %v2, 8
  %v13 = select i1 %v11, i32 %v2, i32 %v12
  %v14 = select i1 %v11, i32 32, i32 24
  %v15 = icmp ult i32 %v13, 16
  %v16 = lshr i32 %v13, 4
  %v17 = add nsw i32 %v14, -4
  %v18 = select i1 %v15, i32 %v13, i32 %v16
  %v19 = select i1 %v15, i32 %v14, i32 %v17
  %v20 = icmp ult i32 %v18, 4
  %v21 = lshr i32 %v18, 2
  %v22 = add nsw i32 %v19, -2
  %v23 = select i1 %v20, i32 %v18, i32 %v21
  %v24 = select i1 %v20, i32 %v19, i32 %v22
  %v25 = icmp ult i32 %v23, 2
  %v26 = sub nsw i32 0, %v23
  %v27 = select i1 %v25, i32 %v26, i32 -2
  %v28 = add nsw i32 %v27, %v24
  %v29 = add nsw i32 %v28, -8
  %v30 = shl i32 %v2, %v29
  %v31 = xor i32 %v30, 8388608
  %v32 = shl i32 %v28, 23
  %v33 = sub i32 1124073472, %v32
  %v34 = or i32 %v31, %v33
  br label %b6

b6:                                               ; preds = %b5, %b4, %b3, %b1
  %v35 = phi i32 [ %v6, %b1 ], [ %v9, %b3 ], [ %v34, %b5 ], [ 0, %b4 ]
  %vinp = bitcast half %a0 to i16
  %v36 = and i16 %vinp, -32768
  %v37 = zext i16 %v36 to i32
  %v38 = shl nuw i32 %v37, 16
  %v39 = or i32 %v35, %v38
  %v40 = bitcast i32 %v39 to float
  ret float %v40
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #4

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { noinline "target-cpu"="generic" }
attributes #3 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "main", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !11)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !9, !10, !8, !9, !10, !9}
!8 = !DIBasicType(name: "int32", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8)
!11 = !{!12, !13, !14, !15, !16, !17}
!12 = !DILocalVariable(name: "args", arg: 1, scope: !5, file: !1, type: !9)
!13 = !DILocalVariable(name: "arg_type_ids", arg: 2, scope: !5, file: !1, type: !10)
!14 = !DILocalVariable(name: "num_args", arg: 3, scope: !5, file: !1, type: !8)
!15 = !DILocalVariable(name: "out_ret_value", arg: 4, scope: !5, file: !1, type: !9)
!16 = !DILocalVariable(name: "out_ret_tcode", arg: 5, scope: !5, file: !1, type: !10)
!17 = !DILocalVariable(name: "resource_handle", arg: 6, scope: !5, file: !1, type: !9)
!18 = !DILocation(line: 0, scope: !5)
!19 = !DILocalVariable(name: "stack_tcode", scope: !5, file: !1, type: !10)
!20 = !DILocalVariable(name: "stack_value", scope: !5, file: !1, type: !9)
!21 = !{!"branch_weights", i32 1048576, i32 1}
!22 = !{!23, !23, i64 0}
!23 = !{!"ctx_ptr", !24, i64 0}
!24 = !{!"tvm-tbaa"}
!25 = !{!"branch_weights", i32 1, i32 1048576}
!26 = !{!27, !27, i64 0}
!27 = !{!"0xfd95ae0.w4.b0", !28, i64 0}
!28 = !{!"0xfd95ae0.w8.b0", !29, i64 0}
!29 = !{!"0xfd95ae0.w16.b0", !30, i64 0}
!30 = !{!"0xfd95ae0.w32.b0", !31, i64 0}
!31 = !{!"0xfd95ae0.w64.b0", !32, i64 0}
!32 = !{!"0xfd95ae0.w128.b0", !33, i64 0}
!33 = !{!"0xfd95ae0.w256.b0", !34, i64 0}
!34 = !{!"0xfd95ae0.w512.b0", !35, i64 0}
!35 = !{!"0xfd95ae0.w1024.b0", !36, i64 0}
!36 = !{!"0xfd95ae0", !24, i64 0}
!37 = !DILocalVariable(name: "A_handle.code", scope: !5, file: !1, type: !8)
!38 = !{!39, !39, i64 0}
!39 = !{!"0xfd95ae0.w4.b4", !28, i64 0}
!40 = !DILocalVariable(name: "B_handle.code", scope: !5, file: !1, type: !8)
!41 = !{!42, !42, i64 0}
!42 = !{!"0xfd95ae0.w4.b8", !43, i64 0}
!43 = !{!"0xfd95ae0.w8.b8", !29, i64 0}
!44 = !DILocalVariable(name: "C_handle.code", scope: !5, file: !1, type: !8)
!45 = !DILocalVariable(name: "A_handle", scope: !5, file: !1, type: !9)
!46 = !DILocalVariable(name: "B_handle", scope: !5, file: !1, type: !9)
!47 = !DILocalVariable(name: "C_handle", scope: !5, file: !1, type: !9)
!48 = !DILocalVariable(name: "main.A_handle.shape", scope: !5, file: !1, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50)
!50 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "main.A_handle.strides", scope: !5, file: !1, type: !49)
!52 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!53 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55)
!55 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!56 = !DILocalVariable(name: "main.B_handle.shape", scope: !5, file: !1, type: !49)
!57 = !DILocalVariable(name: "main.B_handle.strides", scope: !5, file: !1, type: !49)
!58 = !DILocalVariable(name: "B", scope: !5, file: !1, type: !54)
!59 = !DILocalVariable(name: "main.C_handle.shape", scope: !5, file: !1, type: !49)
!60 = !DILocalVariable(name: "main.C_handle.strides", scope: !5, file: !1, type: !49)
!61 = !DILocalVariable(name: "C", scope: !5, file: !1, type: !54)
!62 = !{!63, !63, i64 0}
!63 = !{!"0xf838950.w8.b0", !64, i64 0}
!64 = !{!"0xf838950.w16.b0", !65, i64 0}
!65 = !{!"0xf838950.w32.b0", !66, i64 0}
!66 = !{!"0xf838950.w64.b0", !67, i64 0}
!67 = !{!"0xf838950.w128.b0", !68, i64 0}
!68 = !{!"0xf838950.w256.b0", !69, i64 0}
!69 = !{!"0xf838950.w512.b0", !70, i64 0}
!70 = !{!"0xf838950.w1024.b0", !71, i64 0}
!71 = !{!"0xf838950", !24, i64 0}
!72 = !{!73, !73, i64 0}
!73 = !{!"0xf838950.w8.b8", !64, i64 0}
!74 = !{!75, !75, i64 0}
!75 = !{!"0xf5a1eb0.w8.b0", !76, i64 0}
!76 = !{!"0xf5a1eb0.w16.b0", !77, i64 0}
!77 = !{!"0xf5a1eb0.w32.b0", !78, i64 0}
!78 = !{!"0xf5a1eb0.w64.b0", !79, i64 0}
!79 = !{!"0xf5a1eb0.w128.b0", !80, i64 0}
!80 = !{!"0xf5a1eb0.w256.b0", !81, i64 0}
!81 = !{!"0xf5a1eb0.w512.b0", !82, i64 0}
!82 = !{!"0xf5a1eb0.w1024.b0", !83, i64 0}
!83 = !{!"0xf5a1eb0", !24, i64 0}
!84 = !{!85, !85, i64 0}
!85 = !{!"0xf5a1eb0.w8.b8", !76, i64 0}
!86 = !{!87, !87, i64 0}
!87 = !{!"0xf6b4c70.w8.b0", !88, i64 0}
!88 = !{!"0xf6b4c70.w16.b0", !89, i64 0}
!89 = !{!"0xf6b4c70.w32.b0", !90, i64 0}
!90 = !{!"0xf6b4c70.w64.b0", !91, i64 0}
!91 = !{!"0xf6b4c70.w128.b0", !92, i64 0}
!92 = !{!"0xf6b4c70.w256.b0", !93, i64 0}
!93 = !{!"0xf6b4c70.w512.b0", !94, i64 0}
!94 = !{!"0xf6b4c70.w1024.b0", !95, i64 0}
!95 = !{!"0xf6b4c70", !24, i64 0}
!96 = !{!97, !97, i64 0}
!97 = !{!"0xf6b4c70.w8.b8", !88, i64 0}
!98 = !{!99, !99, i64 0}
!99 = !{!"0xf59d170.w8.b0", !100, i64 0}
!100 = !{!"0xf59d170.w16.b0", !101, i64 0}
!101 = !{!"0xf59d170.w32.b0", !102, i64 0}
!102 = !{!"0xf59d170.w64.b0", !103, i64 0}
!103 = !{!"0xf59d170.w128.b0", !104, i64 0}
!104 = !{!"0xf59d170.w256.b0", !105, i64 0}
!105 = !{!"0xf59d170.w512.b0", !106, i64 0}
!106 = !{!"0xf59d170.w1024.b0", !107, i64 0}
!107 = !{!"0xf59d170", !24, i64 0}
!108 = !{!109, !109, i64 0}
!109 = !{!"0xf59d170.w8.b8", !100, i64 0}
!110 = !{!111, !111, i64 0}
!111 = !{!"0xf66af40.w8.b0", !112, i64 0}
!112 = !{!"0xf66af40.w16.b0", !113, i64 0}
!113 = !{!"0xf66af40.w32.b0", !114, i64 0}
!114 = !{!"0xf66af40.w64.b0", !115, i64 0}
!115 = !{!"0xf66af40.w128.b0", !116, i64 0}
!116 = !{!"0xf66af40.w256.b0", !117, i64 0}
!117 = !{!"0xf66af40.w512.b0", !118, i64 0}
!118 = !{!"0xf66af40.w1024.b0", !119, i64 0}
!119 = !{!"0xf66af40", !24, i64 0}
!120 = !{!121, !121, i64 0}
!121 = !{!"0xf66af40.w8.b8", !112, i64 0}
!122 = !{!123, !123, i64 0}
!123 = !{!"0xf948100.w8.b0", !124, i64 0}
!124 = !{!"0xf948100.w16.b0", !125, i64 0}
!125 = !{!"0xf948100.w32.b0", !126, i64 0}
!126 = !{!"0xf948100.w64.b0", !127, i64 0}
!127 = !{!"0xf948100.w128.b0", !128, i64 0}
!128 = !{!"0xf948100.w256.b0", !129, i64 0}
!129 = !{!"0xf948100.w512.b0", !130, i64 0}
!130 = !{!"0xf948100.w1024.b0", !131, i64 0}
!131 = !{!"0xf948100", !24, i64 0}
!132 = !{!133, !133, i64 0}
!133 = !{!"0xf948100.w8.b8", !124, i64 0}
!134 = !{!135, !135, i64 0}
!135 = !{!"0xff0e760.w4.b0", !136, i64 0}
!136 = !{!"0xff0e760.w8.b0", !137, i64 0}
!137 = !{!"0xff0e760.w16.b0", !138, i64 0}
!138 = !{!"0xff0e760.w32.b0", !139, i64 0}
!139 = !{!"0xff0e760.w64.b0", !140, i64 0}
!140 = !{!"0xff0e760.w128.b0", !141, i64 0}
!141 = !{!"0xff0e760.w256.b0", !142, i64 0}
!142 = !{!"0xff0e760.w512.b0", !143, i64 0}
!143 = !{!"0xff0e760.w1024.b0", !144, i64 0}
!144 = !{!"0xff0e760", !24, i64 0}
!145 = !{!146, !146, i64 0}
!146 = !{!"0xff0e760.w4.b4", !136, i64 0}
!147 = distinct !DISubprogram(name: "main_compute_", scope: !1, file: !1, type: !148, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !150)
!148 = !DISubroutineType(types: !149)
!149 = !{!8, !9, !54, !10, !54, !54}
!150 = !{!151, !152, !153, !154, !155}
!151 = !DILocalVariable(name: "stack_value", arg: 1, scope: !147, file: !1, type: !9)
!152 = !DILocalVariable(name: "A", arg: 2, scope: !147, file: !1, type: !54)
!153 = !DILocalVariable(name: "stack_tcode", arg: 3, scope: !147, file: !1, type: !10)
!154 = !DILocalVariable(name: "B", arg: 4, scope: !147, file: !1, type: !54)
!155 = !DILocalVariable(name: "C", arg: 5, scope: !147, file: !1, type: !54)
!156 = !DILocation(line: 0, scope: !147)
!157 = !{!138, !138, i64 0}
