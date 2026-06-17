; ModuleID = 'mod_inverse-defensive.cpp'
source_filename = "mod_inverse-defensive.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

@.str = private unnamed_addr constant [7 x i8] c"b >= 0\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"mod_inverse-defensive.cpp\00", align 1
@__PRETTY_FUNCTION__._Z6mulModiii = private unnamed_addr constant [42 x i8] c"int32_t mulMod(int32_t, int32_t, int32_t)\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"mod > 1\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"result >= 0\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"a >= 0\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"exp >= 0\00", align 1
@__PRETTY_FUNCTION__._Z6modExpiii = private unnamed_addr constant [42 x i8] c"int32_t modExp(int32_t, int32_t, int32_t)\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"result < mod\00", align 1
@__PRETTY_FUNCTION__._Z10modInverseii = private unnamed_addr constant [37 x i8] c"int32_t modInverse(int32_t, int32_t)\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local noundef range(i32 0, 2147483647) i32 @_Z6mulModiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, -1
  br i1 %4, label %6, label %5

5:                                                ; preds = %3
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 6, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

6:                                                ; preds = %3
  %7 = icmp sgt i32 %2, 1
  br i1 %7, label %9, label %8

8:                                                ; preds = %6
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 7, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

9:                                                ; preds = %6
  %10 = icmp eq i32 %1, 0
  br i1 %10, label %36, label %11

11:                                               ; preds = %9
  %12 = srem i32 %0, %2
  %13 = icmp slt i32 %12, 0
  %14 = select i1 %13, i32 %2, i32 0
  %15 = add nsw i32 %14, %12
  br label %19

16:                                               ; preds = %30
  %17 = lshr i32 %22, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %36, label %19, !llvm.loop !9

19:                                               ; preds = %11, %16
  %20 = phi i32 [ %31, %16 ], [ 0, %11 ]
  %21 = phi i32 [ %33, %16 ], [ %15, %11 ]
  %22 = phi i32 [ %17, %16 ], [ %1, %11 ]
  %23 = and i32 %22, 1
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %30, label %25

25:                                               ; preds = %19
  %26 = add nsw i32 %20, %21
  %27 = srem i32 %26, %2
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %30, label %29

29:                                               ; preds = %25
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 18, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

30:                                               ; preds = %25, %19
  %31 = phi i32 [ %27, %25 ], [ %20, %19 ]
  %32 = shl nsw i32 %21, 1
  %33 = srem i32 %32, %2
  %34 = icmp sgt i32 %33, -1
  br i1 %34, label %16, label %35

35:                                               ; preds = %30
  tail call void @__assert_fail(ptr noundef nonnull @.str.4, ptr noundef nonnull @.str.1, i32 noundef 21, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

36:                                               ; preds = %16, %9
  %37 = phi i32 [ 0, %9 ], [ %31, %16 ]
  ret i32 %37
}

; Function Attrs: cold noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local noundef range(i32 0, 2147483647) i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, -1
  br i1 %4, label %6, label %5

5:                                                ; preds = %3
  tail call void @__assert_fail(ptr noundef nonnull @.str.5, ptr noundef nonnull @.str.1, i32 noundef 29, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

6:                                                ; preds = %3
  %7 = icmp sgt i32 %2, 1
  br i1 %7, label %9, label %8

8:                                                ; preds = %6
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 30, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

9:                                                ; preds = %6
  %10 = icmp eq i32 %1, 0
  br i1 %10, label %29, label %11

11:                                               ; preds = %9
  %12 = srem i32 %0, %2
  %13 = icmp slt i32 %12, 0
  %14 = select i1 %13, i32 %2, i32 0
  %15 = add nsw i32 %14, %12
  br label %16

16:                                               ; preds = %11, %24
  %17 = phi i32 [ %25, %24 ], [ 1, %11 ]
  %18 = phi i32 [ %27, %24 ], [ %15, %11 ]
  %19 = phi i32 [ %26, %24 ], [ %1, %11 ]
  %20 = and i32 %19, 1
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %24, label %22

22:                                               ; preds = %16
  %23 = tail call noundef i32 @_Z6mulModiii(i32 noundef %17, i32 noundef %18, i32 noundef %2)
  br label %24

24:                                               ; preds = %22, %16
  %25 = phi i32 [ %23, %22 ], [ %17, %16 ]
  %26 = lshr i32 %19, 1
  %27 = tail call noundef i32 @_Z6mulModiii(i32 noundef %18, i32 noundef %18, i32 noundef %2)
  %28 = icmp eq i32 %26, 0
  br i1 %28, label %29, label %16

29:                                               ; preds = %24, %9
  %30 = phi i32 [ 1, %9 ], [ %25, %24 ]
  %31 = icmp slt i32 %30, %2
  br i1 %31, label %33, label %32

32:                                               ; preds = %29
  tail call void @__assert_fail(ptr noundef nonnull @.str.7, ptr noundef nonnull @.str.1, i32 noundef 49, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

33:                                               ; preds = %29
  ret i32 %30
}

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local noundef range(i32 0, 2147483647) i32 @_Z10modInverseii(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 1
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 54, ptr noundef nonnull @__PRETTY_FUNCTION__._Z10modInverseii) #5
  unreachable

5:                                                ; preds = %2
  %6 = add nsw i32 %1, -2
  %7 = tail call noundef i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %6, i32 noundef %1)
  ret i32 %7
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %63, %0
  %2 = phi i32 [ 1, %0 ], [ %64, %63 ]
  %3 = phi i32 [ 3, %0 ], [ %65, %63 ]
  %4 = phi i32 [ 9, %0 ], [ %66, %63 ]
  %5 = and i32 %4, 1
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %34, label %7

7:                                                ; preds = %1
  %8 = icmp sgt i32 %3, -1
  br i1 %8, label %10, label %9

9:                                                ; preds = %7
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 6, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

10:                                               ; preds = %7
  %11 = icmp eq i32 %3, 0
  br i1 %11, label %67, label %12

12:                                               ; preds = %10
  %13 = srem i32 %2, 11
  br label %17

14:                                               ; preds = %28
  %15 = lshr i32 %20, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %34, label %17, !llvm.loop !9

17:                                               ; preds = %14, %12
  %18 = phi i32 [ %29, %14 ], [ 0, %12 ]
  %19 = phi i32 [ %31, %14 ], [ %13, %12 ]
  %20 = phi i32 [ %15, %14 ], [ %3, %12 ]
  %21 = and i32 %20, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %28, label %23

23:                                               ; preds = %17
  %24 = add nsw i32 %19, %18
  %25 = srem i32 %24, 11
  %26 = icmp sgt i32 %25, -1
  br i1 %26, label %28, label %27

27:                                               ; preds = %23
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 18, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

28:                                               ; preds = %23, %17
  %29 = phi i32 [ %25, %23 ], [ %18, %17 ]
  %30 = shl nsw i32 %19, 1
  %31 = srem i32 %30, 11
  %32 = icmp sgt i32 %31, -1
  br i1 %32, label %14, label %33

33:                                               ; preds = %28
  tail call void @__assert_fail(ptr noundef nonnull @.str.4, ptr noundef nonnull @.str.1, i32 noundef 21, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

34:                                               ; preds = %14, %1
  %35 = phi i32 [ %2, %1 ], [ %29, %14 ]
  %36 = lshr i32 %4, 1
  %37 = icmp eq i32 %3, 0
  br i1 %37, label %60, label %38

38:                                               ; preds = %34
  %39 = srem i32 %3, 11
  br label %43

40:                                               ; preds = %54
  %41 = lshr i32 %46, 1
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %60, label %43, !llvm.loop !9

43:                                               ; preds = %40, %38
  %44 = phi i32 [ %55, %40 ], [ 0, %38 ]
  %45 = phi i32 [ %57, %40 ], [ %39, %38 ]
  %46 = phi i32 [ %41, %40 ], [ %3, %38 ]
  %47 = and i32 %46, 1
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %54, label %49

49:                                               ; preds = %43
  %50 = add nsw i32 %45, %44
  %51 = srem i32 %50, 11
  %52 = icmp sgt i32 %51, -1
  br i1 %52, label %54, label %53

53:                                               ; preds = %49
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 18, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

54:                                               ; preds = %49, %43
  %55 = phi i32 [ %51, %49 ], [ %44, %43 ]
  %56 = shl nsw i32 %45, 1
  %57 = srem i32 %56, 11
  %58 = icmp sgt i32 %57, -1
  br i1 %58, label %40, label %59

59:                                               ; preds = %54
  tail call void @__assert_fail(ptr noundef nonnull @.str.4, ptr noundef nonnull @.str.1, i32 noundef 21, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

60:                                               ; preds = %40, %34
  %61 = phi i32 [ 0, %34 ], [ %55, %40 ]
  %62 = icmp eq i32 %36, 0
  br i1 %62, label %70, label %63

63:                                               ; preds = %60, %67
  %64 = phi i32 [ %35, %60 ], [ 0, %67 ]
  %65 = phi i32 [ %61, %60 ], [ 0, %67 ]
  %66 = phi i32 [ %36, %60 ], [ %68, %67 ]
  br label %1

67:                                               ; preds = %10
  %68 = lshr i32 %4, 1
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %73, label %63

70:                                               ; preds = %60
  %71 = icmp slt i32 %35, 11
  br i1 %71, label %73, label %72

72:                                               ; preds = %70
  tail call void @__assert_fail(ptr noundef nonnull @.str.7, ptr noundef nonnull @.str.1, i32 noundef 49, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

73:                                               ; preds = %67, %70
  %74 = phi i32 [ %35, %70 ], [ 0, %67 ]
  %75 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %74)
  %76 = load ptr, ptr %75, align 8, !tbaa !11
  %77 = getelementptr i8, ptr %76, i64 -24
  %78 = load i64, ptr %77, align 8
  %79 = getelementptr inbounds i8, ptr %75, i64 %78
  %80 = getelementptr inbounds nuw i8, ptr %79, i64 240
  %81 = load ptr, ptr %80, align 8, !tbaa !13
  %82 = icmp eq ptr %81, null
  br i1 %82, label %83, label %84

83:                                               ; preds = %73
  tail call void @_ZSt16__throw_bad_castv() #6
  unreachable

84:                                               ; preds = %73
  %85 = getelementptr inbounds nuw i8, ptr %81, i64 56
  %86 = load i8, ptr %85, align 8, !tbaa !31
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %91, label %88

88:                                               ; preds = %84
  %89 = getelementptr inbounds nuw i8, ptr %81, i64 67
  %90 = load i8, ptr %89, align 1, !tbaa !37
  br label %96

91:                                               ; preds = %84
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %81)
  %92 = load ptr, ptr %81, align 8, !tbaa !11
  %93 = getelementptr inbounds nuw i8, ptr %92, i64 48
  %94 = load ptr, ptr %93, align 8
  %95 = tail call noundef signext i8 %94(ptr noundef nonnull align 8 dereferenceable(570) %81, i8 noundef signext 10)
  br label %96

96:                                               ; preds = %88, %91
  %97 = phi i8 [ %90, %88 ], [ %95, %91 ]
  %98 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %75, i8 noundef signext %97)
  %99 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %98)
  ret i32 0
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #3

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #3

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #3

; Function Attrs: cold noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #4

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #3

attributes #0 = { mustprogress nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { cold noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress norecurse sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold noreturn nounwind }
attributes #6 = { cold noreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 22.1.6"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!12, !12, i64 0}
!12 = !{!"vtable pointer", !8, i64 0}
!13 = !{!14, !28, i64 240}
!14 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !15, i64 0, !25, i64 216, !7, i64 224, !26, i64 225, !27, i64 232, !28, i64 240, !29, i64 248, !30, i64 256}
!15 = !{!"_ZTSSt8ios_base", !16, i64 8, !16, i64 16, !17, i64 24, !18, i64 28, !18, i64 32, !19, i64 40, !21, i64 48, !7, i64 64, !6, i64 192, !22, i64 200, !23, i64 208}
!16 = !{!"long", !7, i64 0}
!17 = !{!"_ZTSSt13_Ios_Fmtflags", !7, i64 0}
!18 = !{!"_ZTSSt12_Ios_Iostate", !7, i64 0}
!19 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !20, i64 0}
!20 = !{!"any pointer", !7, i64 0}
!21 = !{!"_ZTSNSt8ios_base6_WordsE", !20, i64 0, !16, i64 8}
!22 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !20, i64 0}
!23 = !{!"_ZTSSt6locale", !24, i64 0}
!24 = !{!"p1 _ZTSNSt6locale5_ImplE", !20, i64 0}
!25 = !{!"p1 _ZTSSo", !20, i64 0}
!26 = !{!"bool", !7, i64 0}
!27 = !{!"p1 _ZTSSt15basic_streambufIcSt11char_traitsIcEE", !20, i64 0}
!28 = !{!"p1 _ZTSSt5ctypeIcE", !20, i64 0}
!29 = !{!"p1 _ZTSSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE", !20, i64 0}
!30 = !{!"p1 _ZTSSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE", !20, i64 0}
!31 = !{!32, !7, i64 56}
!32 = !{!"_ZTSSt5ctypeIcE", !33, i64 0, !34, i64 16, !26, i64 24, !35, i64 32, !35, i64 40, !36, i64 48, !7, i64 56, !7, i64 57, !7, i64 313, !7, i64 569}
!33 = !{!"_ZTSNSt6locale5facetE", !6, i64 8}
!34 = !{!"p1 _ZTS15__locale_struct", !20, i64 0}
!35 = !{!"p1 int", !20, i64 0}
!36 = !{!"p1 short", !20, i64 0}
!37 = !{!7, !7, i64 0}
