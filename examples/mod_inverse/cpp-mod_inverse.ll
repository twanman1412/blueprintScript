; ModuleID = 'mod_inverse.cpp'
source_filename = "mod_inverse.cpp"
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
define dso_local noundef i32 @_Z10modInverseii(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = srem i32 %0, %1
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %64, label %5

5:                                                ; preds = %2
  %6 = icmp sgt i32 %1, 2
  br i1 %6, label %7, label %64

7:                                                ; preds = %5
  %8 = add nsw i32 %1, -2
  %9 = icmp slt i32 %3, 0
  %10 = select i1 %9, i32 %1, i32 0
  %11 = add nsw i32 %10, %3
  br label %12

12:                                               ; preds = %61, %7
  %13 = phi i32 [ %43, %61 ], [ 1, %7 ]
  %14 = phi i32 [ %44, %61 ], [ %8, %7 ]
  %15 = phi i32 [ %62, %61 ], [ %11, %7 ]
  %16 = and i32 %14, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %42, label %18

18:                                               ; preds = %12
  %19 = icmp ne i32 %13, 0
  %20 = icmp sgt i32 %15, 0
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %42

22:                                               ; preds = %18
  %23 = srem i32 %13, %1
  %24 = icmp slt i32 %23, 0
  %25 = select i1 %24, i32 %1, i32 0
  %26 = add nsw i32 %25, %23
  br label %27

27:                                               ; preds = %36, %22
  %28 = phi i32 [ %37, %36 ], [ 0, %22 ]
  %29 = phi i32 [ %40, %36 ], [ %15, %22 ]
  %30 = phi i32 [ %39, %36 ], [ %26, %22 ]
  %31 = and i32 %29, 1
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %36, label %33

33:                                               ; preds = %27
  %34 = add nsw i32 %30, %28
  %35 = srem i32 %34, %1
  br label %36

36:                                               ; preds = %33, %27
  %37 = phi i32 [ %35, %33 ], [ %28, %27 ]
  %38 = shl nsw i32 %30, 1
  %39 = srem i32 %38, %1
  %40 = lshr i32 %29, 1
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %27, !llvm.loop !9

42:                                               ; preds = %36, %18, %12
  %43 = phi i32 [ %13, %12 ], [ 0, %18 ], [ %37, %36 ]
  %44 = lshr i32 %14, 1
  %45 = icmp sgt i32 %15, 0
  br i1 %45, label %46, label %61

46:                                               ; preds = %42, %56
  %47 = phi i32 [ %57, %56 ], [ 0, %42 ]
  %48 = phi i32 [ %59, %56 ], [ %15, %42 ]
  %49 = phi i32 [ %58, %56 ], [ %15, %42 ]
  %50 = urem i32 %49, %1
  %51 = and i32 %48, 1
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %56, label %53

53:                                               ; preds = %46
  %54 = add nuw nsw i32 %50, %47
  %55 = urem i32 %54, %1
  br label %56

56:                                               ; preds = %53, %46
  %57 = phi i32 [ %55, %53 ], [ %47, %46 ]
  %58 = shl nuw nsw i32 %50, 1
  %59 = lshr i32 %48, 1
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %46, !llvm.loop !9

61:                                               ; preds = %56, %42
  %62 = phi i32 [ 0, %42 ], [ %57, %56 ]
  %63 = icmp eq i32 %44, 0
  br i1 %63, label %64, label %12, !llvm.loop !11

64:                                               ; preds = %61, %5, %2
  %65 = phi i32 [ 0, %2 ], [ 1, %5 ], [ %43, %61 ]
  ret i32 %65
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %0, %11
  %2 = phi i32 [ %12, %11 ], [ 0, %0 ]
  %3 = phi i32 [ %14, %11 ], [ 4, %0 ]
  %4 = phi i32 [ %13, %11 ], [ 4, %0 ]
  %5 = urem i32 %4, 11
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %1
  %9 = add nuw nsw i32 %5, %2
  %10 = urem i32 %9, 11
  br label %11

11:                                               ; preds = %8, %1
  %12 = phi i32 [ %10, %8 ], [ %2, %1 ]
  %13 = shl nuw nsw i32 %5, 1
  %14 = lshr i32 %3, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %1, !llvm.loop !9

16:                                               ; preds = %11
  %17 = icmp eq i32 %12, 0
  br i1 %17, label %33, label %18

18:                                               ; preds = %16, %27
  %19 = phi i32 [ %28, %27 ], [ 0, %16 ]
  %20 = phi i32 [ %31, %27 ], [ %12, %16 ]
  %21 = phi i32 [ %30, %27 ], [ 3, %16 ]
  %22 = and i32 %20, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %27, label %24

24:                                               ; preds = %18
  %25 = add nsw i32 %21, %19
  %26 = srem i32 %25, 11
  br label %27

27:                                               ; preds = %24, %18
  %28 = phi i32 [ %26, %24 ], [ %19, %18 ]
  %29 = shl nuw nsw i32 %21, 1
  %30 = urem i32 %29, 11
  %31 = lshr i32 %20, 1
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %18, !llvm.loop !9

33:                                               ; preds = %27, %16
  %34 = phi i32 [ 0, %16 ], [ %28, %27 ]
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
