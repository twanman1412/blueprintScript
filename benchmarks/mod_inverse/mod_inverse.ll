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
define noundef range(i32 0, 2147483647) i32 @modInverse(i32 noundef %0, i32 noundef range(i32 2, -2147483648) %1) local_unnamed_addr #0 {
entry:
  %modtmp = srem i32 %0, %1
  %eqtmp = icmp eq i32 %modtmp, 0
  br i1 %eqtmp, label %common.ret, label %default.next

common.ret:                                       ; preds = %mulMod.exit57.i, %default.next, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ 1, %default.next ], [ %result.1.i, %mulMod.exit57.i ]
  ret i32 %common.ret.op

default.next:                                     ; preds = %entry
  %subtmp = add nsw i32 %1, -2
  %eqtmp.i = icmp eq i32 %subtmp, 0
  br i1 %eqtmp.i, label %common.ret, label %default.next.i

default.next.i:                                   ; preds = %default.next
  %lttmp.i = icmp slt i32 %modtmp, 0
  %addtmp.i = select i1 %lttmp.i, i32 %1, i32 0
  %spec.select.i = add nsw i32 %addtmp.i, %modtmp
  br label %loopbody.i

loopbody.i:                                       ; preds = %mulMod.exit57.i, %default.next.i
  %base.160.i = phi i32 [ %spec.select.i, %default.next.i ], [ %common.ret.op.i56.i, %mulMod.exit57.i ]
  %exp.059.i = phi i32 [ %subtmp, %default.next.i ], [ %divtmp35.i, %mulMod.exit57.i ]
  %result.058.i = phi i32 [ 1, %default.next.i ], [ %result.1.i, %mulMod.exit57.i ]
  %modtmp9.i = and i32 %exp.059.i, 1
  %eqtmp10.not.i = icmp eq i32 %modtmp9.i, 0
  br i1 %eqtmp10.not.i, label %ifcont13.i, label %then11.i

then11.i:                                         ; preds = %loopbody.i
  %eqtmp.i.i = icmp eq i32 %result.058.i, 0
  %eqtmp3.i.i = icmp eq i32 %base.160.i, 0
  %or.cond.i.i = or i1 %eqtmp3.i.i, %eqtmp.i.i
  br i1 %or.cond.i.i, label %ifcont13.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %then11.i, %ifcont17.i.i
  %result.0.pn.i = phi i32 [ %addtmp25.i.i, %ifcont17.i.i ], [ %result.058.i, %then11.i ]
  %b.046.i.i = phi i32 [ %divtmp44.i.i, %ifcont17.i.i ], [ %base.160.i, %then11.i ]
  %result.045.i.i = phi i32 [ %result.1.i.i, %ifcont17.i.i ], [ 0, %then11.i ]
  %a.147.i.i = srem i32 %result.0.pn.i, %1
  %modtmp13.i.i = and i32 %b.046.i.i, 1
  %eqtmp14.not.i.i = icmp eq i32 %modtmp13.i.i, 0
  br i1 %eqtmp14.not.i.i, label %ifcont17.i.i, label %then15.i.i

then15.i.i:                                       ; preds = %loopbody.i.i
  %addtmp20.i.i = add i32 %a.147.i.i, %result.045.i.i
  %modtmp22.i.i = srem i32 %addtmp20.i.i, %1
  br label %ifcont17.i.i

ifcont17.i.i:                                     ; preds = %then15.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %modtmp22.i.i, %then15.i.i ], [ %result.045.i.i, %loopbody.i.i ]
  %addtmp25.i.i = shl i32 %a.147.i.i, 1
  %divtmp44.i.i = lshr i32 %b.046.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp44.i.i, 0
  br i1 %gttmp.not.i.i, label %ifcont13.i, label %loopbody.i.i

ifcont13.i:                                       ; preds = %ifcont17.i.i, %then11.i, %loopbody.i
  %result.1.i = phi i32 [ %result.058.i, %loopbody.i ], [ 0, %then11.i ], [ %result.1.i.i, %ifcont17.i.i ]
  %divtmp35.i = lshr i32 %exp.059.i, 1
  %eqtmp3.i37.i = icmp eq i32 %base.160.i, 0
  br i1 %eqtmp3.i37.i, label %mulMod.exit57.i, label %default.next5.i39.i

default.next5.i39.i:                              ; preds = %ifcont13.i
  %modtmp.i40.i = srem i32 %base.160.i, %1
  %lttmp.i.i = icmp slt i32 %modtmp.i40.i, 0
  %addtmp.i.i = select i1 %lttmp.i.i, i32 %1, i32 0
  %spec.select.i.i = add nsw i32 %addtmp.i.i, %modtmp.i40.i
  br label %loopbody.i41.i

loopbody.i41.i:                                   ; preds = %ifcont17.i50.i, %default.next5.i39.i
  %a.147.i42.i = phi i32 [ %spec.select.i.i, %default.next5.i39.i ], [ %modtmp27.i53.i, %ifcont17.i50.i ]
  %b.046.i43.i = phi i32 [ %base.160.i, %default.next5.i39.i ], [ %divtmp44.i54.i, %ifcont17.i50.i ]
  %result.045.i44.i = phi i32 [ 0, %default.next5.i39.i ], [ %result.1.i51.i, %ifcont17.i50.i ]
  %modtmp13.i45.i = and i32 %b.046.i43.i, 1
  %eqtmp14.not.i46.i = icmp eq i32 %modtmp13.i45.i, 0
  br i1 %eqtmp14.not.i46.i, label %ifcont17.i50.i, label %then15.i47.i

then15.i47.i:                                     ; preds = %loopbody.i41.i
  %addtmp20.i48.i = add i32 %result.045.i44.i, %a.147.i42.i
  %modtmp22.i49.i = srem i32 %addtmp20.i48.i, %1
  br label %ifcont17.i50.i

ifcont17.i50.i:                                   ; preds = %then15.i47.i, %loopbody.i41.i
  %result.1.i51.i = phi i32 [ %modtmp22.i49.i, %then15.i47.i ], [ %result.045.i44.i, %loopbody.i41.i ]
  %addtmp25.i52.i = shl i32 %a.147.i42.i, 1
  %modtmp27.i53.i = srem i32 %addtmp25.i52.i, %1
  %divtmp44.i54.i = lshr i32 %b.046.i43.i, 1
  %gttmp.not.i55.i = icmp eq i32 %divtmp44.i54.i, 0
  br i1 %gttmp.not.i55.i, label %mulMod.exit57.i, label %loopbody.i41.i

mulMod.exit57.i:                                  ; preds = %ifcont17.i50.i, %ifcont13.i
  %common.ret.op.i56.i = phi i32 [ 0, %ifcont13.i ], [ %result.1.i51.i, %ifcont17.i50.i ]
  %gttmp.not.i = icmp eq i32 %divtmp35.i, 0
  br i1 %gttmp.not.i, label %common.ret, label %loopbody.i
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @modInverseStress() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.i.preheader

loopbody.i.i.preheader:                           ; preds = %entry, %modInverse.exit
  %result.016 = phi i32 [ 0, %entry ], [ %modtmp, %modInverse.exit ]
  %i.015 = phi i32 [ 1, %entry ], [ %addtmp9, %modInverse.exit ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i.i.preheader, %mulMod.exit57.i.i
  %base.160.i.i = phi i32 [ %common.ret.op.i56.i.i, %mulMod.exit57.i.i ], [ %i.015, %loopbody.i.i.preheader ]
  %exp.059.i.i = phi i32 [ %divtmp35.i.i, %mulMod.exit57.i.i ], [ 1000000005, %loopbody.i.i.preheader ]
  %result.058.i.i = phi i32 [ %result.1.i.i, %mulMod.exit57.i.i ], [ 1, %loopbody.i.i.preheader ]
  %modtmp9.i.i = and i32 %exp.059.i.i, 1
  %eqtmp10.not.i.i = icmp eq i32 %modtmp9.i.i, 0
  br i1 %eqtmp10.not.i.i, label %ifcont13.i.i, label %then11.i.i

then11.i.i:                                       ; preds = %loopbody.i.i
  %eqtmp.i.i.i = icmp eq i32 %result.058.i.i, 0
  %eqtmp3.i.i.i = icmp eq i32 %base.160.i.i, 0
  %or.cond.i.i.i = or i1 %eqtmp3.i.i.i, %eqtmp.i.i.i
  br i1 %or.cond.i.i.i, label %ifcont13.i.i, label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %then11.i.i, %ifcont17.i.i.i
  %result.0.pn.i.i = phi i32 [ %addtmp25.i.i.i, %ifcont17.i.i.i ], [ %result.058.i.i, %then11.i.i ]
  %b.046.i.i.i = phi i32 [ %divtmp44.i.i.i, %ifcont17.i.i.i ], [ %base.160.i.i, %then11.i.i ]
  %result.045.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont17.i.i.i ], [ 0, %then11.i.i ]
  %a.147.i.i.i = srem i32 %result.0.pn.i.i, 1000000007
  %modtmp13.i.i.i = and i32 %b.046.i.i.i, 1
  %eqtmp14.not.i.i.i = icmp eq i32 %modtmp13.i.i.i, 0
  br i1 %eqtmp14.not.i.i.i, label %ifcont17.i.i.i, label %then15.i.i.i

then15.i.i.i:                                     ; preds = %loopbody.i.i.i
  %addtmp20.i.i.i = add i32 %result.045.i.i.i, %a.147.i.i.i
  %modtmp22.i.i.i = srem i32 %addtmp20.i.i.i, 1000000007
  br label %ifcont17.i.i.i

ifcont17.i.i.i:                                   ; preds = %then15.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp22.i.i.i, %then15.i.i.i ], [ %result.045.i.i.i, %loopbody.i.i.i ]
  %addtmp25.i.i.i = shl nsw i32 %a.147.i.i.i, 1
  %divtmp44.i.i.i = lshr i32 %b.046.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp44.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %ifcont13.i.i, label %loopbody.i.i.i

ifcont13.i.i:                                     ; preds = %ifcont17.i.i.i, %then11.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %result.058.i.i, %loopbody.i.i ], [ 0, %then11.i.i ], [ %result.1.i.i.i, %ifcont17.i.i.i ]
  %divtmp35.i.i = lshr i32 %exp.059.i.i, 1
  %eqtmp3.i37.i.i = icmp eq i32 %base.160.i.i, 0
  br i1 %eqtmp3.i37.i.i, label %mulMod.exit57.i.i, label %default.next5.i39.i.i

default.next5.i39.i.i:                            ; preds = %ifcont13.i.i
  %modtmp.i40.i.i = srem i32 %base.160.i.i, 1000000007
  %lttmp.i.i.i = icmp slt i32 %modtmp.i40.i.i, 0
  %addtmp.i.i.i = select i1 %lttmp.i.i.i, i32 1000000007, i32 0
  %spec.select.i.i.i = add nsw i32 %addtmp.i.i.i, %modtmp.i40.i.i
  br label %loopbody.i41.i.i

loopbody.i41.i.i:                                 ; preds = %ifcont17.i50.i.i, %default.next5.i39.i.i
  %a.147.i42.i.i = phi i32 [ %spec.select.i.i.i, %default.next5.i39.i.i ], [ %modtmp27.i53.i.i, %ifcont17.i50.i.i ]
  %b.046.i43.i.i = phi i32 [ %base.160.i.i, %default.next5.i39.i.i ], [ %divtmp44.i54.i.i, %ifcont17.i50.i.i ]
  %result.045.i44.i.i = phi i32 [ 0, %default.next5.i39.i.i ], [ %result.1.i51.i.i, %ifcont17.i50.i.i ]
  %modtmp13.i45.i.i = and i32 %b.046.i43.i.i, 1
  %eqtmp14.not.i46.i.i = icmp eq i32 %modtmp13.i45.i.i, 0
  br i1 %eqtmp14.not.i46.i.i, label %ifcont17.i50.i.i, label %then15.i47.i.i

then15.i47.i.i:                                   ; preds = %loopbody.i41.i.i
  %addtmp20.i48.i.i = add i32 %result.045.i44.i.i, %a.147.i42.i.i
  %modtmp22.i49.i.i = srem i32 %addtmp20.i48.i.i, 1000000007
  br label %ifcont17.i50.i.i

ifcont17.i50.i.i:                                 ; preds = %then15.i47.i.i, %loopbody.i41.i.i
  %result.1.i51.i.i = phi i32 [ %modtmp22.i49.i.i, %then15.i47.i.i ], [ %result.045.i44.i.i, %loopbody.i41.i.i ]
  %addtmp25.i52.i.i = shl i32 %a.147.i42.i.i, 1
  %modtmp27.i53.i.i = srem i32 %addtmp25.i52.i.i, 1000000007
  %divtmp44.i54.i.i = lshr i32 %b.046.i43.i.i, 1
  %gttmp.not.i55.i.i = icmp eq i32 %divtmp44.i54.i.i, 0
  br i1 %gttmp.not.i55.i.i, label %mulMod.exit57.i.i, label %loopbody.i41.i.i

mulMod.exit57.i.i:                                ; preds = %ifcont17.i50.i.i, %ifcont13.i.i
  %common.ret.op.i56.i.i = phi i32 [ 0, %ifcont13.i.i ], [ %result.1.i51.i.i, %ifcont17.i50.i.i ]
  %gttmp.not.i.i = icmp eq i32 %divtmp35.i.i, 0
  br i1 %gttmp.not.i.i, label %modInverse.exit, label %loopbody.i.i

modInverse.exit:                                  ; preds = %mulMod.exit57.i.i
  %addtmp = add i32 %result.1.i.i, %result.016
  %modtmp = srem i32 %addtmp, 1000000007
  %addtmp9 = add nuw nsw i32 %i.015, 1
  %letmp = icmp samesign ult i32 %i.015, 2000000
  br i1 %letmp, label %loopbody.i.i.preheader, label %loopexit

loopexit:                                         ; preds = %modInverse.exit
  ret i32 %modtmp
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.i.preheader.i

loopbody.i.i.preheader.i:                         ; preds = %modInverse.exit.i, %entry
  %result.016.i = phi i32 [ 0, %entry ], [ %modtmp.i, %modInverse.exit.i ]
  %i.015.i = phi i32 [ 1, %entry ], [ %addtmp9.i, %modInverse.exit.i ]
  br label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %mulMod.exit57.i.i.i, %loopbody.i.i.preheader.i
  %base.160.i.i.i = phi i32 [ %common.ret.op.i56.i.i.i, %mulMod.exit57.i.i.i ], [ %i.015.i, %loopbody.i.i.preheader.i ]
  %exp.059.i.i.i = phi i32 [ %divtmp35.i.i.i, %mulMod.exit57.i.i.i ], [ 1000000005, %loopbody.i.i.preheader.i ]
  %result.058.i.i.i = phi i32 [ %result.1.i.i.i, %mulMod.exit57.i.i.i ], [ 1, %loopbody.i.i.preheader.i ]
  %modtmp9.i.i.i = and i32 %exp.059.i.i.i, 1
  %eqtmp10.not.i.i.i = icmp eq i32 %modtmp9.i.i.i, 0
  br i1 %eqtmp10.not.i.i.i, label %ifcont13.i.i.i, label %then11.i.i.i

then11.i.i.i:                                     ; preds = %loopbody.i.i.i
  %eqtmp.i.i.i.i = icmp eq i32 %result.058.i.i.i, 0
  %eqtmp3.i.i.i.i = icmp eq i32 %base.160.i.i.i, 0
  %or.cond.i.i.i.i = or i1 %eqtmp3.i.i.i.i, %eqtmp.i.i.i.i
  br i1 %or.cond.i.i.i.i, label %ifcont13.i.i.i, label %loopbody.i.i.i.i

loopbody.i.i.i.i:                                 ; preds = %then11.i.i.i, %ifcont17.i.i.i.i
  %result.0.pn.i.i.i = phi i32 [ %addtmp25.i.i.i.i, %ifcont17.i.i.i.i ], [ %result.058.i.i.i, %then11.i.i.i ]
  %b.046.i.i.i.i = phi i32 [ %divtmp44.i.i.i.i, %ifcont17.i.i.i.i ], [ %base.160.i.i.i, %then11.i.i.i ]
  %result.045.i.i.i.i = phi i32 [ %result.1.i.i.i.i, %ifcont17.i.i.i.i ], [ 0, %then11.i.i.i ]
  %a.147.i.i.i.i = srem i32 %result.0.pn.i.i.i, 1000000007
  %modtmp13.i.i.i.i = and i32 %b.046.i.i.i.i, 1
  %eqtmp14.not.i.i.i.i = icmp eq i32 %modtmp13.i.i.i.i, 0
  br i1 %eqtmp14.not.i.i.i.i, label %ifcont17.i.i.i.i, label %then15.i.i.i.i

then15.i.i.i.i:                                   ; preds = %loopbody.i.i.i.i
  %addtmp20.i.i.i.i = add i32 %result.045.i.i.i.i, %a.147.i.i.i.i
  %modtmp22.i.i.i.i = srem i32 %addtmp20.i.i.i.i, 1000000007
  br label %ifcont17.i.i.i.i

ifcont17.i.i.i.i:                                 ; preds = %then15.i.i.i.i, %loopbody.i.i.i.i
  %result.1.i.i.i.i = phi i32 [ %modtmp22.i.i.i.i, %then15.i.i.i.i ], [ %result.045.i.i.i.i, %loopbody.i.i.i.i ]
  %addtmp25.i.i.i.i = shl nsw i32 %a.147.i.i.i.i, 1
  %divtmp44.i.i.i.i = lshr i32 %b.046.i.i.i.i, 1
  %gttmp.not.i.i.i.i = icmp eq i32 %divtmp44.i.i.i.i, 0
  br i1 %gttmp.not.i.i.i.i, label %ifcont13.i.i.i, label %loopbody.i.i.i.i

ifcont13.i.i.i:                                   ; preds = %ifcont17.i.i.i.i, %then11.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %result.058.i.i.i, %loopbody.i.i.i ], [ 0, %then11.i.i.i ], [ %result.1.i.i.i.i, %ifcont17.i.i.i.i ]
  %divtmp35.i.i.i = lshr i32 %exp.059.i.i.i, 1
  %eqtmp3.i37.i.i.i = icmp eq i32 %base.160.i.i.i, 0
  br i1 %eqtmp3.i37.i.i.i, label %mulMod.exit57.i.i.i, label %default.next5.i39.i.i.i

default.next5.i39.i.i.i:                          ; preds = %ifcont13.i.i.i
  %modtmp.i40.i.i.i = srem i32 %base.160.i.i.i, 1000000007
  %lttmp.i.i.i.i = icmp slt i32 %modtmp.i40.i.i.i, 0
  %addtmp.i.i.i.i = select i1 %lttmp.i.i.i.i, i32 1000000007, i32 0
  %spec.select.i.i.i.i = add nsw i32 %addtmp.i.i.i.i, %modtmp.i40.i.i.i
  br label %loopbody.i41.i.i.i

loopbody.i41.i.i.i:                               ; preds = %ifcont17.i50.i.i.i, %default.next5.i39.i.i.i
  %a.147.i42.i.i.i = phi i32 [ %spec.select.i.i.i.i, %default.next5.i39.i.i.i ], [ %modtmp27.i53.i.i.i, %ifcont17.i50.i.i.i ]
  %b.046.i43.i.i.i = phi i32 [ %base.160.i.i.i, %default.next5.i39.i.i.i ], [ %divtmp44.i54.i.i.i, %ifcont17.i50.i.i.i ]
  %result.045.i44.i.i.i = phi i32 [ 0, %default.next5.i39.i.i.i ], [ %result.1.i51.i.i.i, %ifcont17.i50.i.i.i ]
  %modtmp13.i45.i.i.i = and i32 %b.046.i43.i.i.i, 1
  %eqtmp14.not.i46.i.i.i = icmp eq i32 %modtmp13.i45.i.i.i, 0
  br i1 %eqtmp14.not.i46.i.i.i, label %ifcont17.i50.i.i.i, label %then15.i47.i.i.i

then15.i47.i.i.i:                                 ; preds = %loopbody.i41.i.i.i
  %addtmp20.i48.i.i.i = add i32 %result.045.i44.i.i.i, %a.147.i42.i.i.i
  %modtmp22.i49.i.i.i = srem i32 %addtmp20.i48.i.i.i, 1000000007
  br label %ifcont17.i50.i.i.i

ifcont17.i50.i.i.i:                               ; preds = %then15.i47.i.i.i, %loopbody.i41.i.i.i
  %result.1.i51.i.i.i = phi i32 [ %modtmp22.i49.i.i.i, %then15.i47.i.i.i ], [ %result.045.i44.i.i.i, %loopbody.i41.i.i.i ]
  %addtmp25.i52.i.i.i = shl i32 %a.147.i42.i.i.i, 1
  %modtmp27.i53.i.i.i = srem i32 %addtmp25.i52.i.i.i, 1000000007
  %divtmp44.i54.i.i.i = lshr i32 %b.046.i43.i.i.i, 1
  %gttmp.not.i55.i.i.i = icmp eq i32 %divtmp44.i54.i.i.i, 0
  br i1 %gttmp.not.i55.i.i.i, label %mulMod.exit57.i.i.i, label %loopbody.i41.i.i.i

mulMod.exit57.i.i.i:                              ; preds = %ifcont17.i50.i.i.i, %ifcont13.i.i.i
  %common.ret.op.i56.i.i.i = phi i32 [ 0, %ifcont13.i.i.i ], [ %result.1.i51.i.i.i, %ifcont17.i50.i.i.i ]
  %gttmp.not.i.i.i = icmp eq i32 %divtmp35.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %modInverse.exit.i, label %loopbody.i.i.i

modInverse.exit.i:                                ; preds = %mulMod.exit57.i.i.i
  %addtmp.i = add i32 %result.1.i.i.i, %result.016.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp9.i = add nuw nsw i32 %i.015.i, 1
  %letmp.i = icmp samesign ult i32 %i.015.i, 2000000
  br i1 %letmp.i, label %loopbody.i.i.preheader.i, label %modInverseStress.exit

modInverseStress.exit:                            ; preds = %modInverse.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
