; ModuleID = 'bbs_bits.cpp'
source_filename = "bbs_bits.cpp"
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
define dso_local noundef range(i32 -1000000006, 1000000007) i32 @_Z7bbsBitsiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %37

5:                                                ; preds = %3
  %6 = srem i32 %0, %1
  %7 = icmp slt i32 %6, 0
  %8 = select i1 %7, i32 %1, i32 0
  %9 = add nsw i32 %8, %6
  br label %10

10:                                               ; preds = %5, %30
  %11 = phi i32 [ %35, %30 ], [ 0, %5 ]
  %12 = phi i32 [ %34, %30 ], [ 0, %5 ]
  %13 = phi i32 [ %31, %30 ], [ %9, %5 ]
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %30

15:                                               ; preds = %10, %25
  %16 = phi i32 [ %26, %25 ], [ 0, %10 ]
  %17 = phi i32 [ %28, %25 ], [ %13, %10 ]
  %18 = phi i32 [ %27, %25 ], [ %13, %10 ]
  %19 = srem i32 %18, %1
  %20 = and i32 %17, 1
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %25, label %22

22:                                               ; preds = %15
  %23 = add nuw nsw i32 %19, %16
  %24 = srem i32 %23, %1
  br label %25

25:                                               ; preds = %22, %15
  %26 = phi i32 [ %24, %22 ], [ %16, %15 ]
  %27 = shl nuw nsw i32 %19, 1
  %28 = lshr i32 %17, 1
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %15, !llvm.loop !9

30:                                               ; preds = %25, %10
  %31 = phi i32 [ 0, %10 ], [ %26, %25 ]
  %32 = and i32 %31, 1
  %33 = add nsw i32 %32, %12
  %34 = srem i32 %33, 1000000007
  %35 = add nuw nsw i32 %11, 1
  %36 = icmp eq i32 %35, %2
  br i1 %36, label %37, label %10, !llvm.loop !11

37:                                               ; preds = %30, %3
  %38 = phi i32 [ 0, %3 ], [ %34, %30 ]
  ret i32 %38
}

; Function Attrs: mustprogress norecurse sspstrong uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %11, %0
  %2 = phi i32 [ %12, %11 ], [ 0, %0 ]
  %3 = phi i32 [ %14, %11 ], [ 591446, %0 ]
  %4 = phi i32 [ %13, %11 ], [ 591446, %0 ]
  %5 = urem i32 %4, 1000003
  %6 = and i32 %3, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %1
  %9 = add nuw nsw i32 %5, %2
  %10 = urem i32 %9, 1000003
  br label %11

11:                                               ; preds = %8, %1
  %12 = phi i32 [ %10, %8 ], [ %2, %1 ]
  %13 = shl nuw nsw i32 %5, 1
  %14 = lshr i32 %3, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %1, !llvm.loop !9

16:                                               ; preds = %11
  %17 = and i32 %12, 1
  %18 = icmp eq i32 %12, 0
  br i1 %18, label %171, label %19

19:                                               ; preds = %16, %29
  %20 = phi i32 [ %30, %29 ], [ 0, %16 ]
  %21 = phi i32 [ %32, %29 ], [ %12, %16 ]
  %22 = phi i32 [ %31, %29 ], [ %12, %16 ]
  %23 = urem i32 %22, 1000003
  %24 = and i32 %21, 1
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %19
  %27 = add nuw nsw i32 %23, %20
  %28 = urem i32 %27, 1000003
  br label %29

29:                                               ; preds = %26, %19
  %30 = phi i32 [ %28, %26 ], [ %20, %19 ]
  %31 = shl nuw nsw i32 %23, 1
  %32 = lshr i32 %21, 1
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %19, !llvm.loop !9

34:                                               ; preds = %29
  %35 = and i32 %30, 1
  %36 = add nuw nsw i32 %35, %17
  %37 = icmp eq i32 %30, 0
  br i1 %37, label %171, label %38

38:                                               ; preds = %34, %48
  %39 = phi i32 [ %49, %48 ], [ 0, %34 ]
  %40 = phi i32 [ %51, %48 ], [ %30, %34 ]
  %41 = phi i32 [ %50, %48 ], [ %30, %34 ]
  %42 = urem i32 %41, 1000003
  %43 = and i32 %40, 1
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %38
  %46 = add nuw nsw i32 %42, %39
  %47 = urem i32 %46, 1000003
  br label %48

48:                                               ; preds = %45, %38
  %49 = phi i32 [ %47, %45 ], [ %39, %38 ]
  %50 = shl nuw nsw i32 %42, 1
  %51 = lshr i32 %40, 1
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %38, !llvm.loop !9

53:                                               ; preds = %48
  %54 = and i32 %49, 1
  %55 = add nuw nsw i32 %54, %36
  %56 = icmp eq i32 %49, 0
  br i1 %56, label %171, label %57

57:                                               ; preds = %53, %67
  %58 = phi i32 [ %68, %67 ], [ 0, %53 ]
  %59 = phi i32 [ %70, %67 ], [ %49, %53 ]
  %60 = phi i32 [ %69, %67 ], [ %49, %53 ]
  %61 = urem i32 %60, 1000003
  %62 = and i32 %59, 1
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %67, label %64

64:                                               ; preds = %57
  %65 = add nuw nsw i32 %61, %58
  %66 = urem i32 %65, 1000003
  br label %67

67:                                               ; preds = %64, %57
  %68 = phi i32 [ %66, %64 ], [ %58, %57 ]
  %69 = shl nuw nsw i32 %61, 1
  %70 = lshr i32 %59, 1
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %57, !llvm.loop !9

72:                                               ; preds = %67
  %73 = and i32 %68, 1
  %74 = add nuw nsw i32 %73, %55
  %75 = icmp eq i32 %68, 0
  br i1 %75, label %171, label %76

76:                                               ; preds = %72, %86
  %77 = phi i32 [ %87, %86 ], [ 0, %72 ]
  %78 = phi i32 [ %89, %86 ], [ %68, %72 ]
  %79 = phi i32 [ %88, %86 ], [ %68, %72 ]
  %80 = urem i32 %79, 1000003
  %81 = and i32 %78, 1
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %76
  %84 = add nuw nsw i32 %80, %77
  %85 = urem i32 %84, 1000003
  br label %86

86:                                               ; preds = %83, %76
  %87 = phi i32 [ %85, %83 ], [ %77, %76 ]
  %88 = shl nuw nsw i32 %80, 1
  %89 = lshr i32 %78, 1
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %76, !llvm.loop !9

91:                                               ; preds = %86
  %92 = and i32 %87, 1
  %93 = add nuw nsw i32 %92, %74
  %94 = icmp eq i32 %87, 0
  br i1 %94, label %171, label %95

95:                                               ; preds = %91, %105
  %96 = phi i32 [ %106, %105 ], [ 0, %91 ]
  %97 = phi i32 [ %108, %105 ], [ %87, %91 ]
  %98 = phi i32 [ %107, %105 ], [ %87, %91 ]
  %99 = urem i32 %98, 1000003
  %100 = and i32 %97, 1
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %105, label %102

102:                                              ; preds = %95
  %103 = add nuw nsw i32 %99, %96
  %104 = urem i32 %103, 1000003
  br label %105

105:                                              ; preds = %102, %95
  %106 = phi i32 [ %104, %102 ], [ %96, %95 ]
  %107 = shl nuw nsw i32 %99, 1
  %108 = lshr i32 %97, 1
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %95, !llvm.loop !9

110:                                              ; preds = %105
  %111 = and i32 %106, 1
  %112 = add nuw nsw i32 %111, %93
  %113 = icmp eq i32 %106, 0
  br i1 %113, label %171, label %114

114:                                              ; preds = %110, %124
  %115 = phi i32 [ %125, %124 ], [ 0, %110 ]
  %116 = phi i32 [ %127, %124 ], [ %106, %110 ]
  %117 = phi i32 [ %126, %124 ], [ %106, %110 ]
  %118 = urem i32 %117, 1000003
  %119 = and i32 %116, 1
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %124, label %121

121:                                              ; preds = %114
  %122 = add nuw nsw i32 %118, %115
  %123 = urem i32 %122, 1000003
  br label %124

124:                                              ; preds = %121, %114
  %125 = phi i32 [ %123, %121 ], [ %115, %114 ]
  %126 = shl nuw nsw i32 %118, 1
  %127 = lshr i32 %116, 1
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %114, !llvm.loop !9

129:                                              ; preds = %124
  %130 = and i32 %125, 1
  %131 = add nuw nsw i32 %130, %112
  %132 = urem i32 %131, 1000000007
  %133 = icmp eq i32 %125, 0
  br i1 %133, label %171, label %134

134:                                              ; preds = %129, %144
  %135 = phi i32 [ %145, %144 ], [ 0, %129 ]
  %136 = phi i32 [ %147, %144 ], [ %125, %129 ]
  %137 = phi i32 [ %146, %144 ], [ %125, %129 ]
  %138 = urem i32 %137, 1000003
  %139 = and i32 %136, 1
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %144, label %141

141:                                              ; preds = %134
  %142 = add nuw nsw i32 %138, %135
  %143 = urem i32 %142, 1000003
  br label %144

144:                                              ; preds = %141, %134
  %145 = phi i32 [ %143, %141 ], [ %135, %134 ]
  %146 = shl nuw nsw i32 %138, 1
  %147 = lshr i32 %136, 1
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %149, label %134, !llvm.loop !9

149:                                              ; preds = %144
  %150 = and i32 %145, 1
  %151 = add nuw nsw i32 %150, %132
  %152 = urem i32 %151, 1000000007
  %153 = icmp eq i32 %145, 0
  br i1 %153, label %171, label %154

154:                                              ; preds = %149, %164
  %155 = phi i32 [ %165, %164 ], [ 0, %149 ]
  %156 = phi i32 [ %167, %164 ], [ %145, %149 ]
  %157 = phi i32 [ %166, %164 ], [ %145, %149 ]
  %158 = urem i32 %157, 1000003
  %159 = and i32 %156, 1
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %164, label %161

161:                                              ; preds = %154
  %162 = add nuw nsw i32 %158, %155
  %163 = urem i32 %162, 1000003
  br label %164

164:                                              ; preds = %161, %154
  %165 = phi i32 [ %163, %161 ], [ %155, %154 ]
  %166 = shl nuw nsw i32 %158, 1
  %167 = lshr i32 %156, 1
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %154, !llvm.loop !9

169:                                              ; preds = %164
  %170 = and i32 %165, 1
  br label %171

171:                                              ; preds = %16, %34, %53, %72, %91, %110, %129, %169, %149
  %172 = phi i32 [ %152, %149 ], [ %152, %169 ], [ %132, %129 ], [ %112, %110 ], [ %93, %91 ], [ %74, %72 ], [ %55, %53 ], [ %36, %34 ], [ 0, %16 ]
  %173 = phi i32 [ 0, %149 ], [ %170, %169 ], [ 0, %129 ], [ 0, %110 ], [ 0, %91 ], [ 0, %72 ], [ 0, %53 ], [ 0, %34 ], [ 0, %16 ]
  %174 = add nuw nsw i32 %173, %172
  %175 = urem i32 %174, 1000000007
  %176 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %175)
  %177 = load ptr, ptr %176, align 8, !tbaa !12
  %178 = getelementptr i8, ptr %177, i64 -24
  %179 = load i64, ptr %178, align 8
  %180 = getelementptr inbounds i8, ptr %176, i64 %179
  %181 = getelementptr inbounds nuw i8, ptr %180, i64 240
  %182 = load ptr, ptr %181, align 8, !tbaa !14
  %183 = icmp eq ptr %182, null
  br i1 %183, label %184, label %185

184:                                              ; preds = %171
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

185:                                              ; preds = %171
  %186 = getelementptr inbounds nuw i8, ptr %182, i64 56
  %187 = load i8, ptr %186, align 8, !tbaa !32
  %188 = icmp eq i8 %187, 0
  br i1 %188, label %192, label %189

189:                                              ; preds = %185
  %190 = getelementptr inbounds nuw i8, ptr %182, i64 67
  %191 = load i8, ptr %190, align 1, !tbaa !38
  br label %197

192:                                              ; preds = %185
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %182)
  %193 = load ptr, ptr %182, align 8, !tbaa !12
  %194 = getelementptr inbounds nuw i8, ptr %193, i64 48
  %195 = load ptr, ptr %194, align 8
  %196 = tail call noundef signext i8 %195(ptr noundef nonnull align 8 dereferenceable(570) %182, i8 noundef signext 10)
  br label %197

197:                                              ; preds = %189, %192
  %198 = phi i8 [ %191, %189 ], [ %196, %192 ]
  %199 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %176, i8 noundef signext %198)
  %200 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %199)
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
