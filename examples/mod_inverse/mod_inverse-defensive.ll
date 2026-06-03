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
define noundef i32 @modInverse(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
entry:
  %subtmp = add i32 %1, -2
  %gttmp61.i = icmp sgt i32 %subtmp, 0
  br i1 %gttmp61.i, label %loopbody.preheader.i, label %modExp.exit

loopbody.preheader.i:                             ; preds = %entry
  %modtmp.i = srem i32 %0, %1
  %lttmp.i = icmp slt i32 %modtmp.i, 0
  %addtmp.i = select i1 %lttmp.i, i32 %1, i32 0
  %spec.select.i = add i32 %addtmp.i, %modtmp.i
  br label %loopbody.i

loopbody.i:                                       ; preds = %mulMod.exit55.i, %loopbody.preheader.i
  %base.164.i = phi i32 [ %result.0.lcssa.i34.i, %mulMod.exit55.i ], [ %spec.select.i, %loopbody.preheader.i ]
  %exp.063.i = phi i32 [ %divtmp3260.i, %mulMod.exit55.i ], [ %subtmp, %loopbody.preheader.i ]
  %result.062.i = phi i32 [ %result.159.i, %mulMod.exit55.i ], [ 1, %loopbody.preheader.i ]
  %modtmp8.i = and i32 %exp.063.i, 1
  %eqtmp.not.i = icmp eq i32 %modtmp8.i, 0
  br i1 %eqtmp.not.i, label %ifcont11.i, label %then9.i

then9.i:                                          ; preds = %loopbody.i
  %gttmp36.i.i = icmp sgt i32 %base.164.i, 0
  br i1 %gttmp36.i.i, label %loopbody.preheader.i.i, label %mulMod.exit55.i

loopbody.preheader.i.i:                           ; preds = %then9.i
  %modtmp.i.i = srem i32 %result.062.i, %1
  %lttmp.i.i = icmp slt i32 %modtmp.i.i, 0
  %addtmp.i.i = select i1 %lttmp.i.i, i32 %1, i32 0
  %spec.select.i.i = add i32 %addtmp.i.i, %modtmp.i.i
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
  %modtmp16.i.i = srem i32 %addtmp14.i.i, %1
  br label %ifcont11.i.i

ifcont11.i.i:                                     ; preds = %then9.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %modtmp16.i.i, %then9.i.i ], [ %result.037.i.i, %loopbody.i.i ]
  %addtmp19.i.i = shl i32 %a.139.i.i, 1
  %modtmp21.i.i = srem i32 %addtmp19.i.i, %1
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
  %a.139.i41.i = srem i32 %addtmp19.i51.pn.i, %1
  %modtmp8.i44.i = and i32 %b.038.i42.i, 1
  %eqtmp.not.i45.i = icmp eq i32 %modtmp8.i44.i, 0
  br i1 %eqtmp.not.i45.i, label %ifcont11.i49.i, label %then9.i46.i

then9.i46.i:                                      ; preds = %loopbody.i40.i
  %addtmp14.i47.i = add i32 %a.139.i41.i, %result.037.i43.i
  %modtmp16.i48.i = srem i32 %addtmp14.i47.i, %1
  br label %ifcont11.i49.i

ifcont11.i49.i:                                   ; preds = %then9.i46.i, %loopbody.i40.i
  %result.1.i50.i = phi i32 [ %modtmp16.i48.i, %then9.i46.i ], [ %result.037.i43.i, %loopbody.i40.i ]
  %addtmp19.i51.i = shl i32 %a.139.i41.i, 1
  %divtmp35.i53.i = lshr i32 %b.038.i42.i, 1
  %gttmp.not.i54.i = icmp eq i32 %divtmp35.i53.i, 0
  br i1 %gttmp.not.i54.i, label %mulMod.exit55.i, label %loopbody.i40.i

mulMod.exit55.i:                                  ; preds = %ifcont11.i49.i, %ifcont11.i, %then9.i
  %result.159.i = phi i32 [ %result.1.i, %ifcont11.i ], [ 0, %then9.i ], [ %result.1.i, %ifcont11.i49.i ]
  %result.0.lcssa.i34.i = phi i32 [ 0, %ifcont11.i ], [ 0, %then9.i ], [ %result.1.i50.i, %ifcont11.i49.i ]
  %divtmp3260.i = lshr i32 %exp.063.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp3260.i, 0
  br i1 %gttmp.not.i, label %modExp.exit, label %loopbody.i

modExp.exit:                                      ; preds = %mulMod.exit55.i, %entry
  %result.0.lcssa.i = phi i32 [ 1, %entry ], [ %result.159.i, %mulMod.exit55.i ]
  ret i32 %result.0.lcssa.i
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
loopbody.i40.i.i.preheader.1:
  br label %loopbody.i40.i.i.2

loopbody.i40.i.i.2:                               ; preds = %loopbody.i40.i.i.preheader.1, %ifcont11.i49.i.i.2
  %addtmp19.i51.pn.i.i.2 = phi i32 [ %addtmp19.i51.i.i.2, %ifcont11.i49.i.i.2 ], [ 4, %loopbody.i40.i.i.preheader.1 ]
  %b.038.i42.i.i.2 = phi i32 [ %divtmp35.i53.i.i.2, %ifcont11.i49.i.i.2 ], [ 4, %loopbody.i40.i.i.preheader.1 ]
  %result.037.i43.i.i.2 = phi i32 [ %result.1.i50.i.i.2, %ifcont11.i49.i.i.2 ], [ 0, %loopbody.i40.i.i.preheader.1 ]
  %a.139.i41.i.i.2 = urem i32 %addtmp19.i51.pn.i.i.2, 11
  %modtmp8.i44.i.i.2 = and i32 %b.038.i42.i.i.2, 1
  %eqtmp.not.i45.i.i.2 = icmp eq i32 %modtmp8.i44.i.i.2, 0
  br i1 %eqtmp.not.i45.i.i.2, label %ifcont11.i49.i.i.2, label %then9.i46.i.i.2

then9.i46.i.i.2:                                  ; preds = %loopbody.i40.i.i.2
  %addtmp14.i47.i.i.2 = add nuw nsw i32 %result.037.i43.i.i.2, %a.139.i41.i.i.2
  %modtmp16.i48.i.i.2 = urem i32 %addtmp14.i47.i.i.2, 11
  br label %ifcont11.i49.i.i.2

ifcont11.i49.i.i.2:                               ; preds = %then9.i46.i.i.2, %loopbody.i40.i.i.2
  %result.1.i50.i.i.2 = phi i32 [ %modtmp16.i48.i.i.2, %then9.i46.i.i.2 ], [ %result.037.i43.i.i.2, %loopbody.i40.i.i.2 ]
  %addtmp19.i51.i.i.2 = shl nuw nsw i32 %a.139.i41.i.i.2, 1
  %divtmp35.i53.i.i.2 = lshr i32 %b.038.i42.i.i.2, 1
  %gttmp.not.i54.i.i.2 = icmp eq i32 %divtmp35.i53.i.i.2, 0
  br i1 %gttmp.not.i54.i.i.2, label %then9.i.i.3, label %loopbody.i40.i.i.2

then9.i.i.3:                                      ; preds = %ifcont11.i49.i.i.2
  %gttmp36.i.i.i.3.not = icmp eq i32 %result.1.i50.i.i.2, 0
  br i1 %gttmp36.i.i.i.3.not, label %mulMod.exit55.i.i.3, label %loopbody.i.i.i.3

loopbody.i.i.i.3:                                 ; preds = %then9.i.i.3, %ifcont11.i.i.i.3
  %a.139.i.i.i.3 = phi i32 [ %modtmp21.i.i.i.3, %ifcont11.i.i.i.3 ], [ 3, %then9.i.i.3 ]
  %b.038.i.i.i.3 = phi i32 [ %divtmp35.i.i.i.3, %ifcont11.i.i.i.3 ], [ %result.1.i50.i.i.2, %then9.i.i.3 ]
  %result.037.i.i.i.3 = phi i32 [ %result.1.i.i.i.3, %ifcont11.i.i.i.3 ], [ 0, %then9.i.i.3 ]
  %modtmp8.i.i.i.3 = and i32 %b.038.i.i.i.3, 1
  %eqtmp.not.i.i.i.3 = icmp eq i32 %modtmp8.i.i.i.3, 0
  br i1 %eqtmp.not.i.i.i.3, label %ifcont11.i.i.i.3, label %then9.i.i.i.3

then9.i.i.i.3:                                    ; preds = %loopbody.i.i.i.3
  %addtmp14.i.i.i.3 = add i32 %result.037.i.i.i.3, %a.139.i.i.i.3
  %modtmp16.i.i.i.3 = srem i32 %addtmp14.i.i.i.3, 11
  br label %ifcont11.i.i.i.3

ifcont11.i.i.i.3:                                 ; preds = %then9.i.i.i.3, %loopbody.i.i.i.3
  %result.1.i.i.i.3 = phi i32 [ %modtmp16.i.i.i.3, %then9.i.i.i.3 ], [ %result.037.i.i.i.3, %loopbody.i.i.i.3 ]
  %addtmp19.i.i.i.3 = shl nuw nsw i32 %a.139.i.i.i.3, 1
  %modtmp21.i.i.i.3 = urem i32 %addtmp19.i.i.i.3, 11
  %divtmp35.i.i.i.3 = lshr i32 %b.038.i.i.i.3, 1
  %gttmp.not.i.i.i.3 = icmp eq i32 %divtmp35.i.i.i.3, 0
  br i1 %gttmp.not.i.i.i.3, label %mulMod.exit55.i.i.3, label %loopbody.i.i.i.3

mulMod.exit55.i.i.3:                              ; preds = %ifcont11.i.i.i.3, %then9.i.i.3
  %result.159.i.i.3 = phi i32 [ 0, %then9.i.i.3 ], [ %result.1.i.i.i.3, %ifcont11.i.i.i.3 ]
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %result.159.i.i.3)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
