; ModuleID = 'mod_exp.cpp'
source_filename = "mod_exp.cpp"
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
  br i1 %6, label %7, label %22

7:                                                ; preds = %3, %17
  %8 = phi i32 [ %19, %17 ], [ %0, %3 ]
  %9 = phi i32 [ %18, %17 ], [ 0, %3 ]
  %10 = phi i32 [ %20, %17 ], [ %1, %3 ]
  %11 = srem i32 %8, %2
  %12 = and i32 %10, 1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %7
  %15 = add nsw i32 %11, %9
  %16 = srem i32 %15, %2
  br label %17

17:                                               ; preds = %14, %7
  %18 = phi i32 [ %16, %14 ], [ %9, %7 ]
  %19 = shl nsw i32 %11, 1
  %20 = lshr i32 %10, 1
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %7, !llvm.loop !9

22:                                               ; preds = %17, %3
  %23 = phi i32 [ 0, %3 ], [ %18, %17 ]
  ret i32 %23
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef i32 @_Z6modExpiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %1, 0
  br i1 %4, label %57, label %5

5:                                                ; preds = %3
  %6 = srem i32 %0, %2
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %57, label %8

8:                                                ; preds = %5
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %10, label %57

10:                                               ; preds = %8, %54
  %11 = phi i32 [ %36, %54 ], [ 1, %8 ]
  %12 = phi i32 [ %37, %54 ], [ %1, %8 ]
  %13 = phi i32 [ %55, %54 ], [ %6, %8 ]
  %14 = and i32 %12, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %35, label %16

16:                                               ; preds = %10
  %17 = icmp ne i32 %11, 0
  %18 = icmp sgt i32 %13, 0
  %19 = and i1 %18, %17
  br i1 %19, label %20, label %35

20:                                               ; preds = %16, %30
  %21 = phi i32 [ %32, %30 ], [ %11, %16 ]
  %22 = phi i32 [ %31, %30 ], [ 0, %16 ]
  %23 = phi i32 [ %33, %30 ], [ %13, %16 ]
  %24 = srem i32 %21, %2
  %25 = and i32 %23, 1
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %20
  %28 = add nsw i32 %24, %22
  %29 = srem i32 %28, %2
  br label %30

30:                                               ; preds = %27, %20
  %31 = phi i32 [ %29, %27 ], [ %22, %20 ]
  %32 = shl nsw i32 %24, 1
  %33 = lshr i32 %23, 1
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %20, !llvm.loop !9

35:                                               ; preds = %30, %16, %10
  %36 = phi i32 [ %11, %10 ], [ 0, %16 ], [ %31, %30 ]
  %37 = lshr i32 %12, 1
  %38 = icmp sgt i32 %13, 0
  br i1 %38, label %39, label %54

39:                                               ; preds = %35, %49
  %40 = phi i32 [ %51, %49 ], [ %13, %35 ]
  %41 = phi i32 [ %50, %49 ], [ 0, %35 ]
  %42 = phi i32 [ %52, %49 ], [ %13, %35 ]
  %43 = srem i32 %40, %2
  %44 = and i32 %42, 1
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %39
  %47 = add nuw nsw i32 %43, %41
  %48 = srem i32 %47, %2
  br label %49

49:                                               ; preds = %46, %39
  %50 = phi i32 [ %48, %46 ], [ %41, %39 ]
  %51 = shl nuw nsw i32 %43, 1
  %52 = lshr i32 %42, 1
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %39, !llvm.loop !9

54:                                               ; preds = %49, %35
  %55 = phi i32 [ 0, %35 ], [ %50, %49 ]
  %56 = icmp eq i32 %37, 0
  br i1 %56, label %57, label %10, !llvm.loop !11

57:                                               ; preds = %54, %8, %5, %3
  %58 = phi i32 [ 0, %5 ], [ 1, %3 ], [ 1, %8 ], [ %36, %54 ]
  ret i32 %58
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %0, %11
  %2 = phi i32 [ %13, %11 ], [ 16, %0 ]
  %3 = phi i32 [ %12, %11 ], [ 0, %0 ]
  %4 = phi i32 [ %14, %11 ], [ 16, %0 ]
  %5 = urem i32 %2, 1000
  %6 = and i32 %4, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %1
  %9 = add nuw nsw i32 %5, %3
  %10 = urem i32 %9, 1000
  br label %11

11:                                               ; preds = %8, %1
  %12 = phi i32 [ %10, %8 ], [ %3, %1 ]
  %13 = shl nuw nsw i32 %5, 1
  %14 = lshr i32 %4, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %1, !llvm.loop !9

16:                                               ; preds = %11
  %17 = icmp eq i32 %12, 0
  br i1 %17, label %33, label %18

18:                                               ; preds = %16, %28
  %19 = phi i32 [ %30, %28 ], [ 4, %16 ]
  %20 = phi i32 [ %29, %28 ], [ 0, %16 ]
  %21 = phi i32 [ %31, %28 ], [ %12, %16 ]
  %22 = srem i32 %19, 1000
  %23 = and i32 %21, 1
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %28, label %25

25:                                               ; preds = %18
  %26 = add nsw i32 %22, %20
  %27 = srem i32 %26, 1000
  br label %28

28:                                               ; preds = %25, %18
  %29 = phi i32 [ %27, %25 ], [ %20, %18 ]
  %30 = shl nsw i32 %22, 1
  %31 = lshr i32 %21, 1
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %18, !llvm.loop !9

33:                                               ; preds = %28, %16
  %34 = phi i32 [ 0, %16 ], [ %29, %28 ]
  %35 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %34)
  %36 = load ptr, ptr %35, align 8, !tbaa !12
  %37 = getelementptr i8, ptr %36, i64 -24
  %38 = load i64, ptr %37, align 8
  %39 = getelementptr inbounds i8, ptr %35, i64 %38
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 240
  %41 = load ptr, ptr %40, align 8, !tbaa !14
  %42 = icmp eq ptr %41, null
  br i1 %42, label %43, label %44

43:                                               ; preds = %33
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

44:                                               ; preds = %33
  %45 = getelementptr inbounds nuw i8, ptr %41, i64 56
  %46 = load i8, ptr %45, align 8, !tbaa !32
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %51, label %48

48:                                               ; preds = %44
  %49 = getelementptr inbounds nuw i8, ptr %41, i64 67
  %50 = load i8, ptr %49, align 1, !tbaa !38
  br label %56

51:                                               ; preds = %44
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %41)
  %52 = load ptr, ptr %41, align 8, !tbaa !12
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 48
  %54 = load ptr, ptr %53, align 8
  %55 = tail call noundef signext i8 %54(ptr noundef nonnull align 8 dereferenceable(570) %41, i8 noundef signext 10)
  br label %56

56:                                               ; preds = %48, %51
  %57 = phi i8 [ %50, %48 ], [ %55, %51 ]
  %58 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %35, i8 noundef signext %57)
  %59 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %58)
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
