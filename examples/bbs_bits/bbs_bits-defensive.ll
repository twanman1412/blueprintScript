; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @mulMod(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
entry:
  %gttmp27 = icmp sgt i32 %1, 0
  br i1 %gttmp27, label %loopbody, label %loopexit

loopbody:                                         ; preds = %entry, %ifcont
  %addtmp12.pn = phi i32 [ %addtmp12, %ifcont ], [ %0, %entry ]
  %b.029 = phi i32 [ %divtmp25, %ifcont ], [ %1, %entry ]
  %result.028 = phi i32 [ %result.1, %ifcont ], [ 0, %entry ]
  %a.030 = srem i32 %addtmp12.pn, %2
  %modtmp5 = and i32 %b.029, 1
  %eqtmp.not = icmp eq i32 %modtmp5, 0
  br i1 %eqtmp.not, label %ifcont, label %then

loopexit:                                         ; preds = %ifcont, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %result.1, %ifcont ]
  ret i32 %result.0.lcssa

then:                                             ; preds = %loopbody
  %addtmp = add i32 %a.030, %result.028
  %modtmp9 = srem i32 %addtmp, %2
  br label %ifcont

ifcont:                                           ; preds = %loopbody, %then
  %result.1 = phi i32 [ %modtmp9, %then ], [ %result.028, %loopbody ]
  %addtmp12 = shl i32 %a.030, 1
  %divtmp25 = lshr i32 %b.029, 1
  %gttmp.not = icmp eq i32 %divtmp25, 0
  br i1 %gttmp.not, label %loopexit, label %loopbody
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @bbsBits(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
entry:
  %lttmp830 = icmp sgt i32 %2, 0
  br i1 %lttmp830, label %loopbody.preheader, label %loopexit

loopbody.preheader:                               ; preds = %entry
  %modtmp = srem i32 %0, %1
  %lttmp = icmp slt i32 %modtmp, 0
  %addtmp = select i1 %lttmp, i32 %1, i32 0
  %spec.select = add i32 %addtmp, %modtmp
  br label %loopbody

loopbody:                                         ; preds = %loopbody.preheader, %mulMod.exit
  %seed.133 = phi i32 [ %result.0.lcssa.i, %mulMod.exit ], [ %spec.select, %loopbody.preheader ]
  %i.032 = phi i32 [ %addtmp19, %mulMod.exit ], [ 0, %loopbody.preheader ]
  %result.031 = phi i32 [ %modtmp17, %mulMod.exit ], [ 0, %loopbody.preheader ]
  %gttmp27.i = icmp sgt i32 %seed.133, 0
  br i1 %gttmp27.i, label %loopbody.i, label %mulMod.exit

loopbody.i:                                       ; preds = %loopbody, %ifcont.i
  %addtmp12.pn.i = phi i32 [ %addtmp12.i, %ifcont.i ], [ %seed.133, %loopbody ]
  %b.029.i = phi i32 [ %divtmp25.i, %ifcont.i ], [ %seed.133, %loopbody ]
  %result.028.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %loopbody ]
  %a.030.i = srem i32 %addtmp12.pn.i, %1
  %modtmp5.i = and i32 %b.029.i, 1
  %eqtmp.not.i = icmp eq i32 %modtmp5.i, 0
  br i1 %eqtmp.not.i, label %ifcont.i, label %then.i

then.i:                                           ; preds = %loopbody.i
  %addtmp.i = add i32 %a.030.i, %result.028.i
  %modtmp9.i = srem i32 %addtmp.i, %1
  br label %ifcont.i

ifcont.i:                                         ; preds = %then.i, %loopbody.i
  %result.1.i = phi i32 [ %modtmp9.i, %then.i ], [ %result.028.i, %loopbody.i ]
  %addtmp12.i = shl i32 %a.030.i, 1
  %divtmp25.i = lshr i32 %b.029.i, 1
  %gttmp.not.i = icmp eq i32 %divtmp25.i, 0
  br i1 %gttmp.not.i, label %mulMod.exit, label %loopbody.i

mulMod.exit:                                      ; preds = %ifcont.i, %loopbody
  %result.0.lcssa.i = phi i32 [ 0, %loopbody ], [ %result.1.i, %ifcont.i ]
  %modtmp14 = srem i32 %result.0.lcssa.i, 2
  %addtmp15 = add nsw i32 %modtmp14, %result.031
  %modtmp17 = srem i32 %addtmp15, 1000000007
  %addtmp19 = add nuw nsw i32 %i.032, 1
  %lttmp8 = icmp slt i32 %addtmp19, %2
  br i1 %lttmp8, label %loopbody, label %loopexit

loopexit:                                         ; preds = %mulMod.exit, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %modtmp17, %mulMod.exit ]
  ret i32 %result.0.lcssa
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @bbsStress() local_unnamed_addr #0 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %mulMod.exit.i, %entry
  %seed.133.i = phi i32 [ %result.0.lcssa.i.i, %mulMod.exit.i ], [ 456420, %entry ]
  %i.032.i = phi i32 [ %addtmp19.i, %mulMod.exit.i ], [ 0, %entry ]
  %result.031.i = phi i32 [ %modtmp17.i, %mulMod.exit.i ], [ 0, %entry ]
  %gttmp27.i.i = icmp sgt i32 %seed.133.i, 0
  br i1 %gttmp27.i.i, label %loopbody.i.i, label %mulMod.exit.i

loopbody.i.i:                                     ; preds = %loopbody.i, %ifcont.i.i
  %addtmp12.pn.i.i = phi i32 [ %addtmp12.i.i, %ifcont.i.i ], [ %seed.133.i, %loopbody.i ]
  %b.029.i.i = phi i32 [ %divtmp25.i.i, %ifcont.i.i ], [ %seed.133.i, %loopbody.i ]
  %result.028.i.i = phi i32 [ %result.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i ]
  %a.030.i.i = srem i32 %addtmp12.pn.i.i, 1000003
  %modtmp5.i.i = and i32 %b.029.i.i, 1
  %eqtmp.not.i.i = icmp eq i32 %modtmp5.i.i, 0
  br i1 %eqtmp.not.i.i, label %ifcont.i.i, label %then.i.i

then.i.i:                                         ; preds = %loopbody.i.i
  %addtmp.i.i = add nsw i32 %result.028.i.i, %a.030.i.i
  %modtmp9.i.i = srem i32 %addtmp.i.i, 1000003
  br label %ifcont.i.i

ifcont.i.i:                                       ; preds = %then.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %modtmp9.i.i, %then.i.i ], [ %result.028.i.i, %loopbody.i.i ]
  %addtmp12.i.i = shl nsw i32 %a.030.i.i, 1
  %divtmp25.i.i = lshr i32 %b.029.i.i, 1
  %gttmp.not.i.i = icmp eq i32 %divtmp25.i.i, 0
  br i1 %gttmp.not.i.i, label %mulMod.exit.i, label %loopbody.i.i

mulMod.exit.i:                                    ; preds = %ifcont.i.i, %loopbody.i
  %result.0.lcssa.i.i = phi i32 [ 0, %loopbody.i ], [ %result.1.i.i, %ifcont.i.i ]
  %modtmp14.i = srem i32 %result.0.lcssa.i.i, 2
  %addtmp15.i = add nsw i32 %modtmp14.i, %result.031.i
  %modtmp17.i = srem i32 %addtmp15.i, 1000000007
  %addtmp19.i = add nuw nsw i32 %i.032.i, 1
  %lttmp8.i = icmp samesign ult i32 %i.032.i, 199999999
  br i1 %lttmp8.i, label %loopbody.i, label %bbsBits.exit

bbsBits.exit:                                     ; preds = %mulMod.exit.i
  ret i32 %modtmp17.i
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit.i.i, %entry
  %seed.133.i.i = phi i32 [ %result.0.lcssa.i.i.i, %mulMod.exit.i.i ], [ 456420, %entry ]
  %i.032.i.i = phi i32 [ %addtmp19.i.i, %mulMod.exit.i.i ], [ 0, %entry ]
  %result.031.i.i = phi i32 [ %modtmp17.i.i, %mulMod.exit.i.i ], [ 0, %entry ]
  %gttmp27.i.i.i = icmp sgt i32 %seed.133.i.i, 0
  br i1 %gttmp27.i.i.i, label %loopbody.i.i.i, label %mulMod.exit.i.i

loopbody.i.i.i:                                   ; preds = %loopbody.i.i, %ifcont.i.i.i
  %addtmp12.pn.i.i.i = phi i32 [ %addtmp12.i.i.i, %ifcont.i.i.i ], [ %seed.133.i.i, %loopbody.i.i ]
  %b.029.i.i.i = phi i32 [ %divtmp25.i.i.i, %ifcont.i.i.i ], [ %seed.133.i.i, %loopbody.i.i ]
  %result.028.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont.i.i.i ], [ 0, %loopbody.i.i ]
  %a.030.i.i.i = srem i32 %addtmp12.pn.i.i.i, 1000003
  %modtmp5.i.i.i = and i32 %b.029.i.i.i, 1
  %eqtmp.not.i.i.i = icmp eq i32 %modtmp5.i.i.i, 0
  br i1 %eqtmp.not.i.i.i, label %ifcont.i.i.i, label %then.i.i.i

then.i.i.i:                                       ; preds = %loopbody.i.i.i
  %addtmp.i.i.i = add nsw i32 %result.028.i.i.i, %a.030.i.i.i
  %modtmp9.i.i.i = srem i32 %addtmp.i.i.i, 1000003
  br label %ifcont.i.i.i

ifcont.i.i.i:                                     ; preds = %then.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp9.i.i.i, %then.i.i.i ], [ %result.028.i.i.i, %loopbody.i.i.i ]
  %addtmp12.i.i.i = shl nsw i32 %a.030.i.i.i, 1
  %divtmp25.i.i.i = lshr i32 %b.029.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp25.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %mulMod.exit.i.i, label %loopbody.i.i.i

mulMod.exit.i.i:                                  ; preds = %ifcont.i.i.i, %loopbody.i.i
  %result.0.lcssa.i.i.i = phi i32 [ 0, %loopbody.i.i ], [ %result.1.i.i.i, %ifcont.i.i.i ]
  %modtmp14.i.i = srem i32 %result.0.lcssa.i.i.i, 2
  %addtmp15.i.i = add nsw i32 %modtmp14.i.i, %result.031.i.i
  %modtmp17.i.i = srem i32 %addtmp15.i.i, 1000000007
  %addtmp19.i.i = add nuw nsw i32 %i.032.i.i, 1
  %lttmp8.i.i = icmp samesign ult i32 %i.032.i.i, 199999999
  br i1 %lttmp8.i.i, label %loopbody.i.i, label %bbsStress.exit

bbsStress.exit:                                   ; preds = %mulMod.exit.i.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp17.i.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
