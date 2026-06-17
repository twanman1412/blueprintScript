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
define dso_local noundef range(i32 -2147483648, 2147483647) i32 @_Z11discreteLogiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 1
  br i1 %4, label %6, label %5

5:                                                ; preds = %3
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 54, ptr noundef nonnull @__PRETTY_FUNCTION__._Z11discreteLogiii) #5
  unreachable

6:                                                ; preds = %3
  %7 = icmp sgt i32 %0, -1
  br i1 %7, label %9, label %8

8:                                                ; preds = %6
  tail call void @__assert_fail(ptr noundef nonnull @.str.6, ptr noundef nonnull @.str.1, i32 noundef 55, ptr noundef nonnull @__PRETTY_FUNCTION__._Z11discreteLogiii) #5
  unreachable

9:                                                ; preds = %6
  %10 = icmp sgt i32 %1, -1
  br i1 %10, label %12, label %11

11:                                               ; preds = %9
  tail call void @__assert_fail(ptr noundef nonnull @.str.8, ptr noundef nonnull @.str.1, i32 noundef 56, ptr noundef nonnull @__PRETTY_FUNCTION__._Z11discreteLogiii) #5
  unreachable

12:                                               ; preds = %9, %16
  %13 = phi i32 [ %18, %16 ], [ 0, %9 ]
  %14 = phi i32 [ %17, %16 ], [ 1, %9 ]
  %15 = icmp eq i32 %14, %1
  br i1 %15, label %20, label %16

16:                                               ; preds = %12
  %17 = tail call noundef i32 @_Z6mulModiii(i32 noundef %14, i32 noundef %0, i32 noundef %2)
  %18 = add nuw nsw i32 %13, 1
  %19 = icmp eq i32 %18, %2
  br i1 %19, label %20, label %12, !llvm.loop !11

20:                                               ; preds = %12, %16
  %21 = phi i32 [ %13, %12 ], [ -1, %16 ]
  ret i32 %21
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #2 {
  %1 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 4)
  %2 = load ptr, ptr %1, align 8, !tbaa !12
  %3 = getelementptr i8, ptr %2, i64 -24
  %4 = load i64, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %1, i64 %4
  %6 = getelementptr inbounds nuw i8, ptr %5, i64 240
  %7 = load ptr, ptr %6, align 8, !tbaa !14
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #6
  unreachable

10:                                               ; preds = %0
  %11 = getelementptr inbounds nuw i8, ptr %7, i64 56
  %12 = load i8, ptr %11, align 8, !tbaa !32
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds nuw i8, ptr %7, i64 67
  %16 = load i8, ptr %15, align 1, !tbaa !38
  br label %22

17:                                               ; preds = %10
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %7)
  %18 = load ptr, ptr %7, align 8, !tbaa !12
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 48
  %20 = load ptr, ptr %19, align 8
  %21 = tail call noundef signext i8 %20(ptr noundef nonnull align 8 dereferenceable(570) %7, i8 noundef signext 10)
  br label %22

22:                                               ; preds = %14, %17
  %23 = phi i8 [ %16, %14 ], [ %21, %17 ]
  %24 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %1, i8 noundef signext %23)
  %25 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %24)
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
!11 = distinct !{!11, !10}
!12 = !{!13, !13, i64 0}
!13 = !{!"vtable pointer", !8, i64 0}
!14 = !{!15, !29, i64 240}
!15 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !16, i64 0, !26, i64 216, !7, i64 224, !27, i64 225, !28, i64 232, !29, i64 240, !30, i64 248, !31, i64 256}
!16 = !{!"_ZTSSt8ios_base", !17, i64 8, !17, i64 16, !18, i64 24, !19, i64 28, !19, i64 32, !20, i64 40, !22, i64 48, !7, i64 64, !6, i64 192, !23, i64 200, !24, i64 208}
!17 = !{!"long", !7, i64 0}
!18 = !{!"_ZTSSt13_Ios_Fmtflags", !7, i64 0}
!19 = !{!"_ZTSSt12_Ios_Iostate", !7, i64 0}
!20 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !21, i64 0}
!21 = !{!"any pointer", !7, i64 0}
!22 = !{!"_ZTSNSt8ios_base6_WordsE", !21, i64 0, !17, i64 8}
!23 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !21, i64 0}
!24 = !{!"_ZTSSt6locale", !25, i64 0}
!25 = !{!"p1 _ZTSNSt6locale5_ImplE", !21, i64 0}
!26 = !{!"p1 _ZTSSo", !21, i64 0}
!27 = !{!"bool", !7, i64 0}
!28 = !{!"p1 _ZTSSt15basic_streambufIcSt11char_traitsIcEE", !21, i64 0}
!29 = !{!"p1 _ZTSSt5ctypeIcE", !21, i64 0}
!30 = !{!"p1 _ZTSSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE", !21, i64 0}
!31 = !{!"p1 _ZTSSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE", !21, i64 0}
!32 = !{!33, !7, i64 56}
!33 = !{!"_ZTSSt5ctypeIcE", !34, i64 0, !35, i64 16, !27, i64 24, !36, i64 32, !36, i64 40, !37, i64 48, !7, i64 56, !7, i64 57, !7, i64 313, !7, i64 569}
!34 = !{!"_ZTSNSt6locale5facetE", !6, i64 8}
!35 = !{!"p1 _ZTS15__locale_struct", !21, i64 0}
!36 = !{!"p1 int", !21, i64 0}
!37 = !{!"p1 short", !21, i64 0}
!38 = !{!7, !7, i64 0}
