; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.i.preheader.i

loopbody.i.i.preheader.i:                         ; preds = %modInverse.exit.i, %entry
  %result.016.i = phi i32 [ 0, %entry ], [ %modtmp.i, %modInverse.exit.i ]
  %i.015.i = phi i32 [ 1, %entry ], [ %addtmp9.i, %modInverse.exit.i ]
  br label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %mulMod.exit58.i.i.i, %loopbody.i.i.preheader.i
  %base.161.i.i.i = phi i32 [ %common.ret.op.i57.i.i.i, %mulMod.exit58.i.i.i ], [ %i.015.i, %loopbody.i.i.preheader.i ]
  %exp.060.i.i.i = phi i32 [ %divtmp35.i.i.i, %mulMod.exit58.i.i.i ], [ 1000000005, %loopbody.i.i.preheader.i ]
  %result.059.i.i.i = phi i32 [ %result.1.i.i.i, %mulMod.exit58.i.i.i ], [ 1, %loopbody.i.i.preheader.i ]
  %modtmp9.i.i.i = and i32 %exp.060.i.i.i, 1
  %eqtmp10.not.i.i.i = icmp eq i32 %modtmp9.i.i.i, 0
  br i1 %eqtmp10.not.i.i.i, label %ifcont13.i.i.i, label %then11.i.i.i

then11.i.i.i:                                     ; preds = %loopbody.i.i.i
  %eqtmp.i.i.i.i = icmp eq i32 %result.059.i.i.i, 0
  %eqtmp3.i.i.i.i = icmp eq i32 %base.161.i.i.i, 0
  %or.cond.i.i.i.i = or i1 %eqtmp3.i.i.i.i, %eqtmp.i.i.i.i
  br i1 %or.cond.i.i.i.i, label %ifcont13.i.i.i, label %loopbody.i.i.i.i

loopbody.i.i.i.i:                                 ; preds = %then11.i.i.i, %ifcont17.i.i.i.i
  %a.147.i.in.i.i.i = phi i32 [ %addtmp25.i.i.i.i, %ifcont17.i.i.i.i ], [ %result.059.i.i.i, %then11.i.i.i ]
  %b.046.i.i.i.i = phi i32 [ %divtmp44.i.i.i.i, %ifcont17.i.i.i.i ], [ %base.161.i.i.i, %then11.i.i.i ]
  %result.045.i.i.i.i = phi i32 [ %result.1.i.i.i.i, %ifcont17.i.i.i.i ], [ 0, %then11.i.i.i ]
  %a.147.i.i.i.i = srem i32 %a.147.i.in.i.i.i, 1000000007
  %modtmp13.i.i.i.i = and i32 %b.046.i.i.i.i, 1
  %eqtmp14.not.i.i.i.i = icmp eq i32 %modtmp13.i.i.i.i, 0
  br i1 %eqtmp14.not.i.i.i.i, label %ifcont17.i.i.i.i, label %then15.i.i.i.i

then15.i.i.i.i:                                   ; preds = %loopbody.i.i.i.i
  %addtmp20.i.i.i.i = add nsw i32 %result.045.i.i.i.i, %a.147.i.i.i.i
  %modtmp22.i.i.i.i = srem i32 %addtmp20.i.i.i.i, 1000000007
  br label %ifcont17.i.i.i.i

ifcont17.i.i.i.i:                                 ; preds = %then15.i.i.i.i, %loopbody.i.i.i.i
  %result.1.i.i.i.i = phi i32 [ %modtmp22.i.i.i.i, %then15.i.i.i.i ], [ %result.045.i.i.i.i, %loopbody.i.i.i.i ]
  %addtmp25.i.i.i.i = shl nsw i32 %a.147.i.i.i.i, 1
  %divtmp44.i.i.i.i = lshr i32 %b.046.i.i.i.i, 1
  %gttmp.not.i.i.i.i = icmp eq i32 %divtmp44.i.i.i.i, 0
  br i1 %gttmp.not.i.i.i.i, label %ifcont13.i.i.i, label %loopbody.i.i.i.i

ifcont13.i.i.i:                                   ; preds = %ifcont17.i.i.i.i, %then11.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %result.059.i.i.i, %loopbody.i.i.i ], [ 0, %then11.i.i.i ], [ %result.1.i.i.i.i, %ifcont17.i.i.i.i ]
  %divtmp35.i.i.i = lshr i32 %exp.060.i.i.i, 1
  %eqtmp3.i37.i.i.i = icmp eq i32 %base.161.i.i.i, 0
  br i1 %eqtmp3.i37.i.i.i, label %mulMod.exit58.i.i.i, label %default.next5.i39.i.i.i

default.next5.i39.i.i.i:                          ; preds = %ifcont13.i.i.i
  %modtmp.i40.i.i.i = srem i32 %base.161.i.i.i, 1000000007
  %lttmp.i.i.i.i = icmp slt i32 %modtmp.i40.i.i.i, 0
  %addtmp.i41.i.i.i = add nsw i32 %modtmp.i40.i.i.i, 1000000007
  %spec.select.i.i.i.i = select i1 %lttmp.i.i.i.i, i32 %addtmp.i41.i.i.i, i32 %modtmp.i40.i.i.i
  br label %loopbody.i42.i.i.i

loopbody.i42.i.i.i:                               ; preds = %ifcont17.i51.i.i.i, %default.next5.i39.i.i.i
  %a.147.i43.i.i.i = phi i32 [ %spec.select.i.i.i.i, %default.next5.i39.i.i.i ], [ %modtmp27.i54.i.i.i, %ifcont17.i51.i.i.i ]
  %b.046.i44.i.i.i = phi i32 [ %base.161.i.i.i, %default.next5.i39.i.i.i ], [ %divtmp44.i55.i.i.i, %ifcont17.i51.i.i.i ]
  %result.045.i45.i.i.i = phi i32 [ 0, %default.next5.i39.i.i.i ], [ %result.1.i52.i.i.i, %ifcont17.i51.i.i.i ]
  %modtmp13.i46.i.i.i = and i32 %b.046.i44.i.i.i, 1
  %eqtmp14.not.i47.i.i.i = icmp eq i32 %modtmp13.i46.i.i.i, 0
  br i1 %eqtmp14.not.i47.i.i.i, label %ifcont17.i51.i.i.i, label %then15.i48.i.i.i

then15.i48.i.i.i:                                 ; preds = %loopbody.i42.i.i.i
  %addtmp20.i49.i.i.i = add nsw i32 %result.045.i45.i.i.i, %a.147.i43.i.i.i
  %modtmp22.i50.i.i.i = srem i32 %addtmp20.i49.i.i.i, 1000000007
  br label %ifcont17.i51.i.i.i

ifcont17.i51.i.i.i:                               ; preds = %then15.i48.i.i.i, %loopbody.i42.i.i.i
  %result.1.i52.i.i.i = phi i32 [ %modtmp22.i50.i.i.i, %then15.i48.i.i.i ], [ %result.045.i45.i.i.i, %loopbody.i42.i.i.i ]
  %addtmp25.i53.i.i.i = shl nsw i32 %a.147.i43.i.i.i, 1
  %modtmp27.i54.i.i.i = srem i32 %addtmp25.i53.i.i.i, 1000000007
  %divtmp44.i55.i.i.i = lshr i32 %b.046.i44.i.i.i, 1
  %gttmp.not.i56.i.i.i = icmp eq i32 %divtmp44.i55.i.i.i, 0
  br i1 %gttmp.not.i56.i.i.i, label %mulMod.exit58.i.i.i, label %loopbody.i42.i.i.i

mulMod.exit58.i.i.i:                              ; preds = %ifcont17.i51.i.i.i, %ifcont13.i.i.i
  %common.ret.op.i57.i.i.i = phi i32 [ 0, %ifcont13.i.i.i ], [ %result.1.i52.i.i.i, %ifcont17.i51.i.i.i ]
  %gttmp.not.i.i.i = icmp eq i32 %divtmp35.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %modInverse.exit.i, label %loopbody.i.i.i

modInverse.exit.i:                                ; preds = %mulMod.exit58.i.i.i
  %addtmp.i = add nsw i32 %result.1.i.i.i, %result.016.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp9.i = add nuw nsw i32 %i.015.i, 1
  %exitcond.not.i = icmp eq i32 %addtmp9.i, 2000001
  br i1 %exitcond.not.i, label %modInverseStress.exit, label %loopbody.i.i.preheader.i

modInverseStress.exit:                            ; preds = %modInverse.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
