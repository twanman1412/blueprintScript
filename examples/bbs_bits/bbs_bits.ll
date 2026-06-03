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
define noundef range(i32 0, 1000000007) i32 @bbsBits(i32 noundef %0, i32 noundef range(i32 2, -2147483648) %1, i32 noundef range(i32 0, -2147483648) %2) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %2, 0
  br i1 %eqtmp, label %common.ret, label %default.next

common.ret:                                       ; preds = %mulMod.exit, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %modtmp18, %mulMod.exit ]
  ret i32 %common.ret.op

default.next:                                     ; preds = %entry
  %modtmp = srem i32 %0, %1
  %lttmp = icmp slt i32 %modtmp, 0
  %addtmp = select i1 %lttmp, i32 %1, i32 0
  %spec.select = add nsw i32 %addtmp, %modtmp
  br label %loopbody

loopbody:                                         ; preds = %default.next, %mulMod.exit
  %seed.134 = phi i32 [ %spec.select, %default.next ], [ %common.ret.op.i, %mulMod.exit ]
  %i.033 = phi i32 [ 0, %default.next ], [ %addtmp20, %mulMod.exit ]
  %result.032 = phi i32 [ 0, %default.next ], [ %modtmp18, %mulMod.exit ]
  %eqtmp3.i = icmp eq i32 %seed.134, 0
  br i1 %eqtmp3.i, label %mulMod.exit, label %default.next5.i

default.next5.i:                                  ; preds = %loopbody
  %modtmp.i = srem i32 %seed.134, %1
  %lttmp.i = icmp slt i32 %modtmp.i, 0
  %addtmp.i = select i1 %lttmp.i, i32 %1, i32 0
  %spec.select.i = add nsw i32 %addtmp.i, %modtmp.i
  br label %loopbody.i

loopbody.i:                                       ; preds = %ifcont17.i, %default.next5.i
  %a.147.i = phi i32 [ %spec.select.i, %default.next5.i ], [ %modtmp27.i, %ifcont17.i ]
  %b.046.i = phi i32 [ %seed.134, %default.next5.i ], [ %divtmp44.i, %ifcont17.i ]
  %result.045.i = phi i32 [ 0, %default.next5.i ], [ %result.1.i, %ifcont17.i ]
  %modtmp13.i = and i32 %b.046.i, 1
  %eqtmp14.not.i = icmp eq i32 %modtmp13.i, 0
  br i1 %eqtmp14.not.i, label %ifcont17.i, label %then15.i

then15.i:                                         ; preds = %loopbody.i
  %addtmp20.i = add i32 %result.045.i, %a.147.i
  %modtmp22.i = srem i32 %addtmp20.i, %1
  br label %ifcont17.i

ifcont17.i:                                       ; preds = %then15.i, %loopbody.i
  %result.1.i = phi i32 [ %modtmp22.i, %then15.i ], [ %result.045.i, %loopbody.i ]
  %addtmp25.i = shl i32 %a.147.i, 1
  %modtmp27.i = srem i32 %addtmp25.i, %1
  %divtmp44.i = lshr i32 %b.046.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp44.i, 0
  br i1 %gttmp.not.i, label %mulMod.exit, label %loopbody.i

mulMod.exit:                                      ; preds = %ifcont17.i, %loopbody
  %common.ret.op.i = phi i32 [ 0, %loopbody ], [ %result.1.i, %ifcont17.i ]
  %modtmp15 = and i32 %common.ret.op.i, 1
  %addtmp16 = add nsw i32 %modtmp15, %result.032
  %modtmp18 = srem i32 %addtmp16, 1000000007
  %addtmp20 = add nuw nsw i32 %i.033, 1
  %lttmp9 = icmp samesign ult i32 %addtmp20, %2
  br i1 %lttmp9, label %loopbody, label %common.ret
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %entry, %ifcont17.i.i
  %a.147.i.i.in = phi i32 [ %addtmp25.i.i, %ifcont17.i.i ], [ 456420, %entry ]
  %b.046.i.i = phi i32 [ %divtmp44.i.i, %ifcont17.i.i ], [ 456420, %entry ]
  %result.045.i.i = phi i32 [ %result.1.i.i, %ifcont17.i.i ], [ 0, %entry ]
  %a.147.i.i = urem i32 %a.147.i.i.in, 1000003
  %modtmp13.i.i = and i32 %b.046.i.i, 1
  %eqtmp14.not.i.i = icmp eq i32 %modtmp13.i.i, 0
  br i1 %eqtmp14.not.i.i, label %ifcont17.i.i, label %then15.i.i

then15.i.i:                                       ; preds = %loopbody.i.i
  %addtmp20.i.i = add nuw nsw i32 %result.045.i.i, %a.147.i.i
  %modtmp22.i.i = urem i32 %addtmp20.i.i, 1000003
  br label %ifcont17.i.i

ifcont17.i.i:                                     ; preds = %then15.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %modtmp22.i.i, %then15.i.i ], [ %result.045.i.i, %loopbody.i.i ]
  %addtmp25.i.i = shl nuw nsw i32 %a.147.i.i, 1
  %divtmp44.i.i = lshr i32 %b.046.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp44.i.i, 0
  br i1 %gttmp.not.i.i, label %mulMod.exit.i, label %loopbody.i.i

mulMod.exit.i:                                    ; preds = %ifcont17.i.i
  %eqtmp3.i.i.1 = icmp eq i32 %result.1.i.i, 0
  br i1 %eqtmp3.i.i.1, label %mulMod.exit.i.1, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %mulMod.exit.i, %ifcont17.i.i.1
  %a.147.i.i.in.1 = phi i32 [ %addtmp25.i.i.1, %ifcont17.i.i.1 ], [ %result.1.i.i, %mulMod.exit.i ]
  %b.046.i.i.1 = phi i32 [ %divtmp44.i.i.1, %ifcont17.i.i.1 ], [ %result.1.i.i, %mulMod.exit.i ]
  %result.045.i.i.1 = phi i32 [ %result.1.i.i.1, %ifcont17.i.i.1 ], [ 0, %mulMod.exit.i ]
  %a.147.i.i.1 = urem i32 %a.147.i.i.in.1, 1000003
  %modtmp13.i.i.1 = and i32 %b.046.i.i.1, 1
  %eqtmp14.not.i.i.1 = icmp eq i32 %modtmp13.i.i.1, 0
  br i1 %eqtmp14.not.i.i.1, label %ifcont17.i.i.1, label %then15.i.i.1

then15.i.i.1:                                     ; preds = %loopbody.i.i.1
  %addtmp20.i.i.1 = add nuw nsw i32 %result.045.i.i.1, %a.147.i.i.1
  %modtmp22.i.i.1 = urem i32 %addtmp20.i.i.1, 1000003
  br label %ifcont17.i.i.1

ifcont17.i.i.1:                                   ; preds = %then15.i.i.1, %loopbody.i.i.1
  %result.1.i.i.1 = phi i32 [ %modtmp22.i.i.1, %then15.i.i.1 ], [ %result.045.i.i.1, %loopbody.i.i.1 ]
  %addtmp25.i.i.1 = shl nuw nsw i32 %a.147.i.i.1, 1
  %divtmp44.i.i.1 = lshr i32 %b.046.i.i.1, 1
  %gttmp.not.i.i.1 = icmp eq i32 %divtmp44.i.i.1, 0
  br i1 %gttmp.not.i.i.1, label %mulMod.exit.i.1, label %loopbody.i.i.1

mulMod.exit.i.1:                                  ; preds = %ifcont17.i.i.1, %mulMod.exit.i
  %common.ret.op.i.i.1 = phi i32 [ 0, %mulMod.exit.i ], [ %result.1.i.i.1, %ifcont17.i.i.1 ]
  %eqtmp3.i.i.2 = icmp eq i32 %common.ret.op.i.i.1, 0
  br i1 %eqtmp3.i.i.2, label %mulMod.exit.i.2, label %loopbody.i.i.2

loopbody.i.i.2:                                   ; preds = %mulMod.exit.i.1, %ifcont17.i.i.2
  %a.147.i.i.in.2 = phi i32 [ %addtmp25.i.i.2, %ifcont17.i.i.2 ], [ %common.ret.op.i.i.1, %mulMod.exit.i.1 ]
  %b.046.i.i.2 = phi i32 [ %divtmp44.i.i.2, %ifcont17.i.i.2 ], [ %common.ret.op.i.i.1, %mulMod.exit.i.1 ]
  %result.045.i.i.2 = phi i32 [ %result.1.i.i.2, %ifcont17.i.i.2 ], [ 0, %mulMod.exit.i.1 ]
  %a.147.i.i.2 = urem i32 %a.147.i.i.in.2, 1000003
  %modtmp13.i.i.2 = and i32 %b.046.i.i.2, 1
  %eqtmp14.not.i.i.2 = icmp eq i32 %modtmp13.i.i.2, 0
  br i1 %eqtmp14.not.i.i.2, label %ifcont17.i.i.2, label %then15.i.i.2

then15.i.i.2:                                     ; preds = %loopbody.i.i.2
  %addtmp20.i.i.2 = add nuw nsw i32 %result.045.i.i.2, %a.147.i.i.2
  %modtmp22.i.i.2 = urem i32 %addtmp20.i.i.2, 1000003
  br label %ifcont17.i.i.2

ifcont17.i.i.2:                                   ; preds = %then15.i.i.2, %loopbody.i.i.2
  %result.1.i.i.2 = phi i32 [ %modtmp22.i.i.2, %then15.i.i.2 ], [ %result.045.i.i.2, %loopbody.i.i.2 ]
  %addtmp25.i.i.2 = shl nuw nsw i32 %a.147.i.i.2, 1
  %divtmp44.i.i.2 = lshr i32 %b.046.i.i.2, 1
  %gttmp.not.i.i.2 = icmp eq i32 %divtmp44.i.i.2, 0
  br i1 %gttmp.not.i.i.2, label %mulMod.exit.i.2, label %loopbody.i.i.2

mulMod.exit.i.2:                                  ; preds = %ifcont17.i.i.2, %mulMod.exit.i.1
  %common.ret.op.i.i.2 = phi i32 [ 0, %mulMod.exit.i.1 ], [ %result.1.i.i.2, %ifcont17.i.i.2 ]
  %eqtmp3.i.i.3 = icmp eq i32 %common.ret.op.i.i.2, 0
  br i1 %eqtmp3.i.i.3, label %mulMod.exit.i.3, label %loopbody.i.i.3

loopbody.i.i.3:                                   ; preds = %mulMod.exit.i.2, %ifcont17.i.i.3
  %a.147.i.i.in.3 = phi i32 [ %addtmp25.i.i.3, %ifcont17.i.i.3 ], [ %common.ret.op.i.i.2, %mulMod.exit.i.2 ]
  %b.046.i.i.3 = phi i32 [ %divtmp44.i.i.3, %ifcont17.i.i.3 ], [ %common.ret.op.i.i.2, %mulMod.exit.i.2 ]
  %result.045.i.i.3 = phi i32 [ %result.1.i.i.3, %ifcont17.i.i.3 ], [ 0, %mulMod.exit.i.2 ]
  %a.147.i.i.3 = urem i32 %a.147.i.i.in.3, 1000003
  %modtmp13.i.i.3 = and i32 %b.046.i.i.3, 1
  %eqtmp14.not.i.i.3 = icmp eq i32 %modtmp13.i.i.3, 0
  br i1 %eqtmp14.not.i.i.3, label %ifcont17.i.i.3, label %then15.i.i.3

then15.i.i.3:                                     ; preds = %loopbody.i.i.3
  %addtmp20.i.i.3 = add nuw nsw i32 %result.045.i.i.3, %a.147.i.i.3
  %modtmp22.i.i.3 = urem i32 %addtmp20.i.i.3, 1000003
  br label %ifcont17.i.i.3

ifcont17.i.i.3:                                   ; preds = %then15.i.i.3, %loopbody.i.i.3
  %result.1.i.i.3 = phi i32 [ %modtmp22.i.i.3, %then15.i.i.3 ], [ %result.045.i.i.3, %loopbody.i.i.3 ]
  %addtmp25.i.i.3 = shl nuw nsw i32 %a.147.i.i.3, 1
  %divtmp44.i.i.3 = lshr i32 %b.046.i.i.3, 1
  %gttmp.not.i.i.3 = icmp eq i32 %divtmp44.i.i.3, 0
  br i1 %gttmp.not.i.i.3, label %mulMod.exit.i.3, label %loopbody.i.i.3

mulMod.exit.i.3:                                  ; preds = %ifcont17.i.i.3, %mulMod.exit.i.2
  %common.ret.op.i.i.3 = phi i32 [ 0, %mulMod.exit.i.2 ], [ %result.1.i.i.3, %ifcont17.i.i.3 ]
  %eqtmp3.i.i.4 = icmp eq i32 %common.ret.op.i.i.3, 0
  br i1 %eqtmp3.i.i.4, label %mulMod.exit.i.4, label %loopbody.i.i.4

loopbody.i.i.4:                                   ; preds = %mulMod.exit.i.3, %ifcont17.i.i.4
  %a.147.i.i.in.4 = phi i32 [ %addtmp25.i.i.4, %ifcont17.i.i.4 ], [ %common.ret.op.i.i.3, %mulMod.exit.i.3 ]
  %b.046.i.i.4 = phi i32 [ %divtmp44.i.i.4, %ifcont17.i.i.4 ], [ %common.ret.op.i.i.3, %mulMod.exit.i.3 ]
  %result.045.i.i.4 = phi i32 [ %result.1.i.i.4, %ifcont17.i.i.4 ], [ 0, %mulMod.exit.i.3 ]
  %a.147.i.i.4 = urem i32 %a.147.i.i.in.4, 1000003
  %modtmp13.i.i.4 = and i32 %b.046.i.i.4, 1
  %eqtmp14.not.i.i.4 = icmp eq i32 %modtmp13.i.i.4, 0
  br i1 %eqtmp14.not.i.i.4, label %ifcont17.i.i.4, label %then15.i.i.4

then15.i.i.4:                                     ; preds = %loopbody.i.i.4
  %addtmp20.i.i.4 = add nuw nsw i32 %result.045.i.i.4, %a.147.i.i.4
  %modtmp22.i.i.4 = urem i32 %addtmp20.i.i.4, 1000003
  br label %ifcont17.i.i.4

ifcont17.i.i.4:                                   ; preds = %then15.i.i.4, %loopbody.i.i.4
  %result.1.i.i.4 = phi i32 [ %modtmp22.i.i.4, %then15.i.i.4 ], [ %result.045.i.i.4, %loopbody.i.i.4 ]
  %addtmp25.i.i.4 = shl nuw nsw i32 %a.147.i.i.4, 1
  %divtmp44.i.i.4 = lshr i32 %b.046.i.i.4, 1
  %gttmp.not.i.i.4 = icmp eq i32 %divtmp44.i.i.4, 0
  br i1 %gttmp.not.i.i.4, label %mulMod.exit.i.4, label %loopbody.i.i.4

mulMod.exit.i.4:                                  ; preds = %ifcont17.i.i.4, %mulMod.exit.i.3
  %common.ret.op.i.i.4 = phi i32 [ 0, %mulMod.exit.i.3 ], [ %result.1.i.i.4, %ifcont17.i.i.4 ]
  %eqtmp3.i.i.5 = icmp eq i32 %common.ret.op.i.i.4, 0
  br i1 %eqtmp3.i.i.5, label %mulMod.exit.i.5, label %loopbody.i.i.5

loopbody.i.i.5:                                   ; preds = %mulMod.exit.i.4, %ifcont17.i.i.5
  %a.147.i.i.in.5 = phi i32 [ %addtmp25.i.i.5, %ifcont17.i.i.5 ], [ %common.ret.op.i.i.4, %mulMod.exit.i.4 ]
  %b.046.i.i.5 = phi i32 [ %divtmp44.i.i.5, %ifcont17.i.i.5 ], [ %common.ret.op.i.i.4, %mulMod.exit.i.4 ]
  %result.045.i.i.5 = phi i32 [ %result.1.i.i.5, %ifcont17.i.i.5 ], [ 0, %mulMod.exit.i.4 ]
  %a.147.i.i.5 = urem i32 %a.147.i.i.in.5, 1000003
  %modtmp13.i.i.5 = and i32 %b.046.i.i.5, 1
  %eqtmp14.not.i.i.5 = icmp eq i32 %modtmp13.i.i.5, 0
  br i1 %eqtmp14.not.i.i.5, label %ifcont17.i.i.5, label %then15.i.i.5

then15.i.i.5:                                     ; preds = %loopbody.i.i.5
  %addtmp20.i.i.5 = add nuw nsw i32 %result.045.i.i.5, %a.147.i.i.5
  %modtmp22.i.i.5 = urem i32 %addtmp20.i.i.5, 1000003
  br label %ifcont17.i.i.5

ifcont17.i.i.5:                                   ; preds = %then15.i.i.5, %loopbody.i.i.5
  %result.1.i.i.5 = phi i32 [ %modtmp22.i.i.5, %then15.i.i.5 ], [ %result.045.i.i.5, %loopbody.i.i.5 ]
  %addtmp25.i.i.5 = shl nuw nsw i32 %a.147.i.i.5, 1
  %divtmp44.i.i.5 = lshr i32 %b.046.i.i.5, 1
  %gttmp.not.i.i.5 = icmp eq i32 %divtmp44.i.i.5, 0
  br i1 %gttmp.not.i.i.5, label %mulMod.exit.i.5, label %loopbody.i.i.5

mulMod.exit.i.5:                                  ; preds = %ifcont17.i.i.5, %mulMod.exit.i.4
  %common.ret.op.i.i.5 = phi i32 [ 0, %mulMod.exit.i.4 ], [ %result.1.i.i.5, %ifcont17.i.i.5 ]
  %eqtmp3.i.i.6 = icmp eq i32 %common.ret.op.i.i.5, 0
  br i1 %eqtmp3.i.i.6, label %mulMod.exit.i.6, label %loopbody.i.i.6

loopbody.i.i.6:                                   ; preds = %mulMod.exit.i.5, %ifcont17.i.i.6
  %a.147.i.i.in.6 = phi i32 [ %addtmp25.i.i.6, %ifcont17.i.i.6 ], [ %common.ret.op.i.i.5, %mulMod.exit.i.5 ]
  %b.046.i.i.6 = phi i32 [ %divtmp44.i.i.6, %ifcont17.i.i.6 ], [ %common.ret.op.i.i.5, %mulMod.exit.i.5 ]
  %result.045.i.i.6 = phi i32 [ %result.1.i.i.6, %ifcont17.i.i.6 ], [ 0, %mulMod.exit.i.5 ]
  %a.147.i.i.6 = urem i32 %a.147.i.i.in.6, 1000003
  %modtmp13.i.i.6 = and i32 %b.046.i.i.6, 1
  %eqtmp14.not.i.i.6 = icmp eq i32 %modtmp13.i.i.6, 0
  br i1 %eqtmp14.not.i.i.6, label %ifcont17.i.i.6, label %then15.i.i.6

then15.i.i.6:                                     ; preds = %loopbody.i.i.6
  %addtmp20.i.i.6 = add nuw nsw i32 %result.045.i.i.6, %a.147.i.i.6
  %modtmp22.i.i.6 = urem i32 %addtmp20.i.i.6, 1000003
  br label %ifcont17.i.i.6

ifcont17.i.i.6:                                   ; preds = %then15.i.i.6, %loopbody.i.i.6
  %result.1.i.i.6 = phi i32 [ %modtmp22.i.i.6, %then15.i.i.6 ], [ %result.045.i.i.6, %loopbody.i.i.6 ]
  %addtmp25.i.i.6 = shl nuw nsw i32 %a.147.i.i.6, 1
  %divtmp44.i.i.6 = lshr i32 %b.046.i.i.6, 1
  %gttmp.not.i.i.6 = icmp eq i32 %divtmp44.i.i.6, 0
  br i1 %gttmp.not.i.i.6, label %mulMod.exit.i.6, label %loopbody.i.i.6

mulMod.exit.i.6:                                  ; preds = %ifcont17.i.i.6, %mulMod.exit.i.5
  %common.ret.op.i.i.6 = phi i32 [ 0, %mulMod.exit.i.5 ], [ %result.1.i.i.6, %ifcont17.i.i.6 ]
  %eqtmp3.i.i.7 = icmp eq i32 %common.ret.op.i.i.6, 0
  br i1 %eqtmp3.i.i.7, label %mulMod.exit.i.7, label %loopbody.i.i.7

loopbody.i.i.7:                                   ; preds = %mulMod.exit.i.6, %ifcont17.i.i.7
  %a.147.i.i.in.7 = phi i32 [ %addtmp25.i.i.7, %ifcont17.i.i.7 ], [ %common.ret.op.i.i.6, %mulMod.exit.i.6 ]
  %b.046.i.i.7 = phi i32 [ %divtmp44.i.i.7, %ifcont17.i.i.7 ], [ %common.ret.op.i.i.6, %mulMod.exit.i.6 ]
  %result.045.i.i.7 = phi i32 [ %result.1.i.i.7, %ifcont17.i.i.7 ], [ 0, %mulMod.exit.i.6 ]
  %a.147.i.i.7 = urem i32 %a.147.i.i.in.7, 1000003
  %modtmp13.i.i.7 = and i32 %b.046.i.i.7, 1
  %eqtmp14.not.i.i.7 = icmp eq i32 %modtmp13.i.i.7, 0
  br i1 %eqtmp14.not.i.i.7, label %ifcont17.i.i.7, label %then15.i.i.7

then15.i.i.7:                                     ; preds = %loopbody.i.i.7
  %addtmp20.i.i.7 = add nuw nsw i32 %result.045.i.i.7, %a.147.i.i.7
  %modtmp22.i.i.7 = urem i32 %addtmp20.i.i.7, 1000003
  br label %ifcont17.i.i.7

ifcont17.i.i.7:                                   ; preds = %then15.i.i.7, %loopbody.i.i.7
  %result.1.i.i.7 = phi i32 [ %modtmp22.i.i.7, %then15.i.i.7 ], [ %result.045.i.i.7, %loopbody.i.i.7 ]
  %addtmp25.i.i.7 = shl nuw nsw i32 %a.147.i.i.7, 1
  %divtmp44.i.i.7 = lshr i32 %b.046.i.i.7, 1
  %gttmp.not.i.i.7 = icmp eq i32 %divtmp44.i.i.7, 0
  br i1 %gttmp.not.i.i.7, label %mulMod.exit.i.7, label %loopbody.i.i.7

mulMod.exit.i.7:                                  ; preds = %ifcont17.i.i.7, %mulMod.exit.i.6
  %common.ret.op.i.i.7 = phi i32 [ 0, %mulMod.exit.i.6 ], [ %result.1.i.i.7, %ifcont17.i.i.7 ]
  %eqtmp3.i.i.8 = icmp eq i32 %common.ret.op.i.i.7, 0
  br i1 %eqtmp3.i.i.8, label %mulMod.exit.i.8, label %loopbody.i.i.8

loopbody.i.i.8:                                   ; preds = %mulMod.exit.i.7, %ifcont17.i.i.8
  %a.147.i.i.in.8 = phi i32 [ %addtmp25.i.i.8, %ifcont17.i.i.8 ], [ %common.ret.op.i.i.7, %mulMod.exit.i.7 ]
  %b.046.i.i.8 = phi i32 [ %divtmp44.i.i.8, %ifcont17.i.i.8 ], [ %common.ret.op.i.i.7, %mulMod.exit.i.7 ]
  %result.045.i.i.8 = phi i32 [ %result.1.i.i.8, %ifcont17.i.i.8 ], [ 0, %mulMod.exit.i.7 ]
  %a.147.i.i.8 = urem i32 %a.147.i.i.in.8, 1000003
  %modtmp13.i.i.8 = and i32 %b.046.i.i.8, 1
  %eqtmp14.not.i.i.8 = icmp eq i32 %modtmp13.i.i.8, 0
  br i1 %eqtmp14.not.i.i.8, label %ifcont17.i.i.8, label %then15.i.i.8

then15.i.i.8:                                     ; preds = %loopbody.i.i.8
  %addtmp20.i.i.8 = add nuw nsw i32 %result.045.i.i.8, %a.147.i.i.8
  %modtmp22.i.i.8 = urem i32 %addtmp20.i.i.8, 1000003
  br label %ifcont17.i.i.8

ifcont17.i.i.8:                                   ; preds = %then15.i.i.8, %loopbody.i.i.8
  %result.1.i.i.8 = phi i32 [ %modtmp22.i.i.8, %then15.i.i.8 ], [ %result.045.i.i.8, %loopbody.i.i.8 ]
  %addtmp25.i.i.8 = shl nuw nsw i32 %a.147.i.i.8, 1
  %divtmp44.i.i.8 = lshr i32 %b.046.i.i.8, 1
  %gttmp.not.i.i.8 = icmp eq i32 %divtmp44.i.i.8, 0
  br i1 %gttmp.not.i.i.8, label %mulMod.exit.i.8, label %loopbody.i.i.8

mulMod.exit.i.8:                                  ; preds = %ifcont17.i.i.8, %mulMod.exit.i.7
  %common.ret.op.i.i.8 = phi i32 [ 0, %mulMod.exit.i.7 ], [ %result.1.i.i.8, %ifcont17.i.i.8 ]
  %eqtmp3.i.i.9 = icmp eq i32 %common.ret.op.i.i.8, 0
  br i1 %eqtmp3.i.i.9, label %mulMod.exit.i.9, label %loopbody.i.i.9

loopbody.i.i.9:                                   ; preds = %mulMod.exit.i.8, %ifcont17.i.i.9
  %a.147.i.i.in.9 = phi i32 [ %addtmp25.i.i.9, %ifcont17.i.i.9 ], [ %common.ret.op.i.i.8, %mulMod.exit.i.8 ]
  %b.046.i.i.9 = phi i32 [ %divtmp44.i.i.9, %ifcont17.i.i.9 ], [ %common.ret.op.i.i.8, %mulMod.exit.i.8 ]
  %result.045.i.i.9 = phi i32 [ %result.1.i.i.9, %ifcont17.i.i.9 ], [ 0, %mulMod.exit.i.8 ]
  %a.147.i.i.9 = urem i32 %a.147.i.i.in.9, 1000003
  %modtmp13.i.i.9 = and i32 %b.046.i.i.9, 1
  %eqtmp14.not.i.i.9 = icmp eq i32 %modtmp13.i.i.9, 0
  br i1 %eqtmp14.not.i.i.9, label %ifcont17.i.i.9, label %then15.i.i.9

then15.i.i.9:                                     ; preds = %loopbody.i.i.9
  %addtmp20.i.i.9 = add nuw nsw i32 %result.045.i.i.9, %a.147.i.i.9
  %modtmp22.i.i.9 = urem i32 %addtmp20.i.i.9, 1000003
  br label %ifcont17.i.i.9

ifcont17.i.i.9:                                   ; preds = %then15.i.i.9, %loopbody.i.i.9
  %result.1.i.i.9 = phi i32 [ %modtmp22.i.i.9, %then15.i.i.9 ], [ %result.045.i.i.9, %loopbody.i.i.9 ]
  %addtmp25.i.i.9 = shl nuw nsw i32 %a.147.i.i.9, 1
  %divtmp44.i.i.9 = lshr i32 %b.046.i.i.9, 1
  %gttmp.not.i.i.9 = icmp eq i32 %divtmp44.i.i.9, 0
  br i1 %gttmp.not.i.i.9, label %mulMod.exit.i.loopexit.9, label %loopbody.i.i.9

mulMod.exit.i.loopexit.9:                         ; preds = %ifcont17.i.i.9
  %0 = and i32 %result.1.i.i.9, 1
  br label %mulMod.exit.i.9

mulMod.exit.i.9:                                  ; preds = %mulMod.exit.i.loopexit.9, %mulMod.exit.i.8
  %common.ret.op.i.i.9 = phi i32 [ 0, %mulMod.exit.i.8 ], [ %0, %mulMod.exit.i.loopexit.9 ]
  %modtmp15.i.8 = and i32 %common.ret.op.i.i.8, 1
  %modtmp15.i.7 = and i32 %common.ret.op.i.i.7, 1
  %modtmp15.i.6 = and i32 %common.ret.op.i.i.6, 1
  %modtmp15.i.5 = and i32 %common.ret.op.i.i.5, 1
  %modtmp15.i.4 = and i32 %common.ret.op.i.i.4, 1
  %modtmp15.i.3 = and i32 %common.ret.op.i.i.3, 1
  %modtmp15.i.2 = and i32 %common.ret.op.i.i.2, 1
  %modtmp15.i.1 = and i32 %common.ret.op.i.i.1, 1
  %modtmp15.i = and i32 %result.1.i.i, 1
  %addtmp16.i.1 = add nuw nsw i32 %modtmp15.i.1, %modtmp15.i
  %addtmp16.i.2 = add nuw nsw i32 %modtmp15.i.2, %addtmp16.i.1
  %addtmp16.i.3 = add nuw nsw i32 %modtmp15.i.3, %addtmp16.i.2
  %addtmp16.i.4 = add nuw nsw i32 %modtmp15.i.4, %addtmp16.i.3
  %addtmp16.i.5 = add nuw nsw i32 %modtmp15.i.5, %addtmp16.i.4
  %addtmp16.i.6 = add nuw nsw i32 %modtmp15.i.6, %addtmp16.i.5
  %modtmp18.i.6 = srem i32 %addtmp16.i.6, 1000000007
  %addtmp16.i.7 = add nsw i32 %modtmp15.i.7, %modtmp18.i.6
  %modtmp18.i.7 = srem i32 %addtmp16.i.7, 1000000007
  %addtmp16.i.8 = add nsw i32 %modtmp15.i.8, %modtmp18.i.7
  %modtmp18.i.8 = srem i32 %addtmp16.i.8, 1000000007
  %addtmp16.i.9 = add nsw i32 %common.ret.op.i.i.9, %modtmp18.i.8
  %modtmp18.i.9 = srem i32 %addtmp16.i.9, 1000000007
  %1 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp18.i.9)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
