; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 0, 2147483647) i32 @mulMod(i32 noundef %0, i32 noundef range(i32 0, -2147483648) %1, i32 noundef range(i32 2, -2147483648) %2) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %0, 0
  %eqtmp3 = icmp eq i32 %1, 0
  %or.cond = or i1 %eqtmp, %eqtmp3
  br i1 %or.cond, label %common.ret, label %default.next5

common.ret:                                       ; preds = %ifcont17, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %result.1, %ifcont17 ]
  ret i32 %common.ret.op

default.next5:                                    ; preds = %entry
  %modtmp = srem i32 %0, %2
  %lttmp = icmp slt i32 %modtmp, 0
  %addtmp = select i1 %lttmp, i32 %2, i32 0
  %spec.select = add nsw i32 %addtmp, %modtmp
  br label %loopbody

loopbody:                                         ; preds = %default.next5, %ifcont17
  %a.147 = phi i32 [ %spec.select, %default.next5 ], [ %modtmp27, %ifcont17 ]
  %b.046 = phi i32 [ %1, %default.next5 ], [ %divtmp44, %ifcont17 ]
  %result.045 = phi i32 [ 0, %default.next5 ], [ %result.1, %ifcont17 ]
  %modtmp13 = and i32 %b.046, 1
  %eqtmp14.not = icmp eq i32 %modtmp13, 0
  br i1 %eqtmp14.not, label %ifcont17, label %then15

then15:                                           ; preds = %loopbody
  %addtmp20 = add i32 %a.147, %result.045
  %modtmp22 = srem i32 %addtmp20, %2
  br label %ifcont17

ifcont17:                                         ; preds = %loopbody, %then15
  %result.1 = phi i32 [ %modtmp22, %then15 ], [ %result.045, %loopbody ]
  %addtmp25 = shl i32 %a.147, 1
  %modtmp27 = srem i32 %addtmp25, %2
  %divtmp44 = lshr i32 %b.046, 1
  %gttmp.not = icmp eq i32 %divtmp44, 0
  br i1 %gttmp.not, label %common.ret, label %loopbody
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 0, 2147483647) i32 @modExp(i32 noundef %0, i32 noundef range(i32 0, -2147483648) %1, i32 noundef range(i32 2, -2147483648) %2) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %1, 0
  br i1 %eqtmp, label %common.ret, label %default.next

common.ret:                                       ; preds = %mulMod.exit57, %entry
  %common.ret.op = phi i32 [ 1, %entry ], [ %result.1, %mulMod.exit57 ]
  ret i32 %common.ret.op

default.next:                                     ; preds = %entry
  %modtmp = srem i32 %0, %2
  %lttmp = icmp slt i32 %modtmp, 0
  %addtmp = select i1 %lttmp, i32 %2, i32 0
  %spec.select = add nsw i32 %addtmp, %modtmp
  br label %loopbody

loopbody:                                         ; preds = %default.next, %mulMod.exit57
  %base.160 = phi i32 [ %spec.select, %default.next ], [ %common.ret.op.i56, %mulMod.exit57 ]
  %exp.059 = phi i32 [ %1, %default.next ], [ %divtmp35, %mulMod.exit57 ]
  %result.058 = phi i32 [ 1, %default.next ], [ %result.1, %mulMod.exit57 ]
  %modtmp9 = and i32 %exp.059, 1
  %eqtmp10.not = icmp eq i32 %modtmp9, 0
  br i1 %eqtmp10.not, label %ifcont13, label %then11

then11:                                           ; preds = %loopbody
  %eqtmp.i = icmp eq i32 %result.058, 0
  %eqtmp3.i = icmp eq i32 %base.160, 0
  %or.cond.i = or i1 %eqtmp.i, %eqtmp3.i
  br i1 %or.cond.i, label %ifcont13, label %loopbody.i

loopbody.i:                                       ; preds = %then11, %ifcont17.i
  %result.0.pn = phi i32 [ %addtmp25.i, %ifcont17.i ], [ %result.058, %then11 ]
  %b.046.i = phi i32 [ %divtmp44.i, %ifcont17.i ], [ %base.160, %then11 ]
  %result.045.i = phi i32 [ %result.1.i, %ifcont17.i ], [ 0, %then11 ]
  %a.147.i = srem i32 %result.0.pn, %2
  %modtmp13.i = and i32 %b.046.i, 1
  %eqtmp14.not.i = icmp eq i32 %modtmp13.i, 0
  br i1 %eqtmp14.not.i, label %ifcont17.i, label %then15.i

then15.i:                                         ; preds = %loopbody.i
  %addtmp20.i = add i32 %a.147.i, %result.045.i
  %modtmp22.i = srem i32 %addtmp20.i, %2
  br label %ifcont17.i

ifcont17.i:                                       ; preds = %then15.i, %loopbody.i
  %result.1.i = phi i32 [ %modtmp22.i, %then15.i ], [ %result.045.i, %loopbody.i ]
  %addtmp25.i = shl i32 %a.147.i, 1
  %divtmp44.i = lshr i32 %b.046.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp44.i, 0
  br i1 %gttmp.not.i, label %ifcont13, label %loopbody.i

ifcont13:                                         ; preds = %ifcont17.i, %then11, %loopbody
  %result.1 = phi i32 [ %result.058, %loopbody ], [ 0, %then11 ], [ %result.1.i, %ifcont17.i ]
  %divtmp35 = lshr i32 %exp.059, 1
  %eqtmp3.i37 = icmp eq i32 %base.160, 0
  br i1 %eqtmp3.i37, label %mulMod.exit57, label %default.next5.i39

default.next5.i39:                                ; preds = %ifcont13
  %modtmp.i40 = srem i32 %base.160, %2
  %lttmp.i = icmp slt i32 %modtmp.i40, 0
  %addtmp.i = select i1 %lttmp.i, i32 %2, i32 0
  %spec.select.i = add nsw i32 %addtmp.i, %modtmp.i40
  br label %loopbody.i41

loopbody.i41:                                     ; preds = %ifcont17.i50, %default.next5.i39
  %a.147.i42 = phi i32 [ %spec.select.i, %default.next5.i39 ], [ %modtmp27.i53, %ifcont17.i50 ]
  %b.046.i43 = phi i32 [ %base.160, %default.next5.i39 ], [ %divtmp44.i54, %ifcont17.i50 ]
  %result.045.i44 = phi i32 [ 0, %default.next5.i39 ], [ %result.1.i51, %ifcont17.i50 ]
  %modtmp13.i45 = and i32 %b.046.i43, 1
  %eqtmp14.not.i46 = icmp eq i32 %modtmp13.i45, 0
  br i1 %eqtmp14.not.i46, label %ifcont17.i50, label %then15.i47

then15.i47:                                       ; preds = %loopbody.i41
  %addtmp20.i48 = add i32 %result.045.i44, %a.147.i42
  %modtmp22.i49 = srem i32 %addtmp20.i48, %2
  br label %ifcont17.i50

ifcont17.i50:                                     ; preds = %then15.i47, %loopbody.i41
  %result.1.i51 = phi i32 [ %modtmp22.i49, %then15.i47 ], [ %result.045.i44, %loopbody.i41 ]
  %addtmp25.i52 = shl i32 %a.147.i42, 1
  %modtmp27.i53 = srem i32 %addtmp25.i52, %2
  %divtmp44.i54 = lshr i32 %b.046.i43, 1
  %gttmp.not.i55 = icmp eq i32 %divtmp44.i54, 0
  br i1 %gttmp.not.i55, label %mulMod.exit57, label %loopbody.i41

mulMod.exit57:                                    ; preds = %ifcont17.i50, %ifcont13
  %common.ret.op.i56 = phi i32 [ 0, %ifcont13 ], [ %result.1.i51, %ifcont17.i50 ]
  %gttmp.not = icmp eq i32 %divtmp35, 0
  br i1 %gttmp.not, label %common.ret, label %loopbody
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1, 2147483647) i32 @discreteLog(i32 noundef %0, i32 noundef %1, i32 noundef range(i32 2, -2147483648) %2) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %1, 1
  br i1 %eqtmp, label %common.ret, label %loopcond.preheader

loopcond.preheader:                               ; preds = %entry
  %eqtmp3.i = icmp eq i32 %0, 0
  br i1 %eqtmp3.i, label %loopbody.us.peel.next, label %loopbody

loopbody.us.peel.next:                            ; preds = %loopcond.preheader
  %eqtmp6.us = icmp eq i32 %1, 0
  br label %loopbody.us

loopbody.us:                                      ; preds = %loopbody.us.peel.next, %ifcont.us
  %x.019.us = phi i32 [ %addtmp.us, %ifcont.us ], [ 1, %loopbody.us.peel.next ]
  br i1 %eqtmp6.us, label %common.ret, label %ifcont.us

ifcont.us:                                        ; preds = %loopbody.us
  %addtmp.us = add nuw nsw i32 %x.019.us, 1
  %lttmp.us = icmp samesign ult i32 %addtmp.us, %2
  br i1 %lttmp.us, label %loopbody.us, label %common.ret, !llvm.loop !0

common.ret:                                       ; preds = %mulMod.exit, %loopbody, %ifcont.us, %loopbody.us, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %x.019.us, %loopbody.us ], [ -1, %ifcont.us ], [ %x.019, %loopbody ], [ -1, %mulMod.exit ]
  ret i32 %common.ret.op

loopbody:                                         ; preds = %loopcond.preheader, %mulMod.exit
  %x.019 = phi i32 [ %addtmp, %mulMod.exit ], [ 0, %loopcond.preheader ]
  %value.018 = phi i32 [ %common.ret.op.i, %mulMod.exit ], [ 1, %loopcond.preheader ]
  %eqtmp6 = icmp eq i32 %value.018, %1
  br i1 %eqtmp6, label %common.ret, label %ifcont

ifcont:                                           ; preds = %loopbody
  %eqtmp.i = icmp eq i32 %value.018, 0
  br i1 %eqtmp.i, label %mulMod.exit, label %loopbody.i

loopbody.i:                                       ; preds = %ifcont, %ifcont17.i
  %value.0.pn = phi i32 [ %addtmp25.i, %ifcont17.i ], [ %value.018, %ifcont ]
  %b.046.i = phi i32 [ %divtmp44.i, %ifcont17.i ], [ %0, %ifcont ]
  %result.045.i = phi i32 [ %result.1.i, %ifcont17.i ], [ 0, %ifcont ]
  %a.147.i = srem i32 %value.0.pn, %2
  %modtmp13.i = and i32 %b.046.i, 1
  %eqtmp14.not.i = icmp eq i32 %modtmp13.i, 0
  br i1 %eqtmp14.not.i, label %ifcont17.i, label %then15.i

then15.i:                                         ; preds = %loopbody.i
  %addtmp20.i = add i32 %a.147.i, %result.045.i
  %modtmp22.i = srem i32 %addtmp20.i, %2
  br label %ifcont17.i

ifcont17.i:                                       ; preds = %then15.i, %loopbody.i
  %result.1.i = phi i32 [ %modtmp22.i, %then15.i ], [ %result.045.i, %loopbody.i ]
  %addtmp25.i = shl i32 %a.147.i, 1
  %divtmp44.i = lshr i32 %b.046.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp44.i, 0
  br i1 %gttmp.not.i, label %mulMod.exit, label %loopbody.i

mulMod.exit:                                      ; preds = %ifcont17.i, %ifcont
  %common.ret.op.i = phi i32 [ 0, %ifcont ], [ %result.1.i, %ifcont17.i ]
  %addtmp = add nuw nsw i32 %x.019, 1
  %lttmp = icmp samesign ult i32 %addtmp, %2
  br i1 %lttmp, label %loopbody, label %common.ret
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 4)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }

!0 = distinct !{!0, !1}
!1 = !{!"llvm.loop.peeled.count", i32 1}
