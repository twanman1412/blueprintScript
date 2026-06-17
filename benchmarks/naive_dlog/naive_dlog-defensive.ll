; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %discreteLog.exit.i, %entry
  %i.026.i = phi i32 [ 1, %entry ], [ %addtmp14.i, %discreteLog.exit.i ]
  %sum.025.i = phi i32 [ 0, %entry ], [ %modtmp.i, %discreteLog.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit41.i.i, %loopbody.i.preheader.i
  %base.050.i.i = phi i32 [ %result.0.lcssa.i25.i.i, %mulMod.exit41.i.i ], [ 2, %loopbody.i.preheader.i ]
  %exp.049.i.i = phi i32 [ %divtmp2346.i.i, %mulMod.exit41.i.i ], [ %i.026.i, %loopbody.i.preheader.i ]
  %result.048.i.i = phi i32 [ %result.145.i.i, %mulMod.exit41.i.i ], [ 1, %loopbody.i.preheader.i ]
  %modtmp5.i.i = and i32 %exp.049.i.i, 1
  %eqtmp.not.i.i = icmp eq i32 %modtmp5.i.i, 0
  br i1 %eqtmp.not.i.i, label %ifcont.i.i, label %then.i.i

then.i.i:                                         ; preds = %loopbody.i.i
  %gttmp26.i.i.i = icmp sgt i32 %base.050.i.i, 0
  br i1 %gttmp26.i.i.i, label %loopbody.i.i.i, label %mulMod.exit41.i.i

loopbody.i.i.i:                                   ; preds = %then.i.i, %ifcont.i.i.i
  %a.029.i.i.i = phi i32 [ %modtmp14.i.i.i, %ifcont.i.i.i ], [ %result.048.i.i, %then.i.i ]
  %b.028.i.i.i = phi i32 [ %divtmp25.i.i.i, %ifcont.i.i.i ], [ %base.050.i.i, %then.i.i ]
  %result.027.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont.i.i.i ], [ 0, %then.i.i ]
  %modtmp5.i.i.i = and i32 %b.028.i.i.i, 1
  %eqtmp.not.i.i.i = icmp eq i32 %modtmp5.i.i.i, 0
  br i1 %eqtmp.not.i.i.i, label %ifcont.i.i.i, label %then.i.i.i

then.i.i.i:                                       ; preds = %loopbody.i.i.i
  %addtmp.i.i.i = add nsw i32 %result.027.i.i.i, %a.029.i.i.i
  %modtmp9.i.i.i = srem i32 %addtmp.i.i.i, 1000003
  br label %ifcont.i.i.i

ifcont.i.i.i:                                     ; preds = %then.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp9.i.i.i, %then.i.i.i ], [ %result.027.i.i.i, %loopbody.i.i.i ]
  %addtmp12.i.i.i = shl nsw i32 %a.029.i.i.i, 1
  %modtmp14.i.i.i = srem i32 %addtmp12.i.i.i, 1000003
  %divtmp25.i.i.i = lshr i32 %b.028.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp25.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %ifcont.i.i, label %loopbody.i.i.i

ifcont.i.i:                                       ; preds = %ifcont.i.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %result.048.i.i, %loopbody.i.i ], [ %result.1.i.i.i, %ifcont.i.i.i ]
  %gttmp26.i24.i.i = icmp sgt i32 %base.050.i.i, 0
  br i1 %gttmp26.i24.i.i, label %loopbody.i26.i.i, label %mulMod.exit41.i.i

loopbody.i26.i.i:                                 ; preds = %ifcont.i.i, %ifcont.i35.i.i
  %a.029.i27.i.i = phi i32 [ %modtmp14.i38.i.i, %ifcont.i35.i.i ], [ %base.050.i.i, %ifcont.i.i ]
  %b.028.i28.i.i = phi i32 [ %divtmp25.i39.i.i, %ifcont.i35.i.i ], [ %base.050.i.i, %ifcont.i.i ]
  %result.027.i29.i.i = phi i32 [ %result.1.i36.i.i, %ifcont.i35.i.i ], [ 0, %ifcont.i.i ]
  %modtmp5.i30.i.i = and i32 %b.028.i28.i.i, 1
  %eqtmp.not.i31.i.i = icmp eq i32 %modtmp5.i30.i.i, 0
  br i1 %eqtmp.not.i31.i.i, label %ifcont.i35.i.i, label %then.i32.i.i

then.i32.i.i:                                     ; preds = %loopbody.i26.i.i
  %addtmp.i33.i.i = add nsw i32 %result.027.i29.i.i, %a.029.i27.i.i
  %modtmp9.i34.i.i = srem i32 %addtmp.i33.i.i, 1000003
  br label %ifcont.i35.i.i

ifcont.i35.i.i:                                   ; preds = %then.i32.i.i, %loopbody.i26.i.i
  %result.1.i36.i.i = phi i32 [ %modtmp9.i34.i.i, %then.i32.i.i ], [ %result.027.i29.i.i, %loopbody.i26.i.i ]
  %addtmp12.i37.i.i = shl nsw i32 %a.029.i27.i.i, 1
  %modtmp14.i38.i.i = srem i32 %addtmp12.i37.i.i, 1000003
  %divtmp25.i39.i.i = lshr i32 %b.028.i28.i.i, 1
  %gttmp.not.i40.i.i = icmp eq i32 %divtmp25.i39.i.i, 0
  br i1 %gttmp.not.i40.i.i, label %mulMod.exit41.i.i, label %loopbody.i26.i.i

mulMod.exit41.i.i:                                ; preds = %ifcont.i35.i.i, %ifcont.i.i, %then.i.i
  %result.145.i.i = phi i32 [ %result.1.i.i, %ifcont.i.i ], [ 0, %then.i.i ], [ %result.1.i.i, %ifcont.i35.i.i ]
  %result.0.lcssa.i25.i.i = phi i32 [ 0, %ifcont.i.i ], [ 0, %then.i.i ], [ %result.1.i36.i.i, %ifcont.i35.i.i ]
  %divtmp2346.i.i = lshr i32 %exp.049.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp2346.i.i, 0
  br i1 %gttmp.not.i.i, label %loopbody.i22.i, label %loopbody.i.i

loopbody.i22.i:                                   ; preds = %mulMod.exit41.i.i, %ifcont.i.1.i.i.7
  %x.015.i.i = phi i32 [ %addtmp.i.i.7, %ifcont.i.1.i.i.7 ], [ 0, %mulMod.exit41.i.i ]
  %value.014.i.i = phi i32 [ %modtmp14.i.i24.i.7, %ifcont.i.1.i.i.7 ], [ 1, %mulMod.exit41.i.i ]
  %eqtmp.i.i = icmp eq i32 %value.014.i.i, %result.145.i.i
  br i1 %eqtmp.i.i, label %discreteLog.exit.i, label %ifcont.i.1.i.i

ifcont.i.1.i.i:                                   ; preds = %loopbody.i22.i
  %addtmp12.i.i23.i = shl nsw i32 %value.014.i.i, 1
  %modtmp14.i.i24.i = srem i32 %addtmp12.i.i23.i, 1000003
  %eqtmp.i.i.1 = icmp eq i32 %modtmp14.i.i24.i, %result.145.i.i
  br i1 %eqtmp.i.i.1, label %discreteLog.exit.i.split.loop.exit13, label %ifcont.i.1.i.i.1

ifcont.i.1.i.i.1:                                 ; preds = %ifcont.i.1.i.i
  %addtmp12.i.i23.i.1 = shl nsw i32 %modtmp14.i.i24.i, 1
  %modtmp14.i.i24.i.1 = srem i32 %addtmp12.i.i23.i.1, 1000003
  %eqtmp.i.i.2 = icmp eq i32 %modtmp14.i.i24.i.1, %result.145.i.i
  br i1 %eqtmp.i.i.2, label %discreteLog.exit.i.split.loop.exit11, label %ifcont.i.1.i.i.2

ifcont.i.1.i.i.2:                                 ; preds = %ifcont.i.1.i.i.1
  %addtmp12.i.i23.i.2 = shl nsw i32 %modtmp14.i.i24.i.1, 1
  %modtmp14.i.i24.i.2 = srem i32 %addtmp12.i.i23.i.2, 1000003
  %exitcond.not.i.i.2 = icmp eq i32 %x.015.i.i, 1000000
  br i1 %exitcond.not.i.i.2, label %discreteLog.exit.i, label %loopbody.i22.i.3

loopbody.i22.i.3:                                 ; preds = %ifcont.i.1.i.i.2
  %eqtmp.i.i.3 = icmp eq i32 %modtmp14.i.i24.i.2, %result.145.i.i
  br i1 %eqtmp.i.i.3, label %discreteLog.exit.i.split.loop.exit7, label %ifcont.i.1.i.i.3

ifcont.i.1.i.i.3:                                 ; preds = %loopbody.i22.i.3
  %addtmp12.i.i23.i.3 = shl nsw i32 %modtmp14.i.i24.i.2, 1
  %modtmp14.i.i24.i.3 = srem i32 %addtmp12.i.i23.i.3, 1000003
  %eqtmp.i.i.4 = icmp eq i32 %modtmp14.i.i24.i.3, %result.145.i.i
  br i1 %eqtmp.i.i.4, label %discreteLog.exit.i.split.loop.exit5, label %ifcont.i.1.i.i.4

ifcont.i.1.i.i.4:                                 ; preds = %ifcont.i.1.i.i.3
  %addtmp12.i.i23.i.4 = shl nsw i32 %modtmp14.i.i24.i.3, 1
  %modtmp14.i.i24.i.4 = srem i32 %addtmp12.i.i23.i.4, 1000003
  %eqtmp.i.i.5 = icmp eq i32 %modtmp14.i.i24.i.4, %result.145.i.i
  br i1 %eqtmp.i.i.5, label %discreteLog.exit.i.split.loop.exit3, label %ifcont.i.1.i.i.5

ifcont.i.1.i.i.5:                                 ; preds = %ifcont.i.1.i.i.4
  %addtmp12.i.i23.i.5 = shl nsw i32 %modtmp14.i.i24.i.4, 1
  %modtmp14.i.i24.i.5 = srem i32 %addtmp12.i.i23.i.5, 1000003
  %eqtmp.i.i.6 = icmp eq i32 %modtmp14.i.i24.i.5, %result.145.i.i
  br i1 %eqtmp.i.i.6, label %discreteLog.exit.i.split.loop.exit1, label %ifcont.i.1.i.i.6

ifcont.i.1.i.i.6:                                 ; preds = %ifcont.i.1.i.i.5
  %addtmp12.i.i23.i.6 = shl nsw i32 %modtmp14.i.i24.i.5, 1
  %modtmp14.i.i24.i.6 = srem i32 %addtmp12.i.i23.i.6, 1000003
  %eqtmp.i.i.7 = icmp eq i32 %modtmp14.i.i24.i.6, %result.145.i.i
  br i1 %eqtmp.i.i.7, label %discreteLog.exit.i.split.loop.exit, label %ifcont.i.1.i.i.7

ifcont.i.1.i.i.7:                                 ; preds = %ifcont.i.1.i.i.6
  %addtmp12.i.i23.i.7 = shl nsw i32 %modtmp14.i.i24.i.6, 1
  %modtmp14.i.i24.i.7 = srem i32 %addtmp12.i.i23.i.7, 1000003
  %addtmp.i.i.7 = add nuw nsw i32 %x.015.i.i, 8
  br label %loopbody.i22.i

discreteLog.exit.i.split.loop.exit:               ; preds = %ifcont.i.1.i.i.6
  %addtmp.i.i.6.le = or disjoint i32 %x.015.i.i, 7
  br label %discreteLog.exit.i

discreteLog.exit.i.split.loop.exit1:              ; preds = %ifcont.i.1.i.i.5
  %addtmp.i.i.5.le = or disjoint i32 %x.015.i.i, 6
  br label %discreteLog.exit.i

discreteLog.exit.i.split.loop.exit3:              ; preds = %ifcont.i.1.i.i.4
  %addtmp.i.i.4.le = or disjoint i32 %x.015.i.i, 5
  br label %discreteLog.exit.i

discreteLog.exit.i.split.loop.exit5:              ; preds = %ifcont.i.1.i.i.3
  %addtmp.i.i.3.le = or disjoint i32 %x.015.i.i, 4
  br label %discreteLog.exit.i

discreteLog.exit.i.split.loop.exit7:              ; preds = %loopbody.i22.i.3
  %addtmp.i.i.2.le = or disjoint i32 %x.015.i.i, 3
  br label %discreteLog.exit.i

discreteLog.exit.i.split.loop.exit11:             ; preds = %ifcont.i.1.i.i.1
  %addtmp.i.i.1.le = or disjoint i32 %x.015.i.i, 2
  br label %discreteLog.exit.i

discreteLog.exit.i.split.loop.exit13:             ; preds = %ifcont.i.1.i.i
  %addtmp.i.i.le = or disjoint i32 %x.015.i.i, 1
  br label %discreteLog.exit.i

discreteLog.exit.i:                               ; preds = %loopbody.i22.i, %ifcont.i.1.i.i.2, %discreteLog.exit.i.split.loop.exit13, %discreteLog.exit.i.split.loop.exit11, %discreteLog.exit.i.split.loop.exit7, %discreteLog.exit.i.split.loop.exit5, %discreteLog.exit.i.split.loop.exit3, %discreteLog.exit.i.split.loop.exit1, %discreteLog.exit.i.split.loop.exit
  %common.ret.op.i.i = phi i32 [ %addtmp.i.i.6.le, %discreteLog.exit.i.split.loop.exit ], [ %addtmp.i.i.le, %discreteLog.exit.i.split.loop.exit13 ], [ %addtmp.i.i.1.le, %discreteLog.exit.i.split.loop.exit11 ], [ %addtmp.i.i.4.le, %discreteLog.exit.i.split.loop.exit3 ], [ -1, %ifcont.i.1.i.i.2 ], [ %addtmp.i.i.2.le, %discreteLog.exit.i.split.loop.exit7 ], [ %addtmp.i.i.3.le, %discreteLog.exit.i.split.loop.exit5 ], [ %addtmp.i.i.5.le, %discreteLog.exit.i.split.loop.exit1 ], [ %x.015.i.i, %loopbody.i22.i ]
  %addtmp.i = add nsw i32 %common.ret.op.i.i, %sum.025.i
  %modtmp.i = srem i32 %addtmp.i, 1000003
  %addtmp14.i = add nuw nsw i32 %i.026.i, 1
  %exitcond.not.i = icmp eq i32 %addtmp14.i, 100001
  br i1 %exitcond.not.i, label %dlogStress.exit, label %loopbody.i.preheader.i

dlogStress.exit:                                  ; preds = %discreteLog.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
