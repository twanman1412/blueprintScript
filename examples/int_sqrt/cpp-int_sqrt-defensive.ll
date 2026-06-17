; ModuleID = 'int_sqrt-defensive.cpp'
source_filename = "int_sqrt-defensive.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

@.str = private unnamed_addr constant [7 x i8] c"n >= 0\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"int_sqrt-defensive.cpp\00", align 1
@__PRETTY_FUNCTION__._Z7intSqrti = private unnamed_addr constant [25 x i8] c"int32_t intSqrt(int32_t)\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8

; Function Attrs: mustprogress nounwind sspstrong uwtable
define dso_local noundef range(i32 0, -2147483648) i32 @_Z7intSqrti(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, -1
  br i1 %2, label %4, label %3

3:                                                ; preds = %1
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 6, ptr noundef nonnull @__PRETTY_FUNCTION__._Z7intSqrti) #5
  unreachable

4:                                                ; preds = %1, %19
  %5 = phi i32 [ %22, %19 ], [ 0, %1 ]
  %6 = phi i32 [ %21, %19 ], [ 0, %1 ]
  %7 = phi i32 [ %20, %19 ], [ %0, %1 ]
  %8 = sub nsw i32 %7, %5
  %9 = lshr i32 %8, 1
  %10 = add nuw nsw i32 %9, %5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %19, label %12

12:                                               ; preds = %4
  %13 = udiv i32 %0, %10
  %14 = icmp sgt i32 %10, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %12
  %16 = add nuw nsw i32 %10, 1
  br label %19

17:                                               ; preds = %12
  %18 = add nsw i32 %10, -1
  br label %19

19:                                               ; preds = %4, %15, %17
  %20 = phi i32 [ %18, %17 ], [ %7, %15 ], [ %7, %4 ]
  %21 = phi i32 [ %6, %17 ], [ %10, %15 ], [ 0, %4 ]
  %22 = phi i32 [ %5, %17 ], [ %16, %15 ], [ 1, %4 ]
  %23 = icmp sgt i32 %22, %20
  br i1 %23, label %24, label %4, !llvm.loop !9

24:                                               ; preds = %19
  ret i32 %21
}

; Function Attrs: cold noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %16, %0
  %2 = phi i32 [ %19, %16 ], [ 0, %0 ]
  %3 = phi i32 [ %18, %16 ], [ 0, %0 ]
  %4 = phi i32 [ %17, %16 ], [ 70, %0 ]
  %5 = sub nsw i32 %4, %2
  %6 = lshr i32 %5, 1
  %7 = add nuw nsw i32 %6, %2
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %16, label %9

9:                                                ; preds = %1
  %10 = udiv i32 70, %7
  %11 = icmp sgt i32 %7, %10
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = add nuw nsw i32 %7, 1
  br label %16

14:                                               ; preds = %9
  %15 = add nsw i32 %7, -1
  br label %16

16:                                               ; preds = %14, %12, %1
  %17 = phi i32 [ %15, %14 ], [ %4, %12 ], [ %4, %1 ]
  %18 = phi i32 [ %3, %14 ], [ %7, %12 ], [ 0, %1 ]
  %19 = phi i32 [ %2, %14 ], [ %13, %12 ], [ 1, %1 ]
  %20 = icmp sgt i32 %19, %17
  br i1 %20, label %21, label %1, !llvm.loop !9

21:                                               ; preds = %16
  %22 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %18)
  %23 = load ptr, ptr %22, align 8, !tbaa !11
  %24 = getelementptr i8, ptr %23, i64 -24
  %25 = load i64, ptr %24, align 8
  %26 = getelementptr inbounds i8, ptr %22, i64 %25
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 240
  %28 = load ptr, ptr %27, align 8, !tbaa !13
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %31

30:                                               ; preds = %21
  tail call void @_ZSt16__throw_bad_castv() #6
  unreachable

31:                                               ; preds = %21
  %32 = getelementptr inbounds nuw i8, ptr %28, i64 56
  %33 = load i8, ptr %32, align 8, !tbaa !31
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %38, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds nuw i8, ptr %28, i64 67
  %37 = load i8, ptr %36, align 1, !tbaa !37
  br label %43

38:                                               ; preds = %31
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %28)
  %39 = load ptr, ptr %28, align 8, !tbaa !11
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 48
  %41 = load ptr, ptr %40, align 8
  %42 = tail call noundef signext i8 %41(ptr noundef nonnull align 8 dereferenceable(570) %28, i8 noundef signext 10)
  br label %43

43:                                               ; preds = %35, %38
  %44 = phi i8 [ %37, %35 ], [ %42, %38 ]
  %45 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %22, i8 noundef signext %44)
  %46 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %45)
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
