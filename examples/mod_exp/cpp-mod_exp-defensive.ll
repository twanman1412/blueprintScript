; ModuleID = 'mod_exp-defensive.cpp'
source_filename = "mod_exp-defensive.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

@.str = private unnamed_addr constant [12 x i8] c"result >= 0\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"mod_exp-defensive.cpp\00", align 1
@__PRETTY_FUNCTION__._Z6mulModiii = private unnamed_addr constant [42 x i8] c"int32_t mulMod(int32_t, int32_t, int32_t)\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"a > 0\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"exp >= 0\00", align 1
@__PRETTY_FUNCTION__._Z6modExpiii = private unnamed_addr constant [42 x i8] c"int32_t modExp(int32_t, int32_t, int32_t)\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"mod > 1\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"result < mod\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local noundef range(i32 0, -2147483648) i32 @_Z6mulModiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %30

5:                                                ; preds = %3
  %6 = srem i32 %0, %2
  %7 = icmp slt i32 %6, 0
  %8 = select i1 %7, i32 %2, i32 0
  %9 = add nsw i32 %8, %6
  br label %13

10:                                               ; preds = %24
  %11 = lshr i32 %16, 1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %30, label %13, !llvm.loop !9

13:                                               ; preds = %5, %10
  %14 = phi i32 [ %25, %10 ], [ 0, %5 ]
  %15 = phi i32 [ %27, %10 ], [ %9, %5 ]
  %16 = phi i32 [ %11, %10 ], [ %1, %5 ]
  %17 = and i32 %16, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %24, label %19

19:                                               ; preds = %13
  %20 = add nsw i32 %14, %15
  %21 = srem i32 %20, %2
  %22 = icmp sgt i32 %21, -1
  br i1 %22, label %24, label %23

23:                                               ; preds = %19
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 15, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

24:                                               ; preds = %19, %13
  %25 = phi i32 [ %21, %19 ], [ %14, %13 ]
  %26 = shl nsw i32 %15, 1
  %27 = srem i32 %26, %2
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %10, label %29

29:                                               ; preds = %24
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 18, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

30:                                               ; preds = %10, %3
  %31 = phi i32 [ 0, %3 ], [ %25, %10 ]
  ret i32 %31
}

; Function Attrs: cold noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local noundef range(i32 0, 2147483647) i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, -1
  br i1 %4, label %6, label %5

5:                                                ; preds = %3
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef 26, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

6:                                                ; preds = %3
  %7 = icmp sgt i32 %2, 1
  br i1 %7, label %9, label %8

8:                                                ; preds = %6
  tail call void @__assert_fail(ptr noundef nonnull @.str.4, ptr noundef nonnull @.str.1, i32 noundef 27, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

9:                                                ; preds = %6
  %10 = icmp eq i32 %1, 0
  br i1 %10, label %74, label %11

11:                                               ; preds = %9
  %12 = srem i32 %0, %2
  %13 = icmp slt i32 %12, 0
  %14 = select i1 %13, i32 %2, i32 0
  %15 = add nsw i32 %14, %12
  br label %16

16:                                               ; preds = %11, %69
  %17 = phi i32 [ %70, %69 ], [ 1, %11 ]
  %18 = phi i32 [ %71, %69 ], [ %15, %11 ]
  %19 = phi i32 [ %72, %69 ], [ %1, %11 ]
  %20 = and i32 %19, 1
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %46, label %22

22:                                               ; preds = %16
  %23 = icmp sgt i32 %18, 0
  br i1 %23, label %24, label %69

24:                                               ; preds = %22
  %25 = srem i32 %17, %2
  br label %29

26:                                               ; preds = %40
  %27 = lshr i32 %32, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %46, label %29, !llvm.loop !9

29:                                               ; preds = %26, %24
  %30 = phi i32 [ %41, %26 ], [ 0, %24 ]
  %31 = phi i32 [ %43, %26 ], [ %25, %24 ]
  %32 = phi i32 [ %27, %26 ], [ %18, %24 ]
  %33 = and i32 %32, 1
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %40, label %35

35:                                               ; preds = %29
  %36 = add nsw i32 %31, %30
  %37 = srem i32 %36, %2
  %38 = icmp sgt i32 %37, -1
  br i1 %38, label %40, label %39

39:                                               ; preds = %35
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 15, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

40:                                               ; preds = %35, %29
  %41 = phi i32 [ %37, %35 ], [ %30, %29 ]
  %42 = shl nsw i32 %31, 1
  %43 = srem i32 %42, %2
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %26, label %45

45:                                               ; preds = %40
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 18, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

46:                                               ; preds = %26, %16
  %47 = phi i32 [ %17, %16 ], [ %41, %26 ]
  %48 = icmp sgt i32 %18, 0
  br i1 %48, label %49, label %69

49:                                               ; preds = %46
  %50 = urem i32 %18, %2
  br label %54

51:                                               ; preds = %63
  %52 = lshr i32 %57, 1
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %69, label %54, !llvm.loop !9

54:                                               ; preds = %51, %49
  %55 = phi i32 [ %64, %51 ], [ 0, %49 ]
  %56 = phi i32 [ %66, %51 ], [ %50, %49 ]
  %57 = phi i32 [ %52, %51 ], [ %18, %49 ]
  %58 = and i32 %57, 1
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %63, label %60

60:                                               ; preds = %54
  %61 = add nuw nsw i32 %56, %55
  %62 = urem i32 %61, %2
  br label %63

63:                                               ; preds = %60, %54
  %64 = phi i32 [ %62, %60 ], [ %55, %54 ]
  %65 = shl nuw nsw i32 %56, 1
  %66 = urem i32 %65, %2
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %51

68:                                               ; preds = %63
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 18, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6mulModiii) #5
  unreachable

69:                                               ; preds = %51, %22, %46
  %70 = phi i32 [ %47, %46 ], [ 0, %22 ], [ %47, %51 ]
  %71 = phi i32 [ 0, %46 ], [ 0, %22 ], [ %64, %51 ]
  %72 = lshr i32 %19, 1
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %16

74:                                               ; preds = %69, %9
  %75 = phi i32 [ 1, %9 ], [ %70, %69 ]
  %76 = icmp slt i32 %75, %2
  br i1 %76, label %78, label %77

77:                                               ; preds = %74
  tail call void @__assert_fail(ptr noundef nonnull @.str.6, ptr noundef nonnull @.str.1, i32 noundef 46, ptr noundef nonnull @__PRETTY_FUNCTION__._Z6modExpiii) #5
  unreachable

78:                                               ; preds = %74
  ret i32 %75
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #2 {
  %1 = tail call noundef i32 @_Z6modExpiii(i32 noundef 2, i32 noundef 10, i32 noundef 1000)
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %1)
  %3 = load ptr, ptr %2, align 8, !tbaa !11
  %4 = getelementptr i8, ptr %3, i64 -24
  %5 = load i64, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %2, i64 %5
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 240
  %8 = load ptr, ptr %7, align 8, !tbaa !13
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #6
  unreachable

11:                                               ; preds = %0
  %12 = getelementptr inbounds nuw i8, ptr %8, i64 56
  %13 = load i8, ptr %12, align 8, !tbaa !31
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %8, i64 67
  %17 = load i8, ptr %16, align 1, !tbaa !37
  br label %23

18:                                               ; preds = %11
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %8)
  %19 = load ptr, ptr %8, align 8, !tbaa !11
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 48
  %21 = load ptr, ptr %20, align 8
  %22 = tail call noundef signext i8 %21(ptr noundef nonnull align 8 dereferenceable(570) %8, i8 noundef signext 10)
  br label %23

23:                                               ; preds = %15, %18
  %24 = phi i8 [ %17, %15 ], [ %22, %18 ]
  %25 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %2, i8 noundef signext %24)
  %26 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %25)
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
