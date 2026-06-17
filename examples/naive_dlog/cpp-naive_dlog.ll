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

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef i32 @_Z6mulModiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ne i32 %0, 0
  %5 = icmp sgt i32 %1, 0
  %6 = and i1 %4, %5
  br i1 %6, label %7, label %27

7:                                                ; preds = %3
  %8 = srem i32 %0, %2
  %9 = icmp slt i32 %8, 0
  %10 = select i1 %9, i32 %2, i32 0
  %11 = add nsw i32 %10, %8
  br label %12

12:                                               ; preds = %7, %21
  %13 = phi i32 [ %22, %21 ], [ 0, %7 ]
  %14 = phi i32 [ %25, %21 ], [ %1, %7 ]
  %15 = phi i32 [ %24, %21 ], [ %11, %7 ]
  %16 = and i32 %14, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %12
  %19 = add nsw i32 %13, %15
  %20 = srem i32 %19, %2
  br label %21

21:                                               ; preds = %18, %12
  %22 = phi i32 [ %20, %18 ], [ %13, %12 ]
  %23 = shl nsw i32 %15, 1
  %24 = srem i32 %23, %2
  %25 = lshr i32 %14, 1
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %12, !llvm.loop !9

27:                                               ; preds = %21, %3
  %28 = phi i32 [ 0, %3 ], [ %22, %21 ]
  ret i32 %28
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %62

5:                                                ; preds = %3
  %6 = srem i32 %0, %2
  %7 = icmp slt i32 %6, 0
  %8 = select i1 %7, i32 %2, i32 0
  %9 = add nsw i32 %8, %6
  br label %10

10:                                               ; preds = %5, %59
  %11 = phi i32 [ %41, %59 ], [ 1, %5 ]
  %12 = phi i32 [ %42, %59 ], [ %1, %5 ]
  %13 = phi i32 [ %60, %59 ], [ %9, %5 ]
  %14 = and i32 %12, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %40, label %16

16:                                               ; preds = %10
  %17 = icmp ne i32 %11, 0
  %18 = icmp sgt i32 %13, 0
  %19 = and i1 %18, %17
  br i1 %19, label %20, label %40

20:                                               ; preds = %16
  %21 = srem i32 %11, %2
  %22 = icmp slt i32 %21, 0
  %23 = select i1 %22, i32 %2, i32 0
  %24 = add nsw i32 %23, %21
  br label %25

25:                                               ; preds = %34, %20
  %26 = phi i32 [ %35, %34 ], [ 0, %20 ]
  %27 = phi i32 [ %38, %34 ], [ %13, %20 ]
  %28 = phi i32 [ %37, %34 ], [ %24, %20 ]
  %29 = and i32 %27, 1
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %34, label %31

31:                                               ; preds = %25
  %32 = add nsw i32 %28, %26
  %33 = srem i32 %32, %2
  br label %34

34:                                               ; preds = %31, %25
  %35 = phi i32 [ %33, %31 ], [ %26, %25 ]
  %36 = shl nsw i32 %28, 1
  %37 = srem i32 %36, %2
  %38 = lshr i32 %27, 1
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %25, !llvm.loop !9

40:                                               ; preds = %34, %16, %10
  %41 = phi i32 [ %11, %10 ], [ 0, %16 ], [ %35, %34 ]
  %42 = lshr i32 %12, 1
  %43 = icmp sgt i32 %13, 0
  br i1 %43, label %44, label %59

44:                                               ; preds = %40, %54
  %45 = phi i32 [ %55, %54 ], [ 0, %40 ]
  %46 = phi i32 [ %57, %54 ], [ %13, %40 ]
  %47 = phi i32 [ %56, %54 ], [ %13, %40 ]
  %48 = srem i32 %47, %2
  %49 = and i32 %46, 1
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %54, label %51

51:                                               ; preds = %44
  %52 = add nuw nsw i32 %48, %45
  %53 = srem i32 %52, %2
  br label %54

54:                                               ; preds = %51, %44
  %55 = phi i32 [ %53, %51 ], [ %45, %44 ]
  %56 = shl nuw nsw i32 %48, 1
  %57 = lshr i32 %46, 1
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %44, !llvm.loop !9

59:                                               ; preds = %54, %40
  %60 = phi i32 [ 0, %40 ], [ %55, %54 ]
  %61 = icmp eq i32 %42, 0
  br i1 %61, label %62, label %10, !llvm.loop !11

62:                                               ; preds = %59, %3
  %63 = phi i32 [ 1, %3 ], [ %41, %59 ]
  ret i32 %63
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef range(i32 -2147483648, 2147483647) i32 @_Z11discreteLogiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %1, 1
  br i1 %4, label %48, label %5

5:                                                ; preds = %3
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %7, label %48

7:                                                ; preds = %5
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %18, label %9

9:                                                ; preds = %7
  %10 = icmp eq i32 %2, 1
  br i1 %10, label %48, label %11

11:                                               ; preds = %9
  %12 = icmp eq i32 %1, 0
  br label %13

13:                                               ; preds = %11, %15
  %14 = phi i32 [ %16, %15 ], [ 1, %11 ]
  br i1 %12, label %48, label %15

15:                                               ; preds = %13
  %16 = add nuw nsw i32 %14, 1
  %17 = icmp eq i32 %16, %2
  br i1 %17, label %48, label %13, !llvm.loop !12

18:                                               ; preds = %7, %44
  %19 = phi i32 [ %46, %44 ], [ 0, %7 ]
  %20 = phi i32 [ %45, %44 ], [ 1, %7 ]
  %21 = icmp eq i32 %20, %1
  br i1 %21, label %48, label %22

22:                                               ; preds = %18
  %23 = icmp eq i32 %20, 0
  br i1 %23, label %44, label %24

24:                                               ; preds = %22
  %25 = srem i32 %20, %2
  %26 = icmp slt i32 %25, 0
  %27 = select i1 %26, i32 %2, i32 0
  %28 = add nsw i32 %27, %25
  br label %29

29:                                               ; preds = %38, %24
  %30 = phi i32 [ %39, %38 ], [ 0, %24 ]
  %31 = phi i32 [ %42, %38 ], [ %0, %24 ]
  %32 = phi i32 [ %41, %38 ], [ %28, %24 ]
  %33 = and i32 %31, 1
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %38, label %35

35:                                               ; preds = %29
  %36 = add nsw i32 %32, %30
  %37 = srem i32 %36, %2
  br label %38

38:                                               ; preds = %35, %29
  %39 = phi i32 [ %37, %35 ], [ %30, %29 ]
  %40 = shl nsw i32 %32, 1
  %41 = srem i32 %40, %2
  %42 = lshr i32 %31, 1
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %29, !llvm.loop !9

44:                                               ; preds = %38, %22
  %45 = phi i32 [ 0, %22 ], [ %39, %38 ]
  %46 = add nuw nsw i32 %19, 1
  %47 = icmp eq i32 %46, %2
  br i1 %47, label %48, label %18, !llvm.loop !14

48:                                               ; preds = %15, %13, %44, %18, %9, %5, %3
  %49 = phi i32 [ 0, %3 ], [ -1, %5 ], [ -1, %9 ], [ -1, %44 ], [ %19, %18 ], [ -1, %15 ], [ %14, %13 ]
  ret i32 %49
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  %1 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 4)
  %2 = load ptr, ptr %1, align 8, !tbaa !15
  %3 = getelementptr i8, ptr %2, i64 -24
  %4 = load i64, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %1, i64 %4
  %6 = getelementptr inbounds nuw i8, ptr %5, i64 240
  %7 = load ptr, ptr %6, align 8, !tbaa !17
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

10:                                               ; preds = %0
  %11 = getelementptr inbounds nuw i8, ptr %7, i64 56
  %12 = load i8, ptr %11, align 8, !tbaa !35
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds nuw i8, ptr %7, i64 67
  %16 = load i8, ptr %15, align 1, !tbaa !41
  br label %22

17:                                               ; preds = %10
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %7)
  %18 = load ptr, ptr %7, align 8, !tbaa !15
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

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #2

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #2

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #2

; Function Attrs: cold noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #3

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress norecurse sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold noreturn }

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
!12 = distinct !{!12, !10, !13}
!13 = !{!"llvm.loop.peeled.count", i32 1}
!14 = distinct !{!14, !10}
!15 = !{!16, !16, i64 0}
!16 = !{!"vtable pointer", !8, i64 0}
!17 = !{!18, !32, i64 240}
!18 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !19, i64 0, !29, i64 216, !7, i64 224, !30, i64 225, !31, i64 232, !32, i64 240, !33, i64 248, !34, i64 256}
!19 = !{!"_ZTSSt8ios_base", !20, i64 8, !20, i64 16, !21, i64 24, !22, i64 28, !22, i64 32, !23, i64 40, !25, i64 48, !7, i64 64, !6, i64 192, !26, i64 200, !27, i64 208}
!20 = !{!"long", !7, i64 0}
!21 = !{!"_ZTSSt13_Ios_Fmtflags", !7, i64 0}
!22 = !{!"_ZTSSt12_Ios_Iostate", !7, i64 0}
!23 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !24, i64 0}
!24 = !{!"any pointer", !7, i64 0}
!25 = !{!"_ZTSNSt8ios_base6_WordsE", !24, i64 0, !20, i64 8}
!26 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !24, i64 0}
!27 = !{!"_ZTSSt6locale", !28, i64 0}
!28 = !{!"p1 _ZTSNSt6locale5_ImplE", !24, i64 0}
!29 = !{!"p1 _ZTSSo", !24, i64 0}
!30 = !{!"bool", !7, i64 0}
!31 = !{!"p1 _ZTSSt15basic_streambufIcSt11char_traitsIcEE", !24, i64 0}
!32 = !{!"p1 _ZTSSt5ctypeIcE", !24, i64 0}
!33 = !{!"p1 _ZTSSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE", !24, i64 0}
!34 = !{!"p1 _ZTSSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE", !24, i64 0}
!35 = !{!36, !7, i64 56}
!36 = !{!"_ZTSSt5ctypeIcE", !37, i64 0, !38, i64 16, !30, i64 24, !39, i64 32, !39, i64 40, !40, i64 48, !7, i64 56, !7, i64 57, !7, i64 313, !7, i64 569}
!37 = !{!"_ZTSNSt6locale5facetE", !6, i64 8}
!38 = !{!"p1 _ZTS15__locale_struct", !24, i64 0}
!39 = !{!"p1 int", !24, i64 0}
!40 = !{!"p1 short", !24, i64 0}
!41 = !{!7, !7, i64 0}
