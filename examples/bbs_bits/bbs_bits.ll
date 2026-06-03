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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @bbsStress() local_unnamed_addr #0 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %mulMod.exit.i, %entry
  %seed.134.i = phi i32 [ 456420, %entry ], [ %common.ret.op.i.i, %mulMod.exit.i ]
  %i.033.i = phi i32 [ 0, %entry ], [ %addtmp20.i, %mulMod.exit.i ]
  %result.032.i = phi i32 [ 0, %entry ], [ %modtmp18.i, %mulMod.exit.i ]
  %eqtmp3.i.i = icmp eq i32 %seed.134.i, 0
  br i1 %eqtmp3.i.i, label %mulMod.exit.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i, %ifcont17.i.i
  %a.147.i.i.in = phi i32 [ %addtmp25.i.i, %ifcont17.i.i ], [ %seed.134.i, %loopbody.i ]
  %b.046.i.i = phi i32 [ %divtmp44.i.i, %ifcont17.i.i ], [ %seed.134.i, %loopbody.i ]
  %result.045.i.i = phi i32 [ %result.1.i.i, %ifcont17.i.i ], [ 0, %loopbody.i ]
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

mulMod.exit.i:                                    ; preds = %ifcont17.i.i, %loopbody.i
  %common.ret.op.i.i = phi i32 [ 0, %loopbody.i ], [ %result.1.i.i, %ifcont17.i.i ]
  %modtmp15.i = and i32 %common.ret.op.i.i, 1
  %addtmp16.i = add nsw i32 %modtmp15.i, %result.032.i
  %modtmp18.i = srem i32 %addtmp16.i, 1000000007
  %addtmp20.i = add nuw nsw i32 %i.033.i, 1
  %lttmp9.i = icmp samesign ult i32 %i.033.i, 199999999
  br i1 %lttmp9.i, label %loopbody.i, label %bbsBits.exit

bbsBits.exit:                                     ; preds = %mulMod.exit.i
  ret i32 %modtmp18.i
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit.i.i, %entry
  %seed.134.i.i = phi i32 [ 456420, %entry ], [ %common.ret.op.i.i.i, %mulMod.exit.i.i ]
  %i.033.i.i = phi i32 [ 0, %entry ], [ %addtmp20.i.i, %mulMod.exit.i.i ]
  %result.032.i.i = phi i32 [ 0, %entry ], [ %modtmp18.i.i, %mulMod.exit.i.i ]
  %eqtmp3.i.i.i = icmp eq i32 %seed.134.i.i, 0
  br i1 %eqtmp3.i.i.i, label %mulMod.exit.i.i, label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %loopbody.i.i, %ifcont17.i.i.i
  %a.147.i.i.in.i = phi i32 [ %addtmp25.i.i.i, %ifcont17.i.i.i ], [ %seed.134.i.i, %loopbody.i.i ]
  %b.046.i.i.i = phi i32 [ %divtmp44.i.i.i, %ifcont17.i.i.i ], [ %seed.134.i.i, %loopbody.i.i ]
  %result.045.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont17.i.i.i ], [ 0, %loopbody.i.i ]
  %a.147.i.i.i = urem i32 %a.147.i.i.in.i, 1000003
  %modtmp13.i.i.i = and i32 %b.046.i.i.i, 1
  %eqtmp14.not.i.i.i = icmp eq i32 %modtmp13.i.i.i, 0
  br i1 %eqtmp14.not.i.i.i, label %ifcont17.i.i.i, label %then15.i.i.i

then15.i.i.i:                                     ; preds = %loopbody.i.i.i
  %addtmp20.i.i.i = add nuw nsw i32 %result.045.i.i.i, %a.147.i.i.i
  %modtmp22.i.i.i = urem i32 %addtmp20.i.i.i, 1000003
  br label %ifcont17.i.i.i

ifcont17.i.i.i:                                   ; preds = %then15.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp22.i.i.i, %then15.i.i.i ], [ %result.045.i.i.i, %loopbody.i.i.i ]
  %addtmp25.i.i.i = shl nuw nsw i32 %a.147.i.i.i, 1
  %divtmp44.i.i.i = lshr i32 %b.046.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp44.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %mulMod.exit.i.i, label %loopbody.i.i.i

mulMod.exit.i.i:                                  ; preds = %ifcont17.i.i.i, %loopbody.i.i
  %common.ret.op.i.i.i = phi i32 [ 0, %loopbody.i.i ], [ %result.1.i.i.i, %ifcont17.i.i.i ]
  %modtmp15.i.i = and i32 %common.ret.op.i.i.i, 1
  %addtmp16.i.i = add nsw i32 %modtmp15.i.i, %result.032.i.i
  %modtmp18.i.i = srem i32 %addtmp16.i.i, 1000000007
  %addtmp20.i.i = add nuw nsw i32 %i.033.i.i, 1
  %lttmp9.i.i = icmp samesign ult i32 %i.033.i.i, 199999999
  br i1 %lttmp9.i.i, label %loopbody.i.i, label %bbsStress.exit

bbsStress.exit:                                   ; preds = %mulMod.exit.i.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp18.i.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
