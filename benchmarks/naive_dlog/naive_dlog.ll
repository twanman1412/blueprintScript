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
  %i.027.i = phi i32 [ 1, %entry ], [ %addtmp14.i, %discreteLog.exit.i ]
  %sum.026.i = phi i32 [ 0, %entry ], [ %modtmp.i, %discreteLog.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit46.i.i, %loopbody.i.preheader.i
  %base.049.i.i = phi i32 [ %common.ret.op.i45.i.i, %mulMod.exit46.i.i ], [ 2, %loopbody.i.preheader.i ]
  %exp.048.i.i = phi i32 [ %divtmp26.i.i, %mulMod.exit46.i.i ], [ %i.027.i, %loopbody.i.preheader.i ]
  %result.047.i.i = phi i32 [ %result.1.i.i, %mulMod.exit46.i.i ], [ 1, %loopbody.i.preheader.i ]
  %modtmp6.i.i = and i32 %exp.048.i.i, 1
  %eqtmp7.not.i.i = icmp eq i32 %modtmp6.i.i, 0
  br i1 %eqtmp7.not.i.i, label %ifcont.i.i, label %then.i.i

then.i.i:                                         ; preds = %loopbody.i.i
  %eqtmp.i.i.i = icmp eq i32 %result.047.i.i, 0
  %eqtmp3.i.i.i = icmp eq i32 %base.049.i.i, 0
  %or.cond.i.i.i = or i1 %eqtmp3.i.i.i, %eqtmp.i.i.i
  br i1 %or.cond.i.i.i, label %ifcont.i.i, label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %then.i.i, %ifcont.i.i.i
  %a.037.in.i.i.i = phi i32 [ %addtmp18.i.i.i, %ifcont.i.i.i ], [ %result.047.i.i, %then.i.i ]
  %b.036.i.i.i = phi i32 [ %divtmp34.i.i.i, %ifcont.i.i.i ], [ %base.049.i.i, %then.i.i ]
  %result.035.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont.i.i.i ], [ 0, %then.i.i ]
  %a.037.i.i.i = urem i32 %a.037.in.i.i.i, 1000003
  %modtmp10.i.i.i = and i32 %b.036.i.i.i, 1
  %eqtmp11.not.i.i.i = icmp eq i32 %modtmp10.i.i.i, 0
  br i1 %eqtmp11.not.i.i.i, label %ifcont.i.i.i, label %then.i.i.i

then.i.i.i:                                       ; preds = %loopbody.i.i.i
  %addtmp.i.i.i = add nuw nsw i32 %result.035.i.i.i, %a.037.i.i.i
  %modtmp15.i.i.i = urem i32 %addtmp.i.i.i, 1000003
  br label %ifcont.i.i.i

ifcont.i.i.i:                                     ; preds = %then.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp15.i.i.i, %then.i.i.i ], [ %result.035.i.i.i, %loopbody.i.i.i ]
  %addtmp18.i.i.i = shl nuw nsw i32 %a.037.i.i.i, 1
  %divtmp34.i.i.i = lshr i32 %b.036.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp34.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %ifcont.i.i, label %loopbody.i.i.i

ifcont.i.i:                                       ; preds = %ifcont.i.i.i, %then.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %result.047.i.i, %loopbody.i.i ], [ 0, %then.i.i ], [ %result.1.i.i.i, %ifcont.i.i.i ]
  %divtmp26.i.i = lshr i32 %exp.048.i.i, 1
  %eqtmp3.i28.i.i = icmp eq i32 %base.049.i.i, 0
  br i1 %eqtmp3.i28.i.i, label %mulMod.exit46.i.i, label %loopbody.i30.i.i

loopbody.i30.i.i:                                 ; preds = %ifcont.i.i, %ifcont.i40.i.i
  %a.037.in.i31.i.i = phi i32 [ %addtmp18.i42.i.i, %ifcont.i40.i.i ], [ %base.049.i.i, %ifcont.i.i ]
  %b.036.i32.i.i = phi i32 [ %divtmp34.i43.i.i, %ifcont.i40.i.i ], [ %base.049.i.i, %ifcont.i.i ]
  %result.035.i33.i.i = phi i32 [ %result.1.i41.i.i, %ifcont.i40.i.i ], [ 0, %ifcont.i.i ]
  %a.037.i34.i.i = urem i32 %a.037.in.i31.i.i, 1000003
  %modtmp10.i35.i.i = and i32 %b.036.i32.i.i, 1
  %eqtmp11.not.i36.i.i = icmp eq i32 %modtmp10.i35.i.i, 0
  br i1 %eqtmp11.not.i36.i.i, label %ifcont.i40.i.i, label %then.i37.i.i

then.i37.i.i:                                     ; preds = %loopbody.i30.i.i
  %addtmp.i38.i.i = add nuw nsw i32 %result.035.i33.i.i, %a.037.i34.i.i
  %modtmp15.i39.i.i = urem i32 %addtmp.i38.i.i, 1000003
  br label %ifcont.i40.i.i

ifcont.i40.i.i:                                   ; preds = %then.i37.i.i, %loopbody.i30.i.i
  %result.1.i41.i.i = phi i32 [ %modtmp15.i39.i.i, %then.i37.i.i ], [ %result.035.i33.i.i, %loopbody.i30.i.i ]
  %addtmp18.i42.i.i = shl nuw nsw i32 %a.037.i34.i.i, 1
  %divtmp34.i43.i.i = lshr i32 %b.036.i32.i.i, 1
  %gttmp.not.i44.i.i = icmp eq i32 %divtmp34.i43.i.i, 0
  br i1 %gttmp.not.i44.i.i, label %mulMod.exit46.i.i, label %loopbody.i30.i.i

mulMod.exit46.i.i:                                ; preds = %ifcont.i40.i.i, %ifcont.i.i
  %common.ret.op.i45.i.i = phi i32 [ 0, %ifcont.i.i ], [ %result.1.i41.i.i, %ifcont.i40.i.i ]
  %gttmp.not.i.i = icmp eq i32 %divtmp26.i.i, 0
  br i1 %gttmp.not.i.i, label %modExp.exit.i, label %loopbody.i.i

modExp.exit.i:                                    ; preds = %mulMod.exit46.i.i
  %eqtmp.i.i = icmp eq i32 %result.1.i.i, 1
  br i1 %eqtmp.i.i, label %discreteLog.exit.i, label %loopbody.i22.i

loopbody.i22.i:                                   ; preds = %modExp.exit.i, %mulMod.exit.i.i.7
  %x.019.i.i = phi i32 [ %addtmp.i.i.7, %mulMod.exit.i.i.7 ], [ 0, %modExp.exit.i ]
  %value.018.i.i = phi i32 [ %common.ret.op.i.i.i.7, %mulMod.exit.i.i.7 ], [ 1, %modExp.exit.i ]
  %eqtmp6.i.i = icmp eq i32 %value.018.i.i, %result.1.i.i
  br i1 %eqtmp6.i.i, label %discreteLog.exit.i, label %ifcont.i23.i

ifcont.i23.i:                                     ; preds = %loopbody.i22.i
  %eqtmp.i.i24.i = icmp eq i32 %value.018.i.i, 0
  br i1 %eqtmp.i.i24.i, label %mulMod.exit.i.i, label %ifcont.i.1.i.i

ifcont.i.1.i.i:                                   ; preds = %ifcont.i23.i
  %addtmp18.i.i25.i = shl nuw nsw i32 %value.018.i.i, 1
  %a.037.i.1.i.i = urem i32 %addtmp18.i.i25.i, 1000003
  br label %mulMod.exit.i.i

mulMod.exit.i.i:                                  ; preds = %ifcont.i.1.i.i, %ifcont.i23.i
  %common.ret.op.i.i.i = phi i32 [ 0, %ifcont.i23.i ], [ %a.037.i.1.i.i, %ifcont.i.1.i.i ]
  %eqtmp6.i.i.1 = icmp eq i32 %common.ret.op.i.i.i, %result.1.i.i
  br i1 %eqtmp6.i.i.1, label %discreteLog.exit.i.loopexit.split.loop.exit13, label %ifcont.i23.i.1

ifcont.i23.i.1:                                   ; preds = %mulMod.exit.i.i
  %eqtmp.i.i24.i.1 = icmp eq i32 %common.ret.op.i.i.i, 0
  br i1 %eqtmp.i.i24.i.1, label %mulMod.exit.i.i.1, label %ifcont.i.1.i.i.1

ifcont.i.1.i.i.1:                                 ; preds = %ifcont.i23.i.1
  %addtmp18.i.i25.i.1 = shl nuw nsw i32 %common.ret.op.i.i.i, 1
  %a.037.i.1.i.i.1 = urem i32 %addtmp18.i.i25.i.1, 1000003
  br label %mulMod.exit.i.i.1

mulMod.exit.i.i.1:                                ; preds = %ifcont.i.1.i.i.1, %ifcont.i23.i.1
  %common.ret.op.i.i.i.1 = phi i32 [ 0, %ifcont.i23.i.1 ], [ %a.037.i.1.i.i.1, %ifcont.i.1.i.i.1 ]
  %eqtmp6.i.i.2 = icmp eq i32 %common.ret.op.i.i.i.1, %result.1.i.i
  br i1 %eqtmp6.i.i.2, label %discreteLog.exit.i.loopexit.split.loop.exit11, label %ifcont.i23.i.2

ifcont.i23.i.2:                                   ; preds = %mulMod.exit.i.i.1
  %eqtmp.i.i24.i.2 = icmp eq i32 %common.ret.op.i.i.i.1, 0
  br i1 %eqtmp.i.i24.i.2, label %mulMod.exit.i.i.2, label %ifcont.i.1.i.i.2

ifcont.i.1.i.i.2:                                 ; preds = %ifcont.i23.i.2
  %addtmp18.i.i25.i.2 = shl nuw nsw i32 %common.ret.op.i.i.i.1, 1
  %a.037.i.1.i.i.2 = urem i32 %addtmp18.i.i25.i.2, 1000003
  br label %mulMod.exit.i.i.2

mulMod.exit.i.i.2:                                ; preds = %ifcont.i.1.i.i.2, %ifcont.i23.i.2
  %common.ret.op.i.i.i.2 = phi i32 [ 0, %ifcont.i23.i.2 ], [ %a.037.i.1.i.i.2, %ifcont.i.1.i.i.2 ]
  %exitcond.not.i.i.2 = icmp eq i32 %x.019.i.i, 1000000
  br i1 %exitcond.not.i.i.2, label %discreteLog.exit.i, label %loopbody.i22.i.3

loopbody.i22.i.3:                                 ; preds = %mulMod.exit.i.i.2
  %eqtmp6.i.i.3 = icmp eq i32 %common.ret.op.i.i.i.2, %result.1.i.i
  br i1 %eqtmp6.i.i.3, label %discreteLog.exit.i.loopexit.split.loop.exit7, label %ifcont.i23.i.3

ifcont.i23.i.3:                                   ; preds = %loopbody.i22.i.3
  %eqtmp.i.i24.i.3 = icmp eq i32 %common.ret.op.i.i.i.2, 0
  br i1 %eqtmp.i.i24.i.3, label %mulMod.exit.i.i.3, label %ifcont.i.1.i.i.3

ifcont.i.1.i.i.3:                                 ; preds = %ifcont.i23.i.3
  %addtmp18.i.i25.i.3 = shl nuw nsw i32 %common.ret.op.i.i.i.2, 1
  %a.037.i.1.i.i.3 = urem i32 %addtmp18.i.i25.i.3, 1000003
  br label %mulMod.exit.i.i.3

mulMod.exit.i.i.3:                                ; preds = %ifcont.i.1.i.i.3, %ifcont.i23.i.3
  %common.ret.op.i.i.i.3 = phi i32 [ 0, %ifcont.i23.i.3 ], [ %a.037.i.1.i.i.3, %ifcont.i.1.i.i.3 ]
  %eqtmp6.i.i.4 = icmp eq i32 %common.ret.op.i.i.i.3, %result.1.i.i
  br i1 %eqtmp6.i.i.4, label %discreteLog.exit.i.loopexit.split.loop.exit5, label %ifcont.i23.i.4

ifcont.i23.i.4:                                   ; preds = %mulMod.exit.i.i.3
  %eqtmp.i.i24.i.4 = icmp eq i32 %common.ret.op.i.i.i.3, 0
  br i1 %eqtmp.i.i24.i.4, label %mulMod.exit.i.i.4, label %ifcont.i.1.i.i.4

ifcont.i.1.i.i.4:                                 ; preds = %ifcont.i23.i.4
  %addtmp18.i.i25.i.4 = shl nuw nsw i32 %common.ret.op.i.i.i.3, 1
  %a.037.i.1.i.i.4 = urem i32 %addtmp18.i.i25.i.4, 1000003
  br label %mulMod.exit.i.i.4

mulMod.exit.i.i.4:                                ; preds = %ifcont.i.1.i.i.4, %ifcont.i23.i.4
  %common.ret.op.i.i.i.4 = phi i32 [ 0, %ifcont.i23.i.4 ], [ %a.037.i.1.i.i.4, %ifcont.i.1.i.i.4 ]
  %eqtmp6.i.i.5 = icmp eq i32 %common.ret.op.i.i.i.4, %result.1.i.i
  br i1 %eqtmp6.i.i.5, label %discreteLog.exit.i.loopexit.split.loop.exit3, label %ifcont.i23.i.5

ifcont.i23.i.5:                                   ; preds = %mulMod.exit.i.i.4
  %eqtmp.i.i24.i.5 = icmp eq i32 %common.ret.op.i.i.i.4, 0
  br i1 %eqtmp.i.i24.i.5, label %mulMod.exit.i.i.5, label %ifcont.i.1.i.i.5

ifcont.i.1.i.i.5:                                 ; preds = %ifcont.i23.i.5
  %addtmp18.i.i25.i.5 = shl nuw nsw i32 %common.ret.op.i.i.i.4, 1
  %a.037.i.1.i.i.5 = urem i32 %addtmp18.i.i25.i.5, 1000003
  br label %mulMod.exit.i.i.5

mulMod.exit.i.i.5:                                ; preds = %ifcont.i.1.i.i.5, %ifcont.i23.i.5
  %common.ret.op.i.i.i.5 = phi i32 [ 0, %ifcont.i23.i.5 ], [ %a.037.i.1.i.i.5, %ifcont.i.1.i.i.5 ]
  %eqtmp6.i.i.6 = icmp eq i32 %common.ret.op.i.i.i.5, %result.1.i.i
  br i1 %eqtmp6.i.i.6, label %discreteLog.exit.i.loopexit.split.loop.exit1, label %ifcont.i23.i.6

ifcont.i23.i.6:                                   ; preds = %mulMod.exit.i.i.5
  %eqtmp.i.i24.i.6 = icmp eq i32 %common.ret.op.i.i.i.5, 0
  br i1 %eqtmp.i.i24.i.6, label %mulMod.exit.i.i.6, label %ifcont.i.1.i.i.6

ifcont.i.1.i.i.6:                                 ; preds = %ifcont.i23.i.6
  %addtmp18.i.i25.i.6 = shl nuw nsw i32 %common.ret.op.i.i.i.5, 1
  %a.037.i.1.i.i.6 = urem i32 %addtmp18.i.i25.i.6, 1000003
  br label %mulMod.exit.i.i.6

mulMod.exit.i.i.6:                                ; preds = %ifcont.i.1.i.i.6, %ifcont.i23.i.6
  %common.ret.op.i.i.i.6 = phi i32 [ 0, %ifcont.i23.i.6 ], [ %a.037.i.1.i.i.6, %ifcont.i.1.i.i.6 ]
  %eqtmp6.i.i.7 = icmp eq i32 %common.ret.op.i.i.i.6, %result.1.i.i
  br i1 %eqtmp6.i.i.7, label %discreteLog.exit.i.loopexit.split.loop.exit, label %ifcont.i23.i.7

ifcont.i23.i.7:                                   ; preds = %mulMod.exit.i.i.6
  %eqtmp.i.i24.i.7 = icmp eq i32 %common.ret.op.i.i.i.6, 0
  br i1 %eqtmp.i.i24.i.7, label %mulMod.exit.i.i.7, label %ifcont.i.1.i.i.7

ifcont.i.1.i.i.7:                                 ; preds = %ifcont.i23.i.7
  %addtmp18.i.i25.i.7 = shl nuw nsw i32 %common.ret.op.i.i.i.6, 1
  %a.037.i.1.i.i.7 = urem i32 %addtmp18.i.i25.i.7, 1000003
  br label %mulMod.exit.i.i.7

mulMod.exit.i.i.7:                                ; preds = %ifcont.i.1.i.i.7, %ifcont.i23.i.7
  %common.ret.op.i.i.i.7 = phi i32 [ 0, %ifcont.i23.i.7 ], [ %a.037.i.1.i.i.7, %ifcont.i.1.i.i.7 ]
  %addtmp.i.i.7 = add nuw nsw i32 %x.019.i.i, 8
  br label %loopbody.i22.i

discreteLog.exit.i.loopexit.split.loop.exit:      ; preds = %mulMod.exit.i.i.6
  %addtmp.i.i.6.le = or disjoint i32 %x.019.i.i, 7
  br label %discreteLog.exit.i

discreteLog.exit.i.loopexit.split.loop.exit1:     ; preds = %mulMod.exit.i.i.5
  %addtmp.i.i.5.le = or disjoint i32 %x.019.i.i, 6
  br label %discreteLog.exit.i

discreteLog.exit.i.loopexit.split.loop.exit3:     ; preds = %mulMod.exit.i.i.4
  %addtmp.i.i.4.le = or disjoint i32 %x.019.i.i, 5
  br label %discreteLog.exit.i

discreteLog.exit.i.loopexit.split.loop.exit5:     ; preds = %mulMod.exit.i.i.3
  %addtmp.i.i.3.le = or disjoint i32 %x.019.i.i, 4
  br label %discreteLog.exit.i

discreteLog.exit.i.loopexit.split.loop.exit7:     ; preds = %loopbody.i22.i.3
  %addtmp.i.i.2.le = or disjoint i32 %x.019.i.i, 3
  br label %discreteLog.exit.i

discreteLog.exit.i.loopexit.split.loop.exit11:    ; preds = %mulMod.exit.i.i.1
  %addtmp.i.i.1.le = or disjoint i32 %x.019.i.i, 2
  br label %discreteLog.exit.i

discreteLog.exit.i.loopexit.split.loop.exit13:    ; preds = %mulMod.exit.i.i
  %addtmp.i.i.le = or disjoint i32 %x.019.i.i, 1
  br label %discreteLog.exit.i

discreteLog.exit.i:                               ; preds = %discreteLog.exit.i.loopexit.split.loop.exit, %discreteLog.exit.i.loopexit.split.loop.exit1, %discreteLog.exit.i.loopexit.split.loop.exit3, %discreteLog.exit.i.loopexit.split.loop.exit5, %discreteLog.exit.i.loopexit.split.loop.exit7, %discreteLog.exit.i.loopexit.split.loop.exit11, %discreteLog.exit.i.loopexit.split.loop.exit13, %mulMod.exit.i.i.2, %loopbody.i22.i, %modExp.exit.i
  %common.ret.op.i.i = phi i32 [ 0, %modExp.exit.i ], [ %addtmp.i.i.le, %discreteLog.exit.i.loopexit.split.loop.exit13 ], [ %addtmp.i.i.6.le, %discreteLog.exit.i.loopexit.split.loop.exit ], [ %addtmp.i.i.1.le, %discreteLog.exit.i.loopexit.split.loop.exit11 ], [ %addtmp.i.i.4.le, %discreteLog.exit.i.loopexit.split.loop.exit3 ], [ -1, %mulMod.exit.i.i.2 ], [ %addtmp.i.i.2.le, %discreteLog.exit.i.loopexit.split.loop.exit7 ], [ %addtmp.i.i.3.le, %discreteLog.exit.i.loopexit.split.loop.exit5 ], [ %addtmp.i.i.5.le, %discreteLog.exit.i.loopexit.split.loop.exit1 ], [ %x.019.i.i, %loopbody.i22.i ]
  %addtmp.i = add nsw i32 %common.ret.op.i.i, %sum.026.i
  %modtmp.i = srem i32 %addtmp.i, 1000003
  %addtmp14.i = add nuw nsw i32 %i.027.i, 1
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
