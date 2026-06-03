; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @mulMod(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
entry:
  %gttmp36 = icmp sgt i32 %1, 0
  br i1 %gttmp36, label %loopbody.preheader, label %loopexit

loopbody.preheader:                               ; preds = %entry
  %modtmp = srem i32 %0, %2
  %lttmp = icmp slt i32 %modtmp, 0
  %addtmp = select i1 %lttmp, i32 %2, i32 0
  %spec.select = add i32 %addtmp, %modtmp
  br label %loopbody

loopbody:                                         ; preds = %loopbody.preheader, %ifcont11
  %a.139 = phi i32 [ %modtmp21, %ifcont11 ], [ %spec.select, %loopbody.preheader ]
  %b.038 = phi i32 [ %divtmp35, %ifcont11 ], [ %1, %loopbody.preheader ]
  %result.037 = phi i32 [ %result.1, %ifcont11 ], [ 0, %loopbody.preheader ]
  %modtmp8 = and i32 %b.038, 1
  %eqtmp.not = icmp eq i32 %modtmp8, 0
  br i1 %eqtmp.not, label %ifcont11, label %then9

loopexit:                                         ; preds = %ifcont11, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %result.1, %ifcont11 ]
  ret i32 %result.0.lcssa

then9:                                            ; preds = %loopbody
  %addtmp14 = add i32 %a.139, %result.037
  %modtmp16 = srem i32 %addtmp14, %2
  br label %ifcont11

ifcont11:                                         ; preds = %loopbody, %then9
  %result.1 = phi i32 [ %modtmp16, %then9 ], [ %result.037, %loopbody ]
  %addtmp19 = shl i32 %a.139, 1
  %modtmp21 = srem i32 %addtmp19, %2
  %divtmp35 = lshr i32 %b.038, 1
  %gttmp.not = icmp eq i32 %divtmp35, 0
  br i1 %gttmp.not, label %loopexit, label %loopbody
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @modExp(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
entry:
  %gttmp61 = icmp sgt i32 %1, 0
  br i1 %gttmp61, label %loopbody.preheader, label %loopexit

loopbody.preheader:                               ; preds = %entry
  %modtmp = srem i32 %0, %2
  %lttmp = icmp slt i32 %modtmp, 0
  %addtmp = select i1 %lttmp, i32 %2, i32 0
  %spec.select = add i32 %addtmp, %modtmp
  br label %loopbody

loopbody:                                         ; preds = %loopbody.preheader, %mulMod.exit55
  %base.164 = phi i32 [ %result.0.lcssa.i34, %mulMod.exit55 ], [ %spec.select, %loopbody.preheader ]
  %exp.063 = phi i32 [ %divtmp3260, %mulMod.exit55 ], [ %1, %loopbody.preheader ]
  %result.062 = phi i32 [ %result.159, %mulMod.exit55 ], [ 1, %loopbody.preheader ]
  %modtmp8 = and i32 %exp.063, 1
  %eqtmp.not = icmp eq i32 %modtmp8, 0
  br i1 %eqtmp.not, label %ifcont11, label %then9

loopexit:                                         ; preds = %mulMod.exit55, %entry
  %result.0.lcssa = phi i32 [ 1, %entry ], [ %result.159, %mulMod.exit55 ]
  ret i32 %result.0.lcssa

then9:                                            ; preds = %loopbody
  %gttmp36.i = icmp sgt i32 %base.164, 0
  br i1 %gttmp36.i, label %loopbody.preheader.i, label %mulMod.exit55

loopbody.preheader.i:                             ; preds = %then9
  %modtmp.i = srem i32 %result.062, %2
  %lttmp.i = icmp slt i32 %modtmp.i, 0
  %addtmp.i = select i1 %lttmp.i, i32 %2, i32 0
  %spec.select.i = add i32 %addtmp.i, %modtmp.i
  br label %loopbody.i

loopbody.i:                                       ; preds = %ifcont11.i, %loopbody.preheader.i
  %a.139.i = phi i32 [ %modtmp21.i, %ifcont11.i ], [ %spec.select.i, %loopbody.preheader.i ]
  %b.038.i = phi i32 [ %divtmp35.i, %ifcont11.i ], [ %base.164, %loopbody.preheader.i ]
  %result.037.i = phi i32 [ %result.1.i, %ifcont11.i ], [ 0, %loopbody.preheader.i ]
  %modtmp8.i = and i32 %b.038.i, 1
  %eqtmp.not.i = icmp eq i32 %modtmp8.i, 0
  br i1 %eqtmp.not.i, label %ifcont11.i, label %then9.i

then9.i:                                          ; preds = %loopbody.i
  %addtmp14.i = add i32 %result.037.i, %a.139.i
  %modtmp16.i = srem i32 %addtmp14.i, %2
  br label %ifcont11.i

ifcont11.i:                                       ; preds = %then9.i, %loopbody.i
  %result.1.i = phi i32 [ %modtmp16.i, %then9.i ], [ %result.037.i, %loopbody.i ]
  %addtmp19.i = shl i32 %a.139.i, 1
  %modtmp21.i = srem i32 %addtmp19.i, %2
  %divtmp35.i = lshr i32 %b.038.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp35.i, 0
  br i1 %gttmp.not.i, label %ifcont11, label %loopbody.i

ifcont11:                                         ; preds = %ifcont11.i, %loopbody
  %result.1 = phi i32 [ %result.062, %loopbody ], [ %result.1.i, %ifcont11.i ]
  %gttmp36.i33 = icmp sgt i32 %base.164, 0
  br i1 %gttmp36.i33, label %loopbody.i40, label %mulMod.exit55

loopbody.i40:                                     ; preds = %ifcont11, %ifcont11.i49
  %addtmp19.i51.pn = phi i32 [ %addtmp19.i51, %ifcont11.i49 ], [ %base.164, %ifcont11 ]
  %b.038.i42 = phi i32 [ %divtmp35.i53, %ifcont11.i49 ], [ %base.164, %ifcont11 ]
  %result.037.i43 = phi i32 [ %result.1.i50, %ifcont11.i49 ], [ 0, %ifcont11 ]
  %a.139.i41 = srem i32 %addtmp19.i51.pn, %2
  %modtmp8.i44 = and i32 %b.038.i42, 1
  %eqtmp.not.i45 = icmp eq i32 %modtmp8.i44, 0
  br i1 %eqtmp.not.i45, label %ifcont11.i49, label %then9.i46

then9.i46:                                        ; preds = %loopbody.i40
  %addtmp14.i47 = add i32 %a.139.i41, %result.037.i43
  %modtmp16.i48 = srem i32 %addtmp14.i47, %2
  br label %ifcont11.i49

ifcont11.i49:                                     ; preds = %then9.i46, %loopbody.i40
  %result.1.i50 = phi i32 [ %modtmp16.i48, %then9.i46 ], [ %result.037.i43, %loopbody.i40 ]
  %addtmp19.i51 = shl i32 %a.139.i41, 1
  %divtmp35.i53 = lshr i32 %b.038.i42, 1
  %gttmp.not.i54 = icmp eq i32 %divtmp35.i53, 0
  br i1 %gttmp.not.i54, label %mulMod.exit55, label %loopbody.i40

mulMod.exit55:                                    ; preds = %ifcont11.i49, %then9, %ifcont11
  %result.159 = phi i32 [ %result.1, %ifcont11 ], [ 0, %then9 ], [ %result.1, %ifcont11.i49 ]
  %result.0.lcssa.i34 = phi i32 [ 0, %ifcont11 ], [ 0, %then9 ], [ %result.1.i50, %ifcont11.i49 ]
  %divtmp3260 = lshr i32 %exp.063, 1
  %gttmp.not = icmp eq i32 %divtmp3260, 0
  br i1 %gttmp.not, label %loopexit, label %loopbody
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -2147483648, 2147483647) i32 @discreteLog(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
entry:
  %lttmp14 = icmp sgt i32 %2, 0
  br i1 %lttmp14, label %loopbody.lr.ph, label %common.ret

loopbody.lr.ph:                                   ; preds = %entry
  %gttmp36.i = icmp sgt i32 %0, 0
  br i1 %gttmp36.i, label %loopbody.us, label %loopbody.preheader

loopbody.preheader:                               ; preds = %loopbody.lr.ph
  %eqtmp.peel = icmp eq i32 %1, 1
  br i1 %eqtmp.peel, label %common.ret, label %ifcont.peel

ifcont.peel:                                      ; preds = %loopbody.preheader
  %lttmp.peel.not = icmp eq i32 %2, 1
  br i1 %lttmp.peel.not, label %common.ret, label %loopbody.peel.next

loopbody.peel.next:                               ; preds = %ifcont.peel
  %eqtmp = icmp eq i32 %1, 0
  br label %loopbody

loopbody.us:                                      ; preds = %loopbody.lr.ph, %mulMod.exit.loopexit.us
  %x.016.us = phi i32 [ %addtmp.us, %mulMod.exit.loopexit.us ], [ 0, %loopbody.lr.ph ]
  %value.015.us = phi i32 [ %result.1.i.us, %mulMod.exit.loopexit.us ], [ 1, %loopbody.lr.ph ]
  %eqtmp.us = icmp eq i32 %value.015.us, %1
  br i1 %eqtmp.us, label %common.ret, label %ifcont.us

ifcont.us:                                        ; preds = %loopbody.us
  %modtmp.i.us = srem i32 %value.015.us, %2
  %lttmp.i.us = icmp slt i32 %modtmp.i.us, 0
  %addtmp.i.us = select i1 %lttmp.i.us, i32 %2, i32 0
  %spec.select.i.us = add i32 %addtmp.i.us, %modtmp.i.us
  br label %loopbody.i.us

loopbody.i.us:                                    ; preds = %ifcont11.i.us, %ifcont.us
  %a.139.i.us = phi i32 [ %modtmp21.i.us, %ifcont11.i.us ], [ %spec.select.i.us, %ifcont.us ]
  %b.038.i.us = phi i32 [ %divtmp35.i.us, %ifcont11.i.us ], [ %0, %ifcont.us ]
  %result.037.i.us = phi i32 [ %result.1.i.us, %ifcont11.i.us ], [ 0, %ifcont.us ]
  %modtmp8.i.us = and i32 %b.038.i.us, 1
  %eqtmp.not.i.us = icmp eq i32 %modtmp8.i.us, 0
  br i1 %eqtmp.not.i.us, label %ifcont11.i.us, label %then9.i.us

then9.i.us:                                       ; preds = %loopbody.i.us
  %addtmp14.i.us = add i32 %result.037.i.us, %a.139.i.us
  %modtmp16.i.us = srem i32 %addtmp14.i.us, %2
  br label %ifcont11.i.us

ifcont11.i.us:                                    ; preds = %then9.i.us, %loopbody.i.us
  %result.1.i.us = phi i32 [ %modtmp16.i.us, %then9.i.us ], [ %result.037.i.us, %loopbody.i.us ]
  %addtmp19.i.us = shl i32 %a.139.i.us, 1
  %modtmp21.i.us = srem i32 %addtmp19.i.us, %2
  %divtmp35.i.us = lshr i32 %b.038.i.us, 1
  %gttmp.not.i.us = icmp eq i32 %divtmp35.i.us, 0
  br i1 %gttmp.not.i.us, label %mulMod.exit.loopexit.us, label %loopbody.i.us

mulMod.exit.loopexit.us:                          ; preds = %ifcont11.i.us
  %addtmp.us = add nuw nsw i32 %x.016.us, 1
  %lttmp.us = icmp slt i32 %addtmp.us, %2
  br i1 %lttmp.us, label %loopbody.us, label %common.ret

loopbody:                                         ; preds = %loopbody.peel.next, %ifcont
  %x.016 = phi i32 [ %addtmp, %ifcont ], [ 1, %loopbody.peel.next ]
  br i1 %eqtmp, label %common.ret, label %ifcont

common.ret:                                       ; preds = %ifcont, %loopbody, %mulMod.exit.loopexit.us, %loopbody.us, %loopbody.preheader, %ifcont.peel, %entry
  %common.ret.op = phi i32 [ -1, %ifcont.peel ], [ -1, %entry ], [ %x.016.us, %loopbody.us ], [ 0, %loopbody.preheader ], [ -1, %mulMod.exit.loopexit.us ], [ -1, %ifcont ], [ %x.016, %loopbody ]
  ret i32 %common.ret.op

ifcont:                                           ; preds = %loopbody
  %addtmp = add nuw nsw i32 %x.016, 1
  %lttmp = icmp slt i32 %addtmp, %2
  br i1 %lttmp, label %loopbody, label %common.ret, !llvm.loop !0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000002, 1000003) i32 @dlogStress() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader

loopbody.i.preheader:                             ; preds = %entry, %discreteLog.exit
  %i.023 = phi i32 [ 1, %entry ], [ %addtmp14, %discreteLog.exit ]
  %sum.022 = phi i32 [ 0, %entry ], [ %modtmp, %discreteLog.exit ]
  br label %loopbody.i

loopbody.i:                                       ; preds = %loopbody.i.preheader, %mulMod.exit55.i
  %base.164.i = phi i32 [ %result.0.lcssa.i34.i, %mulMod.exit55.i ], [ 2, %loopbody.i.preheader ]
  %exp.063.i = phi i32 [ %divtmp3260.i, %mulMod.exit55.i ], [ %i.023, %loopbody.i.preheader ]
  %result.062.i = phi i32 [ %result.159.i, %mulMod.exit55.i ], [ 1, %loopbody.i.preheader ]
  %modtmp8.i = and i32 %exp.063.i, 1
  %eqtmp.not.i = icmp eq i32 %modtmp8.i, 0
  br i1 %eqtmp.not.i, label %ifcont11.i, label %then9.i

then9.i:                                          ; preds = %loopbody.i
  %gttmp36.i.i = icmp sgt i32 %base.164.i, 0
  br i1 %gttmp36.i.i, label %loopbody.preheader.i.i, label %mulMod.exit55.i

loopbody.preheader.i.i:                           ; preds = %then9.i
  %modtmp.i.i = srem i32 %result.062.i, 1000003
  %lttmp.i.i = icmp slt i32 %modtmp.i.i, 0
  %addtmp.i.i = select i1 %lttmp.i.i, i32 1000003, i32 0
  %spec.select.i.i = add nsw i32 %addtmp.i.i, %modtmp.i.i
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %ifcont11.i.i, %loopbody.preheader.i.i
  %a.139.i.i = phi i32 [ %modtmp21.i.i, %ifcont11.i.i ], [ %spec.select.i.i, %loopbody.preheader.i.i ]
  %b.038.i.i = phi i32 [ %divtmp35.i.i, %ifcont11.i.i ], [ %base.164.i, %loopbody.preheader.i.i ]
  %result.037.i.i = phi i32 [ %result.1.i.i, %ifcont11.i.i ], [ 0, %loopbody.preheader.i.i ]
  %modtmp8.i.i = and i32 %b.038.i.i, 1
  %eqtmp.not.i.i = icmp eq i32 %modtmp8.i.i, 0
  br i1 %eqtmp.not.i.i, label %ifcont11.i.i, label %then9.i.i

then9.i.i:                                        ; preds = %loopbody.i.i
  %addtmp14.i.i = add i32 %result.037.i.i, %a.139.i.i
  %modtmp16.i.i = srem i32 %addtmp14.i.i, 1000003
  br label %ifcont11.i.i

ifcont11.i.i:                                     ; preds = %then9.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %modtmp16.i.i, %then9.i.i ], [ %result.037.i.i, %loopbody.i.i ]
  %addtmp19.i.i = shl nsw i32 %a.139.i.i, 1
  %modtmp21.i.i = srem i32 %addtmp19.i.i, 1000003
  %divtmp35.i.i = lshr i32 %b.038.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp35.i.i, 0
  br i1 %gttmp.not.i.i, label %ifcont11.i, label %loopbody.i.i

ifcont11.i:                                       ; preds = %ifcont11.i.i, %loopbody.i
  %result.1.i = phi i32 [ %result.062.i, %loopbody.i ], [ %result.1.i.i, %ifcont11.i.i ]
  %gttmp36.i33.i = icmp sgt i32 %base.164.i, 0
  br i1 %gttmp36.i33.i, label %loopbody.i40.i, label %mulMod.exit55.i

loopbody.i40.i:                                   ; preds = %ifcont11.i, %ifcont11.i49.i
  %addtmp19.i51.pn.i = phi i32 [ %addtmp19.i51.i, %ifcont11.i49.i ], [ %base.164.i, %ifcont11.i ]
  %b.038.i42.i = phi i32 [ %divtmp35.i53.i, %ifcont11.i49.i ], [ %base.164.i, %ifcont11.i ]
  %result.037.i43.i = phi i32 [ %result.1.i50.i, %ifcont11.i49.i ], [ 0, %ifcont11.i ]
  %a.139.i41.i = srem i32 %addtmp19.i51.pn.i, 1000003
  %modtmp8.i44.i = and i32 %b.038.i42.i, 1
  %eqtmp.not.i45.i = icmp eq i32 %modtmp8.i44.i, 0
  br i1 %eqtmp.not.i45.i, label %ifcont11.i49.i, label %then9.i46.i

then9.i46.i:                                      ; preds = %loopbody.i40.i
  %addtmp14.i47.i = add nsw i32 %result.037.i43.i, %a.139.i41.i
  %modtmp16.i48.i = srem i32 %addtmp14.i47.i, 1000003
  br label %ifcont11.i49.i

ifcont11.i49.i:                                   ; preds = %then9.i46.i, %loopbody.i40.i
  %result.1.i50.i = phi i32 [ %modtmp16.i48.i, %then9.i46.i ], [ %result.037.i43.i, %loopbody.i40.i ]
  %addtmp19.i51.i = shl nsw i32 %a.139.i41.i, 1
  %divtmp35.i53.i = lshr i32 %b.038.i42.i, 1
  %gttmp.not.i54.i = icmp eq i32 %divtmp35.i53.i, 0
  br i1 %gttmp.not.i54.i, label %mulMod.exit55.i, label %loopbody.i40.i

mulMod.exit55.i:                                  ; preds = %ifcont11.i49.i, %ifcont11.i, %then9.i
  %result.159.i = phi i32 [ %result.1.i, %ifcont11.i ], [ 0, %then9.i ], [ %result.1.i, %ifcont11.i49.i ]
  %result.0.lcssa.i34.i = phi i32 [ 0, %ifcont11.i ], [ 0, %then9.i ], [ %result.1.i50.i, %ifcont11.i49.i ]
  %divtmp3260.i = lshr i32 %exp.063.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp3260.i, 0
  br i1 %gttmp.not.i, label %loopbody.us.i, label %loopbody.i

loopbody.us.i:                                    ; preds = %mulMod.exit55.i, %ifcont11.i.us.i.1
  %x.016.us.i = phi i32 [ %addtmp.us.i, %ifcont11.i.us.i.1 ], [ 0, %mulMod.exit55.i ]
  %value.015.us.i = phi i32 [ %modtmp21.i.us.i, %ifcont11.i.us.i.1 ], [ 1, %mulMod.exit55.i ]
  %eqtmp.us.i = icmp eq i32 %value.015.us.i, %result.159.i
  br i1 %eqtmp.us.i, label %discreteLog.exit, label %ifcont11.i.us.i.1

ifcont11.i.us.i.1:                                ; preds = %loopbody.us.i
  %lttmp.i.us.i = icmp slt i32 %value.015.us.i, 0
  %addtmp.i.us.i = select i1 %lttmp.i.us.i, i32 1000003, i32 0
  %spec.select.i.us.i = add nsw i32 %addtmp.i.us.i, %value.015.us.i
  %addtmp19.i.us.i = shl nsw i32 %spec.select.i.us.i, 1
  %modtmp21.i.us.i = srem i32 %addtmp19.i.us.i, 1000003
  %addtmp.us.i = add nuw nsw i32 %x.016.us.i, 1
  %lttmp.us.i = icmp samesign ult i32 %x.016.us.i, 1000002
  br i1 %lttmp.us.i, label %loopbody.us.i, label %discreteLog.exit

discreteLog.exit:                                 ; preds = %loopbody.us.i, %ifcont11.i.us.i.1
  %common.ret.op.i = phi i32 [ -1, %ifcont11.i.us.i.1 ], [ %x.016.us.i, %loopbody.us.i ]
  %addtmp = add i32 %common.ret.op.i, %sum.022
  %modtmp = srem i32 %addtmp, 1000003
  %addtmp14 = add nuw nsw i32 %i.023, 1
  %letmp = icmp samesign ult i32 %i.023, 100000
  br i1 %letmp, label %loopbody.i.preheader, label %loopexit

loopexit:                                         ; preds = %discreteLog.exit
  ret i32 %modtmp
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %discreteLog.exit.i, %entry
  %i.023.i = phi i32 [ 1, %entry ], [ %addtmp14.i, %discreteLog.exit.i ]
  %sum.022.i = phi i32 [ 0, %entry ], [ %modtmp.i, %discreteLog.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit55.i.i, %loopbody.i.preheader.i
  %base.164.i.i = phi i32 [ %result.0.lcssa.i34.i.i, %mulMod.exit55.i.i ], [ 2, %loopbody.i.preheader.i ]
  %exp.063.i.i = phi i32 [ %divtmp3260.i.i, %mulMod.exit55.i.i ], [ %i.023.i, %loopbody.i.preheader.i ]
  %result.062.i.i = phi i32 [ %result.159.i.i, %mulMod.exit55.i.i ], [ 1, %loopbody.i.preheader.i ]
  %modtmp8.i.i = and i32 %exp.063.i.i, 1
  %eqtmp.not.i.i = icmp eq i32 %modtmp8.i.i, 0
  br i1 %eqtmp.not.i.i, label %ifcont11.i.i, label %then9.i.i

then9.i.i:                                        ; preds = %loopbody.i.i
  %gttmp36.i.i.i = icmp sgt i32 %base.164.i.i, 0
  br i1 %gttmp36.i.i.i, label %loopbody.preheader.i.i.i, label %mulMod.exit55.i.i

loopbody.preheader.i.i.i:                         ; preds = %then9.i.i
  %modtmp.i.i.i = srem i32 %result.062.i.i, 1000003
  %lttmp.i.i.i = icmp slt i32 %modtmp.i.i.i, 0
  %addtmp.i.i.i = select i1 %lttmp.i.i.i, i32 1000003, i32 0
  %spec.select.i.i.i = add nsw i32 %addtmp.i.i.i, %modtmp.i.i.i
  br label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %ifcont11.i.i.i, %loopbody.preheader.i.i.i
  %a.139.i.i.i = phi i32 [ %modtmp21.i.i.i, %ifcont11.i.i.i ], [ %spec.select.i.i.i, %loopbody.preheader.i.i.i ]
  %b.038.i.i.i = phi i32 [ %divtmp35.i.i.i, %ifcont11.i.i.i ], [ %base.164.i.i, %loopbody.preheader.i.i.i ]
  %result.037.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont11.i.i.i ], [ 0, %loopbody.preheader.i.i.i ]
  %modtmp8.i.i.i = and i32 %b.038.i.i.i, 1
  %eqtmp.not.i.i.i = icmp eq i32 %modtmp8.i.i.i, 0
  br i1 %eqtmp.not.i.i.i, label %ifcont11.i.i.i, label %then9.i.i.i

then9.i.i.i:                                      ; preds = %loopbody.i.i.i
  %addtmp14.i.i.i = add i32 %result.037.i.i.i, %a.139.i.i.i
  %modtmp16.i.i.i = srem i32 %addtmp14.i.i.i, 1000003
  br label %ifcont11.i.i.i

ifcont11.i.i.i:                                   ; preds = %then9.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp16.i.i.i, %then9.i.i.i ], [ %result.037.i.i.i, %loopbody.i.i.i ]
  %addtmp19.i.i.i = shl nsw i32 %a.139.i.i.i, 1
  %modtmp21.i.i.i = srem i32 %addtmp19.i.i.i, 1000003
  %divtmp35.i.i.i = lshr i32 %b.038.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp35.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %ifcont11.i.i, label %loopbody.i.i.i

ifcont11.i.i:                                     ; preds = %ifcont11.i.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %result.062.i.i, %loopbody.i.i ], [ %result.1.i.i.i, %ifcont11.i.i.i ]
  %gttmp36.i33.i.i = icmp sgt i32 %base.164.i.i, 0
  br i1 %gttmp36.i33.i.i, label %loopbody.i40.i.i, label %mulMod.exit55.i.i

loopbody.i40.i.i:                                 ; preds = %ifcont11.i.i, %ifcont11.i49.i.i
  %addtmp19.i51.pn.i.i = phi i32 [ %addtmp19.i51.i.i, %ifcont11.i49.i.i ], [ %base.164.i.i, %ifcont11.i.i ]
  %b.038.i42.i.i = phi i32 [ %divtmp35.i53.i.i, %ifcont11.i49.i.i ], [ %base.164.i.i, %ifcont11.i.i ]
  %result.037.i43.i.i = phi i32 [ %result.1.i50.i.i, %ifcont11.i49.i.i ], [ 0, %ifcont11.i.i ]
  %a.139.i41.i.i = srem i32 %addtmp19.i51.pn.i.i, 1000003
  %modtmp8.i44.i.i = and i32 %b.038.i42.i.i, 1
  %eqtmp.not.i45.i.i = icmp eq i32 %modtmp8.i44.i.i, 0
  br i1 %eqtmp.not.i45.i.i, label %ifcont11.i49.i.i, label %then9.i46.i.i

then9.i46.i.i:                                    ; preds = %loopbody.i40.i.i
  %addtmp14.i47.i.i = add nsw i32 %result.037.i43.i.i, %a.139.i41.i.i
  %modtmp16.i48.i.i = srem i32 %addtmp14.i47.i.i, 1000003
  br label %ifcont11.i49.i.i

ifcont11.i49.i.i:                                 ; preds = %then9.i46.i.i, %loopbody.i40.i.i
  %result.1.i50.i.i = phi i32 [ %modtmp16.i48.i.i, %then9.i46.i.i ], [ %result.037.i43.i.i, %loopbody.i40.i.i ]
  %addtmp19.i51.i.i = shl nsw i32 %a.139.i41.i.i, 1
  %divtmp35.i53.i.i = lshr i32 %b.038.i42.i.i, 1
  %gttmp.not.i54.i.i = icmp eq i32 %divtmp35.i53.i.i, 0
  br i1 %gttmp.not.i54.i.i, label %mulMod.exit55.i.i, label %loopbody.i40.i.i

mulMod.exit55.i.i:                                ; preds = %ifcont11.i49.i.i, %ifcont11.i.i, %then9.i.i
  %result.159.i.i = phi i32 [ %result.1.i.i, %ifcont11.i.i ], [ 0, %then9.i.i ], [ %result.1.i.i, %ifcont11.i49.i.i ]
  %result.0.lcssa.i34.i.i = phi i32 [ 0, %ifcont11.i.i ], [ 0, %then9.i.i ], [ %result.1.i50.i.i, %ifcont11.i49.i.i ]
  %divtmp3260.i.i = lshr i32 %exp.063.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp3260.i.i, 0
  br i1 %gttmp.not.i.i, label %loopbody.us.i.i, label %loopbody.i.i

loopbody.us.i.i:                                  ; preds = %mulMod.exit55.i.i, %ifcont11.i.us.i.1.i
  %x.016.us.i.i = phi i32 [ %addtmp.us.i.i, %ifcont11.i.us.i.1.i ], [ 0, %mulMod.exit55.i.i ]
  %value.015.us.i.i = phi i32 [ %modtmp21.i.us.i.i, %ifcont11.i.us.i.1.i ], [ 1, %mulMod.exit55.i.i ]
  %eqtmp.us.i.i = icmp eq i32 %value.015.us.i.i, %result.159.i.i
  br i1 %eqtmp.us.i.i, label %discreteLog.exit.i, label %ifcont11.i.us.i.1.i

ifcont11.i.us.i.1.i:                              ; preds = %loopbody.us.i.i
  %lttmp.i.us.i.i = icmp slt i32 %value.015.us.i.i, 0
  %addtmp.i.us.i.i = select i1 %lttmp.i.us.i.i, i32 1000003, i32 0
  %spec.select.i.us.i.i = add nsw i32 %addtmp.i.us.i.i, %value.015.us.i.i
  %addtmp19.i.us.i.i = shl nsw i32 %spec.select.i.us.i.i, 1
  %modtmp21.i.us.i.i = srem i32 %addtmp19.i.us.i.i, 1000003
  %addtmp.us.i.i = add nuw nsw i32 %x.016.us.i.i, 1
  %lttmp.us.i.i = icmp samesign ult i32 %x.016.us.i.i, 1000002
  br i1 %lttmp.us.i.i, label %loopbody.us.i.i, label %discreteLog.exit.i

discreteLog.exit.i:                               ; preds = %ifcont11.i.us.i.1.i, %loopbody.us.i.i
  %common.ret.op.i.i = phi i32 [ -1, %ifcont11.i.us.i.1.i ], [ %x.016.us.i.i, %loopbody.us.i.i ]
  %addtmp.i = add i32 %common.ret.op.i.i, %sum.022.i
  %modtmp.i = srem i32 %addtmp.i, 1000003
  %addtmp14.i = add nuw nsw i32 %i.023.i, 1
  %letmp.i = icmp samesign ult i32 %i.023.i, 100000
  br i1 %letmp.i, label %loopbody.i.preheader.i, label %dlogStress.exit

dlogStress.exit:                                  ; preds = %discreteLog.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }

!0 = distinct !{!0, !1}
!1 = !{!"llvm.loop.peeled.count", i32 1}
