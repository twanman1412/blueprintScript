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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @modExpStress() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader

loopbody.i.preheader:                             ; preds = %entry, %modExp.exit
  %result.017 = phi i32 [ 0, %entry ], [ %modtmp, %modExp.exit ]
  %i.016 = phi i32 [ 1, %entry ], [ %addtmp10, %modExp.exit ]
  br label %loopbody.i

loopbody.i:                                       ; preds = %loopbody.i.preheader, %mulMod.exit54.i
  %base.057.i = phi i32 [ %common.ret.op.i53.i, %mulMod.exit54.i ], [ %i.016, %loopbody.i.preheader ]
  %exp.056.i = phi i32 [ %divtmp34.i, %mulMod.exit54.i ], [ 2147483647, %loopbody.i.preheader ]
  %result.055.i = phi i32 [ %result.1.i, %mulMod.exit54.i ], [ 1, %loopbody.i.preheader ]
  %modtmp12.i = and i32 %exp.056.i, 1
  %eqtmp13.not.i = icmp eq i32 %modtmp12.i, 0
  br i1 %eqtmp13.not.i, label %ifcont.i, label %then.i

then.i:                                           ; preds = %loopbody.i
  %eqtmp.i.i = icmp eq i32 %result.055.i, 0
  %eqtmp3.i.i = icmp eq i32 %base.057.i, 0
  %or.cond.i.i = or i1 %eqtmp3.i.i, %eqtmp.i.i
  br i1 %or.cond.i.i, label %ifcont.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %then.i, %ifcont.i.i
  %.pn.i.i = phi i32 [ %addtmp18.i.i, %ifcont.i.i ], [ %result.055.i, %then.i ]
  %b.037.i.i = phi i32 [ %divtmp34.i.i, %ifcont.i.i ], [ %base.057.i, %then.i ]
  %result.036.i.i = phi i32 [ %result.1.i.i, %ifcont.i.i ], [ 0, %then.i ]
  %a.038.i.i = srem i32 %.pn.i.i, 1000000007
  %modtmp10.i.i = and i32 %b.037.i.i, 1
  %eqtmp11.not.i.i = icmp eq i32 %modtmp10.i.i, 0
  br i1 %eqtmp11.not.i.i, label %ifcont.i.i, label %then.i.i

then.i.i:                                         ; preds = %loopbody.i.i
  %addtmp.i.i = add i32 %result.036.i.i, %a.038.i.i
  %modtmp15.i.i = srem i32 %addtmp.i.i, 1000000007
  br label %ifcont.i.i

ifcont.i.i:                                       ; preds = %then.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %modtmp15.i.i, %then.i.i ], [ %result.036.i.i, %loopbody.i.i ]
  %addtmp18.i.i = shl nsw i32 %a.038.i.i, 1
  %divtmp34.i.i = lshr i32 %b.037.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp34.i.i, 0
  br i1 %gttmp.not.i.i, label %ifcont.i, label %loopbody.i.i

ifcont.i:                                         ; preds = %ifcont.i.i, %then.i, %loopbody.i
  %result.1.i = phi i32 [ %result.055.i, %loopbody.i ], [ 0, %then.i ], [ %result.1.i.i, %ifcont.i.i ]
  %divtmp34.i = lshr i32 %exp.056.i, 1
  %eqtmp3.i36.i = icmp eq i32 %base.057.i, 0
  br i1 %eqtmp3.i36.i, label %mulMod.exit54.i, label %loopbody.i38.i

loopbody.i38.i:                                   ; preds = %ifcont.i, %ifcont.i48.i
  %.pn.i39.i = phi i32 [ %addtmp18.i50.i, %ifcont.i48.i ], [ %base.057.i, %ifcont.i ]
  %b.037.i40.i = phi i32 [ %divtmp34.i51.i, %ifcont.i48.i ], [ %base.057.i, %ifcont.i ]
  %result.036.i41.i = phi i32 [ %result.1.i49.i, %ifcont.i48.i ], [ 0, %ifcont.i ]
  %a.038.i42.i = srem i32 %.pn.i39.i, 1000000007
  %modtmp10.i43.i = and i32 %b.037.i40.i, 1
  %eqtmp11.not.i44.i = icmp eq i32 %modtmp10.i43.i, 0
  br i1 %eqtmp11.not.i44.i, label %ifcont.i48.i, label %then.i45.i

then.i45.i:                                       ; preds = %loopbody.i38.i
  %addtmp.i46.i = add i32 %result.036.i41.i, %a.038.i42.i
  %modtmp15.i47.i = srem i32 %addtmp.i46.i, 1000000007
  br label %ifcont.i48.i

ifcont.i48.i:                                     ; preds = %then.i45.i, %loopbody.i38.i
  %result.1.i49.i = phi i32 [ %modtmp15.i47.i, %then.i45.i ], [ %result.036.i41.i, %loopbody.i38.i ]
  %addtmp18.i50.i = shl nsw i32 %a.038.i42.i, 1
  %divtmp34.i51.i = lshr i32 %b.037.i40.i, 1
  %gttmp.not.i52.i = icmp eq i32 %divtmp34.i51.i, 0
  br i1 %gttmp.not.i52.i, label %mulMod.exit54.i, label %loopbody.i38.i

mulMod.exit54.i:                                  ; preds = %ifcont.i48.i, %ifcont.i
  %common.ret.op.i53.i = phi i32 [ 0, %ifcont.i ], [ %result.1.i49.i, %ifcont.i48.i ]
  %gttmp.not.i = icmp eq i32 %divtmp34.i, 0
  br i1 %gttmp.not.i, label %modExp.exit, label %loopbody.i

modExp.exit:                                      ; preds = %mulMod.exit54.i
  %addtmp = add i32 %result.1.i, %result.017
  %modtmp = srem i32 %addtmp, 1000000007
  %addtmp10 = add nuw nsw i32 %i.016, 1
  %letmp = icmp samesign ult i32 %i.016, 1000000
  br i1 %letmp, label %loopbody.i.preheader, label %loopexit

loopexit:                                         ; preds = %modExp.exit
  ret i32 %modtmp
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %modExp.exit.i, %entry
  %result.017.i = phi i32 [ 0, %entry ], [ %modtmp.i, %modExp.exit.i ]
  %i.016.i = phi i32 [ 1, %entry ], [ %addtmp10.i, %modExp.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit54.i.i, %loopbody.i.preheader.i
  %base.057.i.i = phi i32 [ %common.ret.op.i53.i.i, %mulMod.exit54.i.i ], [ %i.016.i, %loopbody.i.preheader.i ]
  %exp.056.i.i = phi i32 [ %divtmp34.i.i, %mulMod.exit54.i.i ], [ 2147483647, %loopbody.i.preheader.i ]
  %result.055.i.i = phi i32 [ %result.1.i.i, %mulMod.exit54.i.i ], [ 1, %loopbody.i.preheader.i ]
  %modtmp12.i.i = and i32 %exp.056.i.i, 1
  %eqtmp13.not.i.i = icmp eq i32 %modtmp12.i.i, 0
  br i1 %eqtmp13.not.i.i, label %ifcont.i.i, label %then.i.i

then.i.i:                                         ; preds = %loopbody.i.i
  %eqtmp.i.i.i = icmp eq i32 %result.055.i.i, 0
  %eqtmp3.i.i.i = icmp eq i32 %base.057.i.i, 0
  %or.cond.i.i.i = or i1 %eqtmp3.i.i.i, %eqtmp.i.i.i
  br i1 %or.cond.i.i.i, label %ifcont.i.i, label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %then.i.i, %ifcont.i.i.i
  %.pn.i.i.i = phi i32 [ %addtmp18.i.i.i, %ifcont.i.i.i ], [ %result.055.i.i, %then.i.i ]
  %b.037.i.i.i = phi i32 [ %divtmp34.i.i.i, %ifcont.i.i.i ], [ %base.057.i.i, %then.i.i ]
  %result.036.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont.i.i.i ], [ 0, %then.i.i ]
  %a.038.i.i.i = srem i32 %.pn.i.i.i, 1000000007
  %modtmp10.i.i.i = and i32 %b.037.i.i.i, 1
  %eqtmp11.not.i.i.i = icmp eq i32 %modtmp10.i.i.i, 0
  br i1 %eqtmp11.not.i.i.i, label %ifcont.i.i.i, label %then.i.i.i

then.i.i.i:                                       ; preds = %loopbody.i.i.i
  %addtmp.i.i.i = add i32 %result.036.i.i.i, %a.038.i.i.i
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
  %divtmp34.i.i = lshr i32 %exp.056.i.i, 1
  %eqtmp3.i36.i.i = icmp eq i32 %base.057.i.i, 0
  br i1 %eqtmp3.i36.i.i, label %mulMod.exit54.i.i, label %loopbody.i38.i.i

loopbody.i38.i.i:                                 ; preds = %ifcont.i.i, %ifcont.i48.i.i
  %.pn.i39.i.i = phi i32 [ %addtmp18.i50.i.i, %ifcont.i48.i.i ], [ %base.057.i.i, %ifcont.i.i ]
  %b.037.i40.i.i = phi i32 [ %divtmp34.i51.i.i, %ifcont.i48.i.i ], [ %base.057.i.i, %ifcont.i.i ]
  %result.036.i41.i.i = phi i32 [ %result.1.i49.i.i, %ifcont.i48.i.i ], [ 0, %ifcont.i.i ]
  %a.038.i42.i.i = srem i32 %.pn.i39.i.i, 1000000007
  %modtmp10.i43.i.i = and i32 %b.037.i40.i.i, 1
  %eqtmp11.not.i44.i.i = icmp eq i32 %modtmp10.i43.i.i, 0
  br i1 %eqtmp11.not.i44.i.i, label %ifcont.i48.i.i, label %then.i45.i.i

then.i45.i.i:                                     ; preds = %loopbody.i38.i.i
  %addtmp.i46.i.i = add i32 %result.036.i41.i.i, %a.038.i42.i.i
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
  %gttmp.not.i.i = icmp eq i32 %divtmp34.i.i, 0
  br i1 %gttmp.not.i.i, label %modExp.exit.i, label %loopbody.i.i

modExp.exit.i:                                    ; preds = %mulMod.exit54.i.i
  %addtmp.i = add i32 %result.1.i.i, %result.017.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp10.i = add nuw nsw i32 %i.016.i, 1
  %letmp.i = icmp samesign ult i32 %i.016.i, 1000000
  br i1 %letmp.i, label %loopbody.i.preheader.i, label %modExpStress.exit

modExpStress.exit:                                ; preds = %modExp.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
