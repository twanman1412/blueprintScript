; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 0, 2147483647) i32 @mulMod(i32 noundef %0, i32 noundef range(i32 0, -2147483648) %1, i32 noundef range(i32 2, -2147483648) %2) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %0, 0
  %eqtmp3 = icmp eq i32 %1, 0
  %or.cond = or i1 %eqtmp, %eqtmp3
  br i1 %or.cond, label %common.ret, label %loopbody

common.ret:                                       ; preds = %ifcont, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %result.1, %ifcont ]
  ret i32 %common.ret.op

loopbody:                                         ; preds = %entry, %ifcont
  %.pn = phi i32 [ %addtmp18, %ifcont ], [ %0, %entry ]
  %b.037 = phi i32 [ %divtmp34, %ifcont ], [ %1, %entry ]
  %result.036 = phi i32 [ %result.1, %ifcont ], [ 0, %entry ]
  %a.038 = srem i32 %.pn, %2
  %modtmp10 = and i32 %b.037, 1
  %eqtmp11.not = icmp eq i32 %modtmp10, 0
  br i1 %eqtmp11.not, label %ifcont, label %then

then:                                             ; preds = %loopbody
  %addtmp = add i32 %a.038, %result.036
  %modtmp15 = srem i32 %addtmp, %2
  br label %ifcont

ifcont:                                           ; preds = %loopbody, %then
  %result.1 = phi i32 [ %modtmp15, %then ], [ %result.036, %loopbody ]
  %addtmp18 = shl i32 %a.038, 1
  %divtmp34 = lshr i32 %b.037, 1
  %gttmp.not = icmp eq i32 %divtmp34, 0
  br i1 %gttmp.not, label %common.ret, label %loopbody
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 0, 2147483647) i32 @modExp(i32 noundef %0, i32 noundef range(i32 0, -2147483648) %1, i32 noundef range(i32 2, -2147483648) %2) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %1, 0
  br i1 %eqtmp, label %common.ret, label %default.next

common.ret:                                       ; preds = %mulMod.exit54, %default.next, %entry
  %common.ret.op = phi i32 [ 0, %default.next ], [ 1, %entry ], [ %result.1, %mulMod.exit54 ]
  ret i32 %common.ret.op

default.next:                                     ; preds = %entry
  %modtmp = srem i32 %0, %2
  %eqtmp4 = icmp eq i32 %modtmp, 0
  br i1 %eqtmp4, label %common.ret, label %loopbody

loopbody:                                         ; preds = %default.next, %mulMod.exit54
  %base.057 = phi i32 [ %common.ret.op.i53, %mulMod.exit54 ], [ %modtmp, %default.next ]
  %exp.056 = phi i32 [ %divtmp34, %mulMod.exit54 ], [ %1, %default.next ]
  %result.055 = phi i32 [ %result.1, %mulMod.exit54 ], [ 1, %default.next ]
  %modtmp12 = and i32 %exp.056, 1
  %eqtmp13.not = icmp eq i32 %modtmp12, 0
  br i1 %eqtmp13.not, label %ifcont, label %then

then:                                             ; preds = %loopbody
  %eqtmp.i = icmp eq i32 %result.055, 0
  %eqtmp3.i = icmp eq i32 %base.057, 0
  %or.cond.i = or i1 %eqtmp.i, %eqtmp3.i
  br i1 %or.cond.i, label %ifcont, label %loopbody.i

loopbody.i:                                       ; preds = %then, %ifcont.i
  %.pn.i = phi i32 [ %addtmp18.i, %ifcont.i ], [ %result.055, %then ]
  %b.037.i = phi i32 [ %divtmp34.i, %ifcont.i ], [ %base.057, %then ]
  %result.036.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %then ]
  %a.038.i = srem i32 %.pn.i, %2
  %modtmp10.i = and i32 %b.037.i, 1
  %eqtmp11.not.i = icmp eq i32 %modtmp10.i, 0
  br i1 %eqtmp11.not.i, label %ifcont.i, label %then.i

then.i:                                           ; preds = %loopbody.i
  %addtmp.i = add i32 %a.038.i, %result.036.i
  %modtmp15.i = srem i32 %addtmp.i, %2
  br label %ifcont.i

ifcont.i:                                         ; preds = %then.i, %loopbody.i
  %result.1.i = phi i32 [ %modtmp15.i, %then.i ], [ %result.036.i, %loopbody.i ]
  %addtmp18.i = shl i32 %a.038.i, 1
  %divtmp34.i = lshr i32 %b.037.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp34.i, 0
  br i1 %gttmp.not.i, label %ifcont, label %loopbody.i

ifcont:                                           ; preds = %ifcont.i, %then, %loopbody
  %result.1 = phi i32 [ %result.055, %loopbody ], [ 0, %then ], [ %result.1.i, %ifcont.i ]
  %divtmp34 = lshr i32 %exp.056, 1
  %eqtmp3.i36 = icmp eq i32 %base.057, 0
  br i1 %eqtmp3.i36, label %mulMod.exit54, label %loopbody.i38

loopbody.i38:                                     ; preds = %ifcont, %ifcont.i48
  %.pn.i39 = phi i32 [ %addtmp18.i50, %ifcont.i48 ], [ %base.057, %ifcont ]
  %b.037.i40 = phi i32 [ %divtmp34.i51, %ifcont.i48 ], [ %base.057, %ifcont ]
  %result.036.i41 = phi i32 [ %result.1.i49, %ifcont.i48 ], [ 0, %ifcont ]
  %a.038.i42 = srem i32 %.pn.i39, %2
  %modtmp10.i43 = and i32 %b.037.i40, 1
  %eqtmp11.not.i44 = icmp eq i32 %modtmp10.i43, 0
  br i1 %eqtmp11.not.i44, label %ifcont.i48, label %then.i45

then.i45:                                         ; preds = %loopbody.i38
  %addtmp.i46 = add i32 %a.038.i42, %result.036.i41
  %modtmp15.i47 = srem i32 %addtmp.i46, %2
  br label %ifcont.i48

ifcont.i48:                                       ; preds = %then.i45, %loopbody.i38
  %result.1.i49 = phi i32 [ %modtmp15.i47, %then.i45 ], [ %result.036.i41, %loopbody.i38 ]
  %addtmp18.i50 = shl i32 %a.038.i42, 1
  %divtmp34.i51 = lshr i32 %b.037.i40, 1
  %gttmp.not.i52 = icmp eq i32 %divtmp34.i51, 0
  br i1 %gttmp.not.i52, label %mulMod.exit54, label %loopbody.i38

mulMod.exit54:                                    ; preds = %ifcont.i48, %ifcont
  %common.ret.op.i53 = phi i32 [ 0, %ifcont ], [ %result.1.i49, %ifcont.i48 ]
  %gttmp.not = icmp eq i32 %divtmp34, 0
  br i1 %gttmp.not, label %common.ret, label %loopbody
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
loopbody.i.i.preheader.1:
  br label %loopbody.i38.i.2

loopbody.i38.i.2:                                 ; preds = %loopbody.i.i.preheader.1, %ifcont.i48.i.2
  %.pn.i39.i.2 = phi i32 [ %addtmp18.i50.i.2, %ifcont.i48.i.2 ], [ 16, %loopbody.i.i.preheader.1 ]
  %b.037.i40.i.2 = phi i32 [ %divtmp34.i51.i.2, %ifcont.i48.i.2 ], [ 16, %loopbody.i.i.preheader.1 ]
  %result.036.i41.i.2 = phi i32 [ %result.1.i49.i.2, %ifcont.i48.i.2 ], [ 0, %loopbody.i.i.preheader.1 ]
  %a.038.i42.i.2 = srem i32 %.pn.i39.i.2, 1000
  %modtmp10.i43.i.2 = and i32 %b.037.i40.i.2, 1
  %eqtmp11.not.i44.i.2 = icmp eq i32 %modtmp10.i43.i.2, 0
  br i1 %eqtmp11.not.i44.i.2, label %ifcont.i48.i.2, label %then.i45.i.2

then.i45.i.2:                                     ; preds = %loopbody.i38.i.2
  %addtmp.i46.i.2 = add nsw i32 %result.036.i41.i.2, %a.038.i42.i.2
  %modtmp15.i47.i.2 = srem i32 %addtmp.i46.i.2, 1000
  br label %ifcont.i48.i.2

ifcont.i48.i.2:                                   ; preds = %then.i45.i.2, %loopbody.i38.i.2
  %result.1.i49.i.2 = phi i32 [ %modtmp15.i47.i.2, %then.i45.i.2 ], [ %result.036.i41.i.2, %loopbody.i38.i.2 ]
  %addtmp18.i50.i.2 = shl nsw i32 %a.038.i42.i.2, 1
  %divtmp34.i51.i.2 = lshr i32 %b.037.i40.i.2, 1
  %gttmp.not.i52.i.2 = icmp eq i32 %divtmp34.i51.i.2, 0
  br i1 %gttmp.not.i52.i.2, label %then.i.3, label %loopbody.i38.i.2

then.i.3:                                         ; preds = %ifcont.i48.i.2
  %eqtmp3.i.i.3 = icmp eq i32 %result.1.i49.i.2, 0
  br i1 %eqtmp3.i.i.3, label %mulMod.exit54.i.3, label %loopbody.i.i.3

loopbody.i.i.3:                                   ; preds = %then.i.3, %ifcont.i.i.3
  %.pn.i.i.3 = phi i32 [ %addtmp18.i.i.3, %ifcont.i.i.3 ], [ 4, %then.i.3 ]
  %b.037.i.i.3 = phi i32 [ %divtmp34.i.i.3, %ifcont.i.i.3 ], [ %result.1.i49.i.2, %then.i.3 ]
  %result.036.i.i.3 = phi i32 [ %result.1.i.i.3, %ifcont.i.i.3 ], [ 0, %then.i.3 ]
  %a.038.i.i.3 = srem i32 %.pn.i.i.3, 1000
  %modtmp10.i.i.3 = and i32 %b.037.i.i.3, 1
  %eqtmp11.not.i.i.3 = icmp eq i32 %modtmp10.i.i.3, 0
  br i1 %eqtmp11.not.i.i.3, label %ifcont.i.i.3, label %then.i.i.3

then.i.i.3:                                       ; preds = %loopbody.i.i.3
  %addtmp.i.i.3 = add nsw i32 %result.036.i.i.3, %a.038.i.i.3
  %modtmp15.i.i.3 = srem i32 %addtmp.i.i.3, 1000
  br label %ifcont.i.i.3

ifcont.i.i.3:                                     ; preds = %then.i.i.3, %loopbody.i.i.3
  %result.1.i.i.3 = phi i32 [ %modtmp15.i.i.3, %then.i.i.3 ], [ %result.036.i.i.3, %loopbody.i.i.3 ]
  %addtmp18.i.i.3 = shl nsw i32 %a.038.i.i.3, 1
  %divtmp34.i.i.3 = lshr i32 %b.037.i.i.3, 1
  %gttmp.not.i.i.3 = icmp eq i32 %divtmp34.i.i.3, 0
  br i1 %gttmp.not.i.i.3, label %mulMod.exit54.i.3, label %loopbody.i.i.3

mulMod.exit54.i.3:                                ; preds = %ifcont.i.i.3, %then.i.3
  %result.1.i.324 = phi i32 [ 0, %then.i.3 ], [ %result.1.i.i.3, %ifcont.i.i.3 ]
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %result.1.i.324)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
