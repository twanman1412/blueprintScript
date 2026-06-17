; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %intSqrt.exit.i.3, %entry
  %sum.013.i = phi i32 [ 0, %entry ], [ %modtmp.i.3, %intSqrt.exit.i.3 ]
  %i.012.i = phi i32 [ 0, %entry ], [ %addtmp7.i.3, %intSqrt.exit.i.3 ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %ifcont.i.i, %loopbody.i.preheader.i
  %result.035.i.i = phi i32 [ %result.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i.preheader.i ]
  %low.034.i.i = phi i32 [ %low.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i.preheader.i ]
  %high.033.i.i = phi i32 [ %high.1.i.i, %ifcont.i.i ], [ %i.012.i, %loopbody.i.preheader.i ]
  %subtmp.i.i = sub nsw i32 %high.033.i.i, %low.034.i.i
  %divtmp31.i.i = lshr i32 %subtmp.i.i, 1
  %addtmp.i.i = add nuw nsw i32 %divtmp31.i.i, %low.034.i.i
  %eqtmp.i.i = icmp eq i32 %addtmp.i.i, 0
  br i1 %eqtmp.i.i, label %ifcont.i.i, label %else.i.i

else.i.i:                                         ; preds = %loopbody.i.i
  %divtmp11.i.i = udiv i32 %i.012.i, %addtmp.i.i
  %letmp12.not.i.i = icmp sgt i32 %addtmp.i.i, %divtmp11.i.i
  br i1 %letmp12.not.i.i, label %else14.i.i, label %then13.i.i

ifcont.i.i:                                       ; preds = %else14.i.i, %then13.i.i, %loopbody.i.i
  %high.1.i.i = phi i32 [ %subtmp20.i.i, %else14.i.i ], [ %high.033.i.i, %then13.i.i ], [ %high.033.i.i, %loopbody.i.i ]
  %low.1.i.i = phi i32 [ %low.034.i.i, %else14.i.i ], [ %addtmp18.i.i, %then13.i.i ], [ 1, %loopbody.i.i ]
  %result.1.i.i = phi i32 [ %result.035.i.i, %else14.i.i ], [ %addtmp.i.i, %then13.i.i ], [ 0, %loopbody.i.i ]
  %letmp.not.i.i = icmp sgt i32 %low.1.i.i, %high.1.i.i
  br i1 %letmp.not.i.i, label %intSqrt.exit.i, label %loopbody.i.i

then13.i.i:                                       ; preds = %else.i.i
  %addtmp18.i.i = add nuw nsw i32 %addtmp.i.i, 1
  br label %ifcont.i.i

else14.i.i:                                       ; preds = %else.i.i
  %subtmp20.i.i = add nsw i32 %addtmp.i.i, -1
  br label %ifcont.i.i

intSqrt.exit.i:                                   ; preds = %ifcont.i.i
  %addtmp.i = add nuw nsw i32 %result.1.i.i, %sum.013.i
  %modtmp.i = urem i32 %addtmp.i, 1000000007
  %addtmp7.i = or disjoint i32 %i.012.i, 1
  %exitcond.not.i = icmp eq i32 %i.012.i, 100000000
  br i1 %exitcond.not.i, label %intSqrtStress.exit, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %intSqrt.exit.i, %ifcont.i.i.1
  %result.035.i.i.1 = phi i32 [ %result.1.i.i.1, %ifcont.i.i.1 ], [ 0, %intSqrt.exit.i ]
  %low.034.i.i.1 = phi i32 [ %low.1.i.i.1, %ifcont.i.i.1 ], [ 0, %intSqrt.exit.i ]
  %high.033.i.i.1 = phi i32 [ %high.1.i.i.1, %ifcont.i.i.1 ], [ %addtmp7.i, %intSqrt.exit.i ]
  %subtmp.i.i.1 = sub nsw i32 %high.033.i.i.1, %low.034.i.i.1
  %divtmp31.i.i.1 = lshr i32 %subtmp.i.i.1, 1
  %addtmp.i.i.1 = add nuw nsw i32 %divtmp31.i.i.1, %low.034.i.i.1
  %eqtmp.i.i.1 = icmp eq i32 %addtmp.i.i.1, 0
  br i1 %eqtmp.i.i.1, label %ifcont.i.i.1, label %else.i.i.1

else.i.i.1:                                       ; preds = %loopbody.i.i.1
  %divtmp11.i.i.1 = udiv i32 %addtmp7.i, %addtmp.i.i.1
  %letmp12.not.i.i.1 = icmp sgt i32 %addtmp.i.i.1, %divtmp11.i.i.1
  br i1 %letmp12.not.i.i.1, label %else14.i.i.1, label %then13.i.i.1

then13.i.i.1:                                     ; preds = %else.i.i.1
  %addtmp18.i.i.1 = add nuw nsw i32 %addtmp.i.i.1, 1
  br label %ifcont.i.i.1

else14.i.i.1:                                     ; preds = %else.i.i.1
  %subtmp20.i.i.1 = add nsw i32 %addtmp.i.i.1, -1
  br label %ifcont.i.i.1

ifcont.i.i.1:                                     ; preds = %else14.i.i.1, %then13.i.i.1, %loopbody.i.i.1
  %high.1.i.i.1 = phi i32 [ %subtmp20.i.i.1, %else14.i.i.1 ], [ %high.033.i.i.1, %then13.i.i.1 ], [ %high.033.i.i.1, %loopbody.i.i.1 ]
  %low.1.i.i.1 = phi i32 [ %low.034.i.i.1, %else14.i.i.1 ], [ %addtmp18.i.i.1, %then13.i.i.1 ], [ 1, %loopbody.i.i.1 ]
  %result.1.i.i.1 = phi i32 [ %result.035.i.i.1, %else14.i.i.1 ], [ %addtmp.i.i.1, %then13.i.i.1 ], [ 0, %loopbody.i.i.1 ]
  %letmp.not.i.i.1 = icmp sgt i32 %low.1.i.i.1, %high.1.i.i.1
  br i1 %letmp.not.i.i.1, label %intSqrt.exit.i.1, label %loopbody.i.i.1

intSqrt.exit.i.1:                                 ; preds = %ifcont.i.i.1
  %addtmp.i.1 = add nuw nsw i32 %result.1.i.i.1, %modtmp.i
  %modtmp.i.1 = urem i32 %addtmp.i.1, 1000000007
  %addtmp7.i.1 = or disjoint i32 %i.012.i, 2
  br label %loopbody.i.i.2

loopbody.i.i.2:                                   ; preds = %ifcont.i.i.2, %intSqrt.exit.i.1
  %result.035.i.i.2 = phi i32 [ %result.1.i.i.2, %ifcont.i.i.2 ], [ 0, %intSqrt.exit.i.1 ]
  %low.034.i.i.2 = phi i32 [ %low.1.i.i.2, %ifcont.i.i.2 ], [ 0, %intSqrt.exit.i.1 ]
  %high.033.i.i.2 = phi i32 [ %high.1.i.i.2, %ifcont.i.i.2 ], [ %addtmp7.i.1, %intSqrt.exit.i.1 ]
  %subtmp.i.i.2 = sub nsw i32 %high.033.i.i.2, %low.034.i.i.2
  %divtmp31.i.i.2 = lshr i32 %subtmp.i.i.2, 1
  %addtmp.i.i.2 = add nuw nsw i32 %divtmp31.i.i.2, %low.034.i.i.2
  %eqtmp.i.i.2 = icmp eq i32 %addtmp.i.i.2, 0
  br i1 %eqtmp.i.i.2, label %ifcont.i.i.2, label %else.i.i.2

else.i.i.2:                                       ; preds = %loopbody.i.i.2
  %divtmp11.i.i.2 = udiv i32 %addtmp7.i.1, %addtmp.i.i.2
  %letmp12.not.i.i.2 = icmp sgt i32 %addtmp.i.i.2, %divtmp11.i.i.2
  br i1 %letmp12.not.i.i.2, label %else14.i.i.2, label %then13.i.i.2

then13.i.i.2:                                     ; preds = %else.i.i.2
  %addtmp18.i.i.2 = add nuw nsw i32 %addtmp.i.i.2, 1
  br label %ifcont.i.i.2

else14.i.i.2:                                     ; preds = %else.i.i.2
  %subtmp20.i.i.2 = add nsw i32 %addtmp.i.i.2, -1
  br label %ifcont.i.i.2

ifcont.i.i.2:                                     ; preds = %else14.i.i.2, %then13.i.i.2, %loopbody.i.i.2
  %high.1.i.i.2 = phi i32 [ %subtmp20.i.i.2, %else14.i.i.2 ], [ %high.033.i.i.2, %then13.i.i.2 ], [ %high.033.i.i.2, %loopbody.i.i.2 ]
  %low.1.i.i.2 = phi i32 [ %low.034.i.i.2, %else14.i.i.2 ], [ %addtmp18.i.i.2, %then13.i.i.2 ], [ 1, %loopbody.i.i.2 ]
  %result.1.i.i.2 = phi i32 [ %result.035.i.i.2, %else14.i.i.2 ], [ %addtmp.i.i.2, %then13.i.i.2 ], [ 0, %loopbody.i.i.2 ]
  %letmp.not.i.i.2 = icmp sgt i32 %low.1.i.i.2, %high.1.i.i.2
  br i1 %letmp.not.i.i.2, label %intSqrt.exit.i.2, label %loopbody.i.i.2

intSqrt.exit.i.2:                                 ; preds = %ifcont.i.i.2
  %addtmp.i.2 = add nuw nsw i32 %result.1.i.i.2, %modtmp.i.1
  %modtmp.i.2 = urem i32 %addtmp.i.2, 1000000007
  %addtmp7.i.2 = or disjoint i32 %i.012.i, 3
  br label %loopbody.i.i.3

loopbody.i.i.3:                                   ; preds = %ifcont.i.i.3, %intSqrt.exit.i.2
  %result.035.i.i.3 = phi i32 [ %result.1.i.i.3, %ifcont.i.i.3 ], [ 0, %intSqrt.exit.i.2 ]
  %low.034.i.i.3 = phi i32 [ %low.1.i.i.3, %ifcont.i.i.3 ], [ 0, %intSqrt.exit.i.2 ]
  %high.033.i.i.3 = phi i32 [ %high.1.i.i.3, %ifcont.i.i.3 ], [ %addtmp7.i.2, %intSqrt.exit.i.2 ]
  %subtmp.i.i.3 = sub nsw i32 %high.033.i.i.3, %low.034.i.i.3
  %divtmp31.i.i.3 = lshr i32 %subtmp.i.i.3, 1
  %addtmp.i.i.3 = add nuw nsw i32 %divtmp31.i.i.3, %low.034.i.i.3
  %eqtmp.i.i.3 = icmp eq i32 %addtmp.i.i.3, 0
  br i1 %eqtmp.i.i.3, label %ifcont.i.i.3, label %else.i.i.3

else.i.i.3:                                       ; preds = %loopbody.i.i.3
  %divtmp11.i.i.3 = udiv i32 %addtmp7.i.2, %addtmp.i.i.3
  %letmp12.not.i.i.3 = icmp sgt i32 %addtmp.i.i.3, %divtmp11.i.i.3
  br i1 %letmp12.not.i.i.3, label %else14.i.i.3, label %then13.i.i.3

then13.i.i.3:                                     ; preds = %else.i.i.3
  %addtmp18.i.i.3 = add nuw nsw i32 %addtmp.i.i.3, 1
  br label %ifcont.i.i.3

else14.i.i.3:                                     ; preds = %else.i.i.3
  %subtmp20.i.i.3 = add nsw i32 %addtmp.i.i.3, -1
  br label %ifcont.i.i.3

ifcont.i.i.3:                                     ; preds = %else14.i.i.3, %then13.i.i.3, %loopbody.i.i.3
  %high.1.i.i.3 = phi i32 [ %subtmp20.i.i.3, %else14.i.i.3 ], [ %high.033.i.i.3, %then13.i.i.3 ], [ %high.033.i.i.3, %loopbody.i.i.3 ]
  %low.1.i.i.3 = phi i32 [ %low.034.i.i.3, %else14.i.i.3 ], [ %addtmp18.i.i.3, %then13.i.i.3 ], [ 1, %loopbody.i.i.3 ]
  %result.1.i.i.3 = phi i32 [ %result.035.i.i.3, %else14.i.i.3 ], [ %addtmp.i.i.3, %then13.i.i.3 ], [ 0, %loopbody.i.i.3 ]
  %letmp.not.i.i.3 = icmp sgt i32 %low.1.i.i.3, %high.1.i.i.3
  br i1 %letmp.not.i.i.3, label %intSqrt.exit.i.3, label %loopbody.i.i.3

intSqrt.exit.i.3:                                 ; preds = %ifcont.i.i.3
  %addtmp.i.3 = add nuw nsw i32 %result.1.i.i.3, %modtmp.i.2
  %modtmp.i.3 = urem i32 %addtmp.i.3, 1000000007
  %addtmp7.i.3 = add nuw nsw i32 %i.012.i, 4
  br label %loopbody.i.preheader.i

intSqrtStress.exit:                               ; preds = %intSqrt.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
