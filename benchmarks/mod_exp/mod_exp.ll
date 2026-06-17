; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %modExp.exit.i, %entry
  %result.017.i = phi i32 [ 0, %entry ], [ %modtmp.i, %modExp.exit.i ]
  %i.016.i = phi i32 [ 1, %entry ], [ %addtmp10.i, %modExp.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit54.i.i.1, %loopbody.i.preheader.i
  %base.057.i.i = phi i32 [ %i.016.i, %loopbody.i.preheader.i ], [ %common.ret.op.i53.i.i.1, %mulMod.exit54.i.i.1 ]
  %exp.056.i.i = phi i32 [ 2147483647, %loopbody.i.preheader.i ], [ %divtmp34.i.i.1, %mulMod.exit54.i.i.1 ]
  %result.055.i.i = phi i32 [ 1, %loopbody.i.preheader.i ], [ %result.1.i.i.1, %mulMod.exit54.i.i.1 ]
  %modtmp12.i.i = and i32 %exp.056.i.i, 1
  %eqtmp13.not.i.i = icmp eq i32 %modtmp12.i.i, 0
  br i1 %eqtmp13.not.i.i, label %ifcont.i.i, label %then.i.i

then.i.i:                                         ; preds = %loopbody.i.i
  %eqtmp.i.i.i = icmp eq i32 %result.055.i.i, 0
  %eqtmp3.i.i.i = icmp eq i32 %base.057.i.i, 0
  %or.cond.i.i.i = or i1 %eqtmp3.i.i.i, %eqtmp.i.i.i
  br i1 %or.cond.i.i.i, label %ifcont.i.i, label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %then.i.i, %ifcont.i.i.i
  %a.038.in.i.i.i = phi i32 [ %addtmp18.i.i.i, %ifcont.i.i.i ], [ %result.055.i.i, %then.i.i ]
  %b.037.i.i.i = phi i32 [ %divtmp34.i.i.i, %ifcont.i.i.i ], [ %base.057.i.i, %then.i.i ]
  %result.036.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont.i.i.i ], [ 0, %then.i.i ]
  %a.038.i.i.i = srem i32 %a.038.in.i.i.i, 1000000007
  %modtmp10.i.i.i = and i32 %b.037.i.i.i, 1
  %eqtmp11.not.i.i.i = icmp eq i32 %modtmp10.i.i.i, 0
  br i1 %eqtmp11.not.i.i.i, label %ifcont.i.i.i, label %then.i.i.i

then.i.i.i:                                       ; preds = %loopbody.i.i.i
  %addtmp.i.i.i = add nsw i32 %result.036.i.i.i, %a.038.i.i.i
  %modtmp15.i.i.i = srem i32 %addtmp.i.i.i, 1000000007
  br label %ifcont.i.i.i

ifcont.i.i.i:                                     ; preds = %then.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp15.i.i.i, %then.i.i.i ], [ %result.036.i.i.i, %loopbody.i.i.i ]
  %addtmp18.i.i.i = shl nsw i32 %a.038.i.i.i, 1
  %divtmp34.i.i.i = lshr i32 %b.037.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp34.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %ifcont.i.i, label %loopbody.i.i.i

ifcont.i.i:                                       ; preds = %ifcont.i.i.i, %then.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %result.055.i.i, %loopbody.i.i ], [ 0, %then.i.i ], [ %result.1.i.i.i, %ifcont.i.i.i ]
  %eqtmp3.i36.i.i = icmp eq i32 %base.057.i.i, 0
  br i1 %eqtmp3.i36.i.i, label %mulMod.exit54.i.i, label %loopbody.i38.i.i

loopbody.i38.i.i:                                 ; preds = %ifcont.i.i, %ifcont.i48.i.i
  %a.038.in.i39.i.i = phi i32 [ %addtmp18.i50.i.i, %ifcont.i48.i.i ], [ %base.057.i.i, %ifcont.i.i ]
  %b.037.i40.i.i = phi i32 [ %divtmp34.i51.i.i, %ifcont.i48.i.i ], [ %base.057.i.i, %ifcont.i.i ]
  %result.036.i41.i.i = phi i32 [ %result.1.i49.i.i, %ifcont.i48.i.i ], [ 0, %ifcont.i.i ]
  %a.038.i42.i.i = srem i32 %a.038.in.i39.i.i, 1000000007
  %modtmp10.i43.i.i = and i32 %b.037.i40.i.i, 1
  %eqtmp11.not.i44.i.i = icmp eq i32 %modtmp10.i43.i.i, 0
  br i1 %eqtmp11.not.i44.i.i, label %ifcont.i48.i.i, label %then.i45.i.i

then.i45.i.i:                                     ; preds = %loopbody.i38.i.i
  %addtmp.i46.i.i = add nsw i32 %result.036.i41.i.i, %a.038.i42.i.i
  %modtmp15.i47.i.i = srem i32 %addtmp.i46.i.i, 1000000007
  br label %ifcont.i48.i.i

ifcont.i48.i.i:                                   ; preds = %then.i45.i.i, %loopbody.i38.i.i
  %result.1.i49.i.i = phi i32 [ %modtmp15.i47.i.i, %then.i45.i.i ], [ %result.036.i41.i.i, %loopbody.i38.i.i ]
  %addtmp18.i50.i.i = shl nsw i32 %a.038.i42.i.i, 1
  %divtmp34.i51.i.i = lshr i32 %b.037.i40.i.i, 1
  %gttmp.not.i52.i.i = icmp eq i32 %divtmp34.i51.i.i, 0
  br i1 %gttmp.not.i52.i.i, label %mulMod.exit54.i.i, label %loopbody.i38.i.i

mulMod.exit54.i.i:                                ; preds = %ifcont.i48.i.i, %ifcont.i.i
  %common.ret.op.i53.i.i = phi i32 [ 0, %ifcont.i.i ], [ %result.1.i49.i.i, %ifcont.i48.i.i ]
  %gttmp.not.i.i = icmp samesign ult i32 %exp.056.i.i, 2
  br i1 %gttmp.not.i.i, label %modExp.exit.i, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %mulMod.exit54.i.i
  %0 = and i32 %exp.056.i.i, 2
  %eqtmp13.not.i.i.1 = icmp eq i32 %0, 0
  br i1 %eqtmp13.not.i.i.1, label %ifcont.i.i.1, label %then.i.i.1

then.i.i.1:                                       ; preds = %loopbody.i.i.1
  %eqtmp.i.i.i.1 = icmp eq i32 %result.1.i.i, 0
  %eqtmp3.i.i.i.1 = icmp eq i32 %common.ret.op.i53.i.i, 0
  %or.cond.i.i.i.1 = or i1 %eqtmp3.i.i.i.1, %eqtmp.i.i.i.1
  br i1 %or.cond.i.i.i.1, label %ifcont.i.i.1, label %loopbody.i.i.i.1

loopbody.i.i.i.1:                                 ; preds = %then.i.i.1, %ifcont.i.i.i.1
  %a.038.in.i.i.i.1 = phi i32 [ %addtmp18.i.i.i.1, %ifcont.i.i.i.1 ], [ %result.1.i.i, %then.i.i.1 ]
  %b.037.i.i.i.1 = phi i32 [ %divtmp34.i.i.i.1, %ifcont.i.i.i.1 ], [ %common.ret.op.i53.i.i, %then.i.i.1 ]
  %result.036.i.i.i.1 = phi i32 [ %result.1.i.i.i.1, %ifcont.i.i.i.1 ], [ 0, %then.i.i.1 ]
  %a.038.i.i.i.1 = srem i32 %a.038.in.i.i.i.1, 1000000007
  %modtmp10.i.i.i.1 = and i32 %b.037.i.i.i.1, 1
  %eqtmp11.not.i.i.i.1 = icmp eq i32 %modtmp10.i.i.i.1, 0
  br i1 %eqtmp11.not.i.i.i.1, label %ifcont.i.i.i.1, label %then.i.i.i.1

then.i.i.i.1:                                     ; preds = %loopbody.i.i.i.1
  %addtmp.i.i.i.1 = add nsw i32 %result.036.i.i.i.1, %a.038.i.i.i.1
  %modtmp15.i.i.i.1 = srem i32 %addtmp.i.i.i.1, 1000000007
  br label %ifcont.i.i.i.1

ifcont.i.i.i.1:                                   ; preds = %then.i.i.i.1, %loopbody.i.i.i.1
  %result.1.i.i.i.1 = phi i32 [ %modtmp15.i.i.i.1, %then.i.i.i.1 ], [ %result.036.i.i.i.1, %loopbody.i.i.i.1 ]
  %addtmp18.i.i.i.1 = shl nsw i32 %a.038.i.i.i.1, 1
  %divtmp34.i.i.i.1 = lshr i32 %b.037.i.i.i.1, 1
  %gttmp.not.i.i.i.1 = icmp eq i32 %divtmp34.i.i.i.1, 0
  br i1 %gttmp.not.i.i.i.1, label %ifcont.i.i.1, label %loopbody.i.i.i.1

ifcont.i.i.1:                                     ; preds = %ifcont.i.i.i.1, %then.i.i.1, %loopbody.i.i.1
  %result.1.i.i.1 = phi i32 [ %result.1.i.i, %loopbody.i.i.1 ], [ 0, %then.i.i.1 ], [ %result.1.i.i.i.1, %ifcont.i.i.i.1 ]
  %divtmp34.i.i.1 = lshr i32 %exp.056.i.i, 2
  %eqtmp3.i36.i.i.1 = icmp eq i32 %common.ret.op.i53.i.i, 0
  br i1 %eqtmp3.i36.i.i.1, label %mulMod.exit54.i.i.1, label %loopbody.i38.i.i.1

loopbody.i38.i.i.1:                               ; preds = %ifcont.i.i.1, %ifcont.i48.i.i.1
  %a.038.in.i39.i.i.1 = phi i32 [ %addtmp18.i50.i.i.1, %ifcont.i48.i.i.1 ], [ %common.ret.op.i53.i.i, %ifcont.i.i.1 ]
  %b.037.i40.i.i.1 = phi i32 [ %divtmp34.i51.i.i.1, %ifcont.i48.i.i.1 ], [ %common.ret.op.i53.i.i, %ifcont.i.i.1 ]
  %result.036.i41.i.i.1 = phi i32 [ %result.1.i49.i.i.1, %ifcont.i48.i.i.1 ], [ 0, %ifcont.i.i.1 ]
  %a.038.i42.i.i.1 = srem i32 %a.038.in.i39.i.i.1, 1000000007
  %modtmp10.i43.i.i.1 = and i32 %b.037.i40.i.i.1, 1
  %eqtmp11.not.i44.i.i.1 = icmp eq i32 %modtmp10.i43.i.i.1, 0
  br i1 %eqtmp11.not.i44.i.i.1, label %ifcont.i48.i.i.1, label %then.i45.i.i.1

then.i45.i.i.1:                                   ; preds = %loopbody.i38.i.i.1
  %addtmp.i46.i.i.1 = add nsw i32 %result.036.i41.i.i.1, %a.038.i42.i.i.1
  %modtmp15.i47.i.i.1 = srem i32 %addtmp.i46.i.i.1, 1000000007
  br label %ifcont.i48.i.i.1

ifcont.i48.i.i.1:                                 ; preds = %then.i45.i.i.1, %loopbody.i38.i.i.1
  %result.1.i49.i.i.1 = phi i32 [ %modtmp15.i47.i.i.1, %then.i45.i.i.1 ], [ %result.036.i41.i.i.1, %loopbody.i38.i.i.1 ]
  %addtmp18.i50.i.i.1 = shl nsw i32 %a.038.i42.i.i.1, 1
  %divtmp34.i51.i.i.1 = lshr i32 %b.037.i40.i.i.1, 1
  %gttmp.not.i52.i.i.1 = icmp eq i32 %divtmp34.i51.i.i.1, 0
  br i1 %gttmp.not.i52.i.i.1, label %mulMod.exit54.i.i.1, label %loopbody.i38.i.i.1

mulMod.exit54.i.i.1:                              ; preds = %ifcont.i48.i.i.1, %ifcont.i.i.1
  %common.ret.op.i53.i.i.1 = phi i32 [ 0, %ifcont.i.i.1 ], [ %result.1.i49.i.i.1, %ifcont.i48.i.i.1 ]
  br label %loopbody.i.i

modExp.exit.i:                                    ; preds = %mulMod.exit54.i.i
  %addtmp.i = add nsw i32 %result.1.i.i, %result.017.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp10.i = add nuw nsw i32 %i.016.i, 1
  %exitcond.not.i = icmp eq i32 %addtmp10.i, 1000001
  br i1 %exitcond.not.i, label %modExpStress.exit, label %loopbody.i.preheader.i

modExpStress.exit:                                ; preds = %modExp.exit.i
  %1 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
