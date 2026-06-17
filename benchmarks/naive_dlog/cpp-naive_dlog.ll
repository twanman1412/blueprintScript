; ModuleID = 'naive_dlog.cpp'
source_filename = "naive_dlog.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

@_ZSt4cout = external global %"class.std::basic_ostream", align 8

; Function Attrs: mustprogress noinline nounwind optnone sspstrong uwtable
define dso_local noundef i32 @_Z6mulModiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %50

12:                                               ; preds = %3
  %13 = load i32, ptr %6, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i32 0, ptr %4, align 4
  br label %50

16:                                               ; preds = %12
  store i32 0, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %7, align 4
  %19 = srem i32 %17, %18
  store i32 %19, ptr %5, align 4
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %16
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %5, align 4
  br label %26

26:                                               ; preds = %22, %16
  br label %27

27:                                               ; preds = %40, %26
  %28 = load i32, ptr %6, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %48

30:                                               ; preds = %27
  %31 = load i32, ptr %6, align 4
  %32 = srem i32 %31, 2
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %40

34:                                               ; preds = %30
  %35 = load i32, ptr %8, align 4
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %35, %36
  %38 = load i32, ptr %7, align 4
  %39 = srem i32 %37, %38
  store i32 %39, ptr %8, align 4
  br label %40

40:                                               ; preds = %34, %30
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %41, %42
  %44 = load i32, ptr %7, align 4
  %45 = srem i32 %43, %44
  store i32 %45, ptr %5, align 4
  %46 = load i32, ptr %6, align 4
  %47 = sdiv i32 %46, 2
  store i32 %47, ptr %6, align 4
  br label %27, !llvm.loop !6

48:                                               ; preds = %27
  %49 = load i32, ptr %8, align 4
  store i32 %49, ptr %4, align 4
  br label %50

50:                                               ; preds = %48, %15, %11
  %51 = load i32, ptr %4, align 4
  ret i32 %51
}

; Function Attrs: mustprogress noinline nounwind optnone sspstrong uwtable
define dso_local noundef i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %6, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  store i32 1, ptr %4, align 4
  br label %44

12:                                               ; preds = %3
  store i32 1, ptr %8, align 4
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %7, align 4
  %15 = srem i32 %13, %14
  store i32 %15, ptr %5, align 4
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %12
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %5, align 4
  br label %22

22:                                               ; preds = %18, %12
  br label %23

23:                                               ; preds = %35, %22
  %24 = load i32, ptr %6, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %42

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = srem i32 %27, 2
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %35

30:                                               ; preds = %26
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %7, align 4
  %34 = call noundef i32 @_Z6mulModiii(i32 noundef %31, i32 noundef %32, i32 noundef %33)
  store i32 %34, ptr %8, align 4
  br label %35

35:                                               ; preds = %30, %26
  %36 = load i32, ptr %6, align 4
  %37 = sdiv i32 %36, 2
  store i32 %37, ptr %6, align 4
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %5, align 4
  %40 = load i32, ptr %7, align 4
  %41 = call noundef i32 @_Z6mulModiii(i32 noundef %38, i32 noundef %39, i32 noundef %40)
  store i32 %41, ptr %5, align 4
  br label %23, !llvm.loop !8

42:                                               ; preds = %23
  %43 = load i32, ptr %8, align 4
  store i32 %43, ptr %4, align 4
  br label %44

44:                                               ; preds = %42, %11
  %45 = load i32, ptr %4, align 4
  ret i32 %45
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
  %10 = load i32, ptr %6, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %32

13:                                               ; preds = %3
  store i32 1, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %14

14:                                               ; preds = %24, %13
  %15 = load i32, ptr %9, align 4
  %16 = load i32, ptr %7, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %31

18:                                               ; preds = %14
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %18
  %23 = load i32, ptr %9, align 4
  store i32 %23, ptr %4, align 4
  br label %32

24:                                               ; preds = %18
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %7, align 4
  %28 = call noundef i32 @_Z6mulModiii(i32 noundef %25, i32 noundef %26, i32 noundef %27)
  store i32 %28, ptr %8, align 4
  %29 = load i32, ptr %9, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %9, align 4
  br label %14, !llvm.loop !9

31:                                               ; preds = %14
  store i32 -1, ptr %4, align 4
  br label %32

32:                                               ; preds = %31, %22, %12
  %33 = load i32, ptr %4, align 4
  ret i32 %33
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
define dso_local noundef i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call noundef i32 @_Z10dlogStressv()
  %3 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %2)
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret i32 0
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) #2

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #2

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) #2

attributes #0 = { mustprogress noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline norecurse optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
