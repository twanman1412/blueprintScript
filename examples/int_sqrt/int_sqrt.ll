; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %ifcont.i, %entry
  %result.037.i = phi i32 [ 0, %entry ], [ %result.1.i, %ifcont.i ]
  %low.036.i = phi i32 [ 0, %entry ], [ %low.1.i, %ifcont.i ]
  %high.035.i = phi i32 [ 70, %entry ], [ %high.1.i, %ifcont.i ]
  %subtmp.i = sub nsw i32 %high.035.i, %low.036.i
  %divtmp34.i = lshr i32 %subtmp.i, 1
  %addtmp.i = add nuw nsw i32 %divtmp34.i, %low.036.i
  %eqtmp9.i = icmp eq i32 %addtmp.i, 0
  br i1 %eqtmp9.i, label %ifcont.i, label %else.i

else.i:                                           ; preds = %loopbody.i
  %divtmp13.i = udiv i32 70, %addtmp.i
  %letmp14.not.i = icmp sgt i32 %addtmp.i, %divtmp13.i
  br i1 %letmp14.not.i, label %else16.i, label %then15.i

ifcont.i:                                         ; preds = %else16.i, %then15.i, %loopbody.i
  %high.1.i = phi i32 [ %subtmp22.i, %else16.i ], [ %high.035.i, %then15.i ], [ %high.035.i, %loopbody.i ]
  %low.1.i = phi i32 [ %low.036.i, %else16.i ], [ %addtmp20.i, %then15.i ], [ 1, %loopbody.i ]
  %result.1.i = phi i32 [ %result.037.i, %else16.i ], [ %addtmp.i, %then15.i ], [ 0, %loopbody.i ]
  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i
  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i

then15.i:                                         ; preds = %else.i
  %addtmp20.i = add nuw nsw i32 %addtmp.i, 1
  br label %ifcont.i

else16.i:                                         ; preds = %else.i
  %subtmp22.i = add nsw i32 %addtmp.i, -1
  br label %ifcont.i

intSqrt.exit:                                     ; preds = %ifcont.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %result.1.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
