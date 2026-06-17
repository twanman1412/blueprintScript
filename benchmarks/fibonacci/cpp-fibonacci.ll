; ModuleID = 'fibonacci.cpp'
source_filename = "fibonacci.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

@_ZSt4cout = external global %"class.std::basic_ostream", align 8

; Function Attrs: mustprogress nofree nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef i32 @_Z9fibonaccii(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ult i32 %0, 2
  br i1 %2, label %11, label %3

3:                                                ; preds = %1, %3
  %4 = phi i32 [ %8, %3 ], [ %0, %1 ]
  %5 = phi i32 [ %9, %3 ], [ 0, %1 ]
  %6 = add nsw i32 %4, -1
  %7 = tail call noundef i32 @_Z9fibonaccii(i32 noundef %6)
  %8 = add nsw i32 %4, -2
  %9 = add nsw i32 %7, %5
  %10 = icmp ult i32 %8, 2
  br i1 %10, label %11, label %3

11:                                               ; preds = %3, %1
  %12 = phi i32 [ 0, %1 ], [ %9, %3 ]
  %13 = phi i32 [ %0, %1 ], [ %8, %3 ]
  %14 = add nsw i32 %13, %12
  ret i32 %14
}

; Function Attrs: mustprogress nofree nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef i32 @_Z15fibonacciStressv() local_unnamed_addr #0 {
  %1 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 0)
  %2 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 1)
  %3 = add nsw i32 %2, %1
  %4 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 2)
  %5 = add nsw i32 %4, %3
  %6 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 3)
  %7 = add nsw i32 %6, %5
  %8 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 4)
  %9 = add nsw i32 %8, %7
  %10 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 5)
  %11 = add nsw i32 %10, %9
  %12 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 6)
  %13 = add nsw i32 %12, %11
  %14 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 7)
  %15 = add nsw i32 %14, %13
  %16 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 8)
  %17 = add nsw i32 %16, %15
  %18 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 9)
  %19 = add nsw i32 %18, %17
  %20 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 10)
  %21 = add nsw i32 %20, %19
  %22 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 11)
  %23 = add nsw i32 %22, %21
  %24 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 12)
  %25 = add nsw i32 %24, %23
  %26 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 13)
  %27 = add nsw i32 %26, %25
  %28 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 14)
  %29 = add nsw i32 %28, %27
  %30 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 15)
  %31 = add nsw i32 %30, %29
  %32 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 16)
  %33 = add nsw i32 %32, %31
  %34 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 17)
  %35 = add nsw i32 %34, %33
  %36 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 18)
  %37 = add nsw i32 %36, %35
  %38 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 19)
  %39 = add nsw i32 %38, %37
  %40 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 20)
  %41 = add nsw i32 %40, %39
  %42 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 21)
  %43 = add nsw i32 %42, %41
  %44 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 22)
  %45 = add nsw i32 %44, %43
  %46 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 23)
  %47 = add nsw i32 %46, %45
  %48 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 24)
  %49 = add nsw i32 %48, %47
  %50 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 25)
  %51 = add nsw i32 %50, %49
  %52 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 26)
  %53 = add nsw i32 %52, %51
  %54 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 27)
  %55 = add nsw i32 %54, %53
  %56 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 28)
  %57 = add nsw i32 %56, %55
  %58 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 29)
  %59 = add nsw i32 %58, %57
  %60 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 30)
  %61 = add nsw i32 %60, %59
  %62 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 31)
  %63 = add nsw i32 %62, %61
  %64 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 32)
  %65 = add nsw i32 %64, %63
  %66 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 33)
  %67 = add nsw i32 %66, %65
  %68 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 34)
  %69 = add nsw i32 %68, %67
  %70 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 35)
  %71 = add nsw i32 %70, %69
  %72 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 36)
  %73 = add nsw i32 %72, %71
  %74 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 37)
  %75 = add nsw i32 %74, %73
  %76 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 38)
  %77 = add nsw i32 %76, %75
  %78 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 39)
  %79 = add nsw i32 %78, %77
  %80 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 40)
  %81 = add nsw i32 %80, %79
  %82 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 41)
  %83 = add nsw i32 %82, %81
  %84 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 42)
  %85 = add nsw i32 %84, %83
  %86 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 43)
  %87 = add nsw i32 %86, %85
  %88 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 44)
  %89 = add nsw i32 %88, %87
  %90 = tail call noundef i32 @_Z9fibonaccii(i32 noundef 45)
  %91 = add nsw i32 %90, %89
  ret i32 %91
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  %1 = tail call noundef i32 @_Z15fibonacciStressv()
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %1)
  %3 = load ptr, ptr %2, align 8, !tbaa !9
  %4 = getelementptr i8, ptr %3, i64 -24
  %5 = load i64, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %2, i64 %5
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 240
  %8 = load ptr, ptr %7, align 8, !tbaa !11
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

11:                                               ; preds = %0
  %12 = getelementptr inbounds nuw i8, ptr %8, i64 56
  %13 = load i8, ptr %12, align 8, !tbaa !29
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %8, i64 67
  %17 = load i8, ptr %16, align 1, !tbaa !35
  br label %23

18:                                               ; preds = %11
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %8)
  %19 = load ptr, ptr %8, align 8, !tbaa !9
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

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #2

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #2

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #2

; Function Attrs: cold noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #3

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #2

attributes #0 = { mustprogress nofree nosync nounwind sspstrong willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!9 = !{!10, !10, i64 0}
!10 = !{!"vtable pointer", !8, i64 0}
!11 = !{!12, !26, i64 240}
!12 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !13, i64 0, !23, i64 216, !7, i64 224, !24, i64 225, !25, i64 232, !26, i64 240, !27, i64 248, !28, i64 256}
!13 = !{!"_ZTSSt8ios_base", !14, i64 8, !14, i64 16, !15, i64 24, !16, i64 28, !16, i64 32, !17, i64 40, !19, i64 48, !7, i64 64, !6, i64 192, !20, i64 200, !21, i64 208}
!14 = !{!"long", !7, i64 0}
!15 = !{!"_ZTSSt13_Ios_Fmtflags", !7, i64 0}
!16 = !{!"_ZTSSt12_Ios_Iostate", !7, i64 0}
!17 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !18, i64 0}
!18 = !{!"any pointer", !7, i64 0}
!19 = !{!"_ZTSNSt8ios_base6_WordsE", !18, i64 0, !14, i64 8}
!20 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !18, i64 0}
!21 = !{!"_ZTSSt6locale", !22, i64 0}
!22 = !{!"p1 _ZTSNSt6locale5_ImplE", !18, i64 0}
!23 = !{!"p1 _ZTSSo", !18, i64 0}
!24 = !{!"bool", !7, i64 0}
!25 = !{!"p1 _ZTSSt15basic_streambufIcSt11char_traitsIcEE", !18, i64 0}
!26 = !{!"p1 _ZTSSt5ctypeIcE", !18, i64 0}
!27 = !{!"p1 _ZTSSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE", !18, i64 0}
!28 = !{!"p1 _ZTSSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE", !18, i64 0}
!29 = !{!30, !7, i64 56}
!30 = !{!"_ZTSSt5ctypeIcE", !31, i64 0, !32, i64 16, !24, i64 24, !33, i64 32, !33, i64 40, !34, i64 48, !7, i64 56, !7, i64 57, !7, i64 313, !7, i64 569}
!31 = !{!"_ZTSNSt6locale5facetE", !6, i64 8}
!32 = !{!"p1 _ZTS15__locale_struct", !18, i64 0}
!33 = !{!"p1 int", !18, i64 0}
!34 = !{!"p1 short", !18, i64 0}
!35 = !{!7, !7, i64 0}
