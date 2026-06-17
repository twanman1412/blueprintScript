; ModuleID = 'naive_dlog-defensive.cpp'
source_filename = "naive_dlog-defensive.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

@.str = private unnamed_addr constant [7 x i8] c"b >= 0\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"naive_dlog-defensive.cpp\00", align 1
@__PRETTY_FUNCTION__._Z6mulModiii = private unnamed_addr constant [42 x i8] c"int32_t mulMod(int32_t, int32_t, int32_t)\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"mod > 1\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"result >= 0\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"a >= 0\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"exp >= 0\00", align 1
@__PRETTY_FUNCTION__._Z6modExpiii = private unnamed_addr constant [42 x i8] c"int32_t modExp(int32_t, int32_t, int32_t)\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"base >= 0\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"result < mod\00", align 1
@__PRETTY_FUNCTION__._Z11discreteLogiii = private unnamed_addr constant [47 x i8] c"int32_t discreteLog(int32_t, int32_t, int32_t)\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"target >= 0\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8

; Function Attrs: mustprogress noinline nounwind optnone sspstrong uwtable
define dso_local noundef i32 @_Z6mulModiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sge i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  br label %13

11:                                               ; preds = %3
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 6, ptr noundef @__PRETTY_FUNCTION__._Z6mulModiii) #4
  unreachable

12:                                               ; No predecessors!
  br label %13

13:                                               ; preds = %12, %10
  %14 = load i32, ptr %6, align 4
  %15 = icmp sgt i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %19

17:                                               ; preds = %13
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 7, ptr noundef @__PRETTY_FUNCTION__._Z6mulModiii) #4
  unreachable

18:                                               ; No predecessors!
  br label %19

19:                                               ; preds = %18, %16
  store i32 0, ptr %7, align 4
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %6, align 4
  %22 = srem i32 %20, %21
  store i32 %22, ptr %4, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %19
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %4, align 4
  br label %29

29:                                               ; preds = %25, %19
  br label %30

30:                                               ; preds = %60, %29
  %31 = load i32, ptr %5, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %63

33:                                               ; preds = %30
  %34 = load i32, ptr %5, align 4
  %35 = srem i32 %34, 2
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %37, label %49

37:                                               ; preds = %33
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %4, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32, ptr %6, align 4
  %42 = srem i32 %40, %41
  store i32 %42, ptr %7, align 4
  %43 = load i32, ptr %7, align 4
  %44 = icmp sge i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %37
  br label %48

46:                                               ; preds = %37
  call void @__assert_fail(ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 18, ptr noundef @__PRETTY_FUNCTION__._Z6mulModiii) #4
  unreachable

47:                                               ; No predecessors!
  br label %48

48:                                               ; preds = %47, %45
  br label %49

49:                                               ; preds = %48, %33
  %50 = load i32, ptr %4, align 4
  %51 = load i32, ptr %4, align 4
  %52 = add nsw i32 %50, %51
  %53 = load i32, ptr %6, align 4
  %54 = srem i32 %52, %53
  store i32 %54, ptr %4, align 4
  %55 = load i32, ptr %4, align 4
  %56 = icmp sge i32 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %49
  br label %60

58:                                               ; preds = %49
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 21, ptr noundef @__PRETTY_FUNCTION__._Z6mulModiii) #4
  unreachable

59:                                               ; No predecessors!
  br label %60

60:                                               ; preds = %59, %57
  %61 = load i32, ptr %5, align 4
  %62 = sdiv i32 %61, 2
  store i32 %62, ptr %5, align 4
  br label %30, !llvm.loop !6

63:                                               ; preds = %30
  %64 = load i32, ptr %7, align 4
  ret i32 %64
}

; Function Attrs: cold noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind optnone sspstrong uwtable
define dso_local noundef i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sge i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  br label %13

11:                                               ; preds = %3
  call void @__assert_fail(ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 29, ptr noundef @__PRETTY_FUNCTION__._Z6modExpiii) #4
  unreachable

12:                                               ; No predecessors!
  br label %13

13:                                               ; preds = %12, %10
  %14 = load i32, ptr %6, align 4
  %15 = icmp sgt i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %19

17:                                               ; preds = %13
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 30, ptr noundef @__PRETTY_FUNCTION__._Z6modExpiii) #4
  unreachable

18:                                               ; No predecessors!
  br label %19

19:                                               ; preds = %18, %16
  store i32 1, ptr %7, align 4
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %6, align 4
  %22 = srem i32 %20, %21
  store i32 %22, ptr %4, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %19
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %4, align 4
  br label %29

29:                                               ; preds = %25, %19
  br label %30

30:                                               ; preds = %60, %29
  %31 = load i32, ptr %5, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %61

33:                                               ; preds = %30
  %34 = load i32, ptr %5, align 4
  %35 = srem i32 %34, 2
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %37, label %48

37:                                               ; preds = %33
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %4, align 4
  %40 = load i32, ptr %6, align 4
  %41 = call noundef i32 @_Z6mulModiii(i32 noundef %38, i32 noundef %39, i32 noundef %40)
  store i32 %41, ptr %7, align 4
  %42 = load i32, ptr %7, align 4
  %43 = icmp sge i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %37
  br label %47

45:                                               ; preds = %37
  call void @__assert_fail(ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 41, ptr noundef @__PRETTY_FUNCTION__._Z6modExpiii) #4
  unreachable

46:                                               ; No predecessors!
  br label %47

47:                                               ; preds = %46, %44
  br label %48

48:                                               ; preds = %47, %33
  %49 = load i32, ptr %5, align 4
  %50 = sdiv i32 %49, 2
  store i32 %50, ptr %5, align 4
  %51 = load i32, ptr %4, align 4
  %52 = load i32, ptr %4, align 4
  %53 = load i32, ptr %6, align 4
  %54 = call noundef i32 @_Z6mulModiii(i32 noundef %51, i32 noundef %52, i32 noundef %53)
  store i32 %54, ptr %4, align 4
  %55 = load i32, ptr %4, align 4
  %56 = icmp sge i32 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %48
  br label %60

58:                                               ; preds = %48
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 45, ptr noundef @__PRETTY_FUNCTION__._Z6modExpiii) #4
  unreachable

59:                                               ; No predecessors!
  br label %60

60:                                               ; preds = %59, %57
  br label %30, !llvm.loop !8

61:                                               ; preds = %30
  %62 = load i32, ptr %7, align 4
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  br label %67

65:                                               ; preds = %61
  call void @__assert_fail(ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 48, ptr noundef @__PRETTY_FUNCTION__._Z6modExpiii) #4
  unreachable

66:                                               ; No predecessors!
  br label %67

67:                                               ; preds = %66, %64
  %68 = load i32, ptr %7, align 4
  %69 = load i32, ptr %6, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %72

71:                                               ; preds = %67
  br label %74

72:                                               ; preds = %67
  call void @__assert_fail(ptr noundef @.str.7, ptr noundef @.str.1, i32 noundef 49, ptr noundef @__PRETTY_FUNCTION__._Z6modExpiii) #4
  unreachable

73:                                               ; No predecessors!
  br label %74

74:                                               ; preds = %73, %71
  %75 = load i32, ptr %7, align 4
  ret i32 %75
}

; Function Attrs: mustprogress noinline nounwind optnone sspstrong uwtable
define dso_local noundef i32 @_Z11discreteLogiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %10 = load i32, ptr %7, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  br label %15

13:                                               ; preds = %3
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 54, ptr noundef @__PRETTY_FUNCTION__._Z11discreteLogiii) #4
  unreachable

14:                                               ; No predecessors!
  br label %15

15:                                               ; preds = %14, %12
  %16 = load i32, ptr %5, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %21

19:                                               ; preds = %15
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 55, ptr noundef @__PRETTY_FUNCTION__._Z11discreteLogiii) #4
  unreachable

20:                                               ; No predecessors!
  br label %21

21:                                               ; preds = %20, %18
  %22 = load i32, ptr %6, align 4
  %23 = icmp sge i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %27

25:                                               ; preds = %21
  call void @__assert_fail(ptr noundef @.str.8, ptr noundef @.str.1, i32 noundef 56, ptr noundef @__PRETTY_FUNCTION__._Z11discreteLogiii) #4
  unreachable

26:                                               ; No predecessors!
  br label %27

27:                                               ; preds = %26, %24
  store i32 1, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %28

28:                                               ; preds = %38, %27
  %29 = load i32, ptr %9, align 4
  %30 = load i32, ptr %7, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %45

32:                                               ; preds = %28
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %6, align 4
  %35 = icmp eq i32 %33, %34
  br i1 %35, label %36, label %38

36:                                               ; preds = %32
  %37 = load i32, ptr %9, align 4
  store i32 %37, ptr %4, align 4
  br label %46

38:                                               ; preds = %32
  %39 = load i32, ptr %8, align 4
  %40 = load i32, ptr %5, align 4
  %41 = load i32, ptr %7, align 4
  %42 = call noundef i32 @_Z6mulModiii(i32 noundef %39, i32 noundef %40, i32 noundef %41)
  store i32 %42, ptr %8, align 4
  %43 = load i32, ptr %9, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %9, align 4
  br label %28, !llvm.loop !9

45:                                               ; preds = %28
  store i32 -1, ptr %4, align 4
  br label %46

46:                                               ; preds = %45, %36
  %47 = load i32, ptr %4, align 4
  ret i32 %47
}

; Function Attrs: mustprogress noinline nounwind optnone sspstrong uwtable
define dso_local noundef i32 @_Z10dlogStressv() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 1000003, ptr %1, align 4
  store i32 2, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %4, align 4
  store i32 100000, ptr %5, align 4
  br label %8

8:                                                ; preds = %12, %0
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = icmp sle i32 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %1, align 4
  %16 = call noundef i32 @_Z6modExpiii(i32 noundef %13, i32 noundef %14, i32 noundef %15)
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %2, align 4
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %1, align 4
  %20 = call noundef i32 @_Z11discreteLogiii(i32 noundef %17, i32 noundef %18, i32 noundef %19)
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %1, align 4
  %25 = srem i32 %23, %24
  store i32 %25, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %8, !llvm.loop !10

28:                                               ; preds = %8
  %29 = load i32, ptr %3, align 4
  ret i32 %29
}

; Function Attrs: mustprogress noinline norecurse optnone sspstrong uwtable
define dso_local noundef i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call noundef i32 @_Z10dlogStressv()
  %3 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %2)
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret i32 0
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) #3

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #3

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) #3

attributes #0 = { mustprogress noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { cold noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress noinline norecurse optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 22.1.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
