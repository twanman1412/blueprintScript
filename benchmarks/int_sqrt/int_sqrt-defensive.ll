; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @intSqrt(i32 noundef %0) local_unnamed_addr #0 {
entry:
  %letmp.not31 = icmp slt i32 %0, 0
  br i1 %letmp.not31, label %loopexit, label %loopbody

loopbody:                                         ; preds = %entry, %ifcont
  %result.034 = phi i32 [ %result.1, %ifcont ], [ 0, %entry ]
  %low.033 = phi i32 [ %low.1, %ifcont ], [ 0, %entry ]
  %high.032 = phi i32 [ %high.1, %ifcont ], [ %0, %entry ]
  %subtmp = sub i32 %high.032, %low.033
  %divtmp = sdiv i32 %subtmp, 2
  %addtmp = add i32 %divtmp, %low.033
  %eqtmp = icmp eq i32 %addtmp, 0
  br i1 %eqtmp, label %ifcont, label %else

loopexit:                                         ; preds = %ifcont, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %result.1, %ifcont ]
  ret i32 %result.0.lcssa

else:                                             ; preds = %loopbody
  %divtmp11 = sdiv i32 %0, %addtmp
  %letmp12.not = icmp sgt i32 %addtmp, %divtmp11
  br i1 %letmp12.not, label %else14, label %then13

ifcont:                                           ; preds = %loopbody, %then13, %else14
  %high.1 = phi i32 [ %subtmp20, %else14 ], [ %high.032, %then13 ], [ %high.032, %loopbody ]
  %low.1 = phi i32 [ %low.033, %else14 ], [ %addtmp18, %then13 ], [ 1, %loopbody ]
  %result.1 = phi i32 [ %result.034, %else14 ], [ %addtmp, %then13 ], [ 0, %loopbody ]
  %letmp.not = icmp sgt i32 %low.1, %high.1
  br i1 %letmp.not, label %loopexit, label %loopbody

then13:                                           ; preds = %else
  %addtmp18 = add i32 %addtmp, 1
  br label %ifcont

else14:                                           ; preds = %else
  %subtmp20 = add nsw i32 %addtmp, -1
  br label %ifcont
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @intSqrtStress() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader

loopbody.i.preheader:                             ; preds = %entry, %intSqrt.exit
  %sum.013 = phi i32 [ 0, %entry ], [ %modtmp, %intSqrt.exit ]
  %i.012 = phi i32 [ 0, %entry ], [ %addtmp7, %intSqrt.exit ]
  br label %loopbody.i

loopbody.i:                                       ; preds = %loopbody.i.preheader, %ifcont.i
  %result.034.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %loopbody.i.preheader ]
  %low.033.i = phi i32 [ %low.1.i, %ifcont.i ], [ 0, %loopbody.i.preheader ]
  %high.032.i = phi i32 [ %high.1.i, %ifcont.i ], [ %i.012, %loopbody.i.preheader ]
  %subtmp.i = sub i32 %high.032.i, %low.033.i
  %divtmp.i = sdiv i32 %subtmp.i, 2
  %addtmp.i = add i32 %divtmp.i, %low.033.i
  %eqtmp.i = icmp eq i32 %addtmp.i, 0
  br i1 %eqtmp.i, label %ifcont.i, label %else.i

else.i:                                           ; preds = %loopbody.i
  %divtmp11.i = sdiv i32 %i.012, %addtmp.i
  %letmp12.not.i = icmp sgt i32 %addtmp.i, %divtmp11.i
  br i1 %letmp12.not.i, label %else14.i, label %then13.i

ifcont.i:                                         ; preds = %else14.i, %then13.i, %loopbody.i
  %high.1.i = phi i32 [ %subtmp20.i, %else14.i ], [ %high.032.i, %then13.i ], [ %high.032.i, %loopbody.i ]
  %low.1.i = phi i32 [ %low.033.i, %else14.i ], [ %addtmp18.i, %then13.i ], [ 1, %loopbody.i ]
  %result.1.i = phi i32 [ %result.034.i, %else14.i ], [ %addtmp.i, %then13.i ], [ 0, %loopbody.i ]
  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i
  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i

then13.i:                                         ; preds = %else.i
  %addtmp18.i = add i32 %addtmp.i, 1
  br label %ifcont.i

else14.i:                                         ; preds = %else.i
  %subtmp20.i = add nsw i32 %addtmp.i, -1
  br label %ifcont.i

intSqrt.exit:                                     ; preds = %ifcont.i
  %addtmp = add i32 %result.1.i, %sum.013
  %modtmp = srem i32 %addtmp, 1000000007
  %addtmp7 = add nuw nsw i32 %i.012, 1
  %letmp = icmp samesign ult i32 %i.012, 100000000
  br i1 %letmp, label %loopbody.i.preheader, label %loopexit

loopexit:                                         ; preds = %intSqrt.exit
  ret i32 %modtmp
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %intSqrt.exit.i, %entry
  %sum.013.i = phi i32 [ 0, %entry ], [ %modtmp.i, %intSqrt.exit.i ]
  %i.012.i = phi i32 [ 0, %entry ], [ %addtmp7.i, %intSqrt.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %ifcont.i.i, %loopbody.i.preheader.i
  %result.034.i.i = phi i32 [ %result.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i.preheader.i ]
  %low.033.i.i = phi i32 [ %low.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i.preheader.i ]
  %high.032.i.i = phi i32 [ %high.1.i.i, %ifcont.i.i ], [ %i.012.i, %loopbody.i.preheader.i ]
  %subtmp.i.i = sub i32 %high.032.i.i, %low.033.i.i
  %divtmp.i.i = sdiv i32 %subtmp.i.i, 2
  %addtmp.i.i = add i32 %divtmp.i.i, %low.033.i.i
  %eqtmp.i.i = icmp eq i32 %addtmp.i.i, 0
  br i1 %eqtmp.i.i, label %ifcont.i.i, label %else.i.i

else.i.i:                                         ; preds = %loopbody.i.i
  %divtmp11.i.i = sdiv i32 %i.012.i, %addtmp.i.i
  %letmp12.not.i.i = icmp sgt i32 %addtmp.i.i, %divtmp11.i.i
  br i1 %letmp12.not.i.i, label %else14.i.i, label %then13.i.i

ifcont.i.i:                                       ; preds = %else14.i.i, %then13.i.i, %loopbody.i.i
  %high.1.i.i = phi i32 [ %subtmp20.i.i, %else14.i.i ], [ %high.032.i.i, %then13.i.i ], [ %high.032.i.i, %loopbody.i.i ]
  %low.1.i.i = phi i32 [ %low.033.i.i, %else14.i.i ], [ %addtmp18.i.i, %then13.i.i ], [ 1, %loopbody.i.i ]
  %result.1.i.i = phi i32 [ %result.034.i.i, %else14.i.i ], [ %addtmp.i.i, %then13.i.i ], [ 0, %loopbody.i.i ]
  %letmp.not.i.i = icmp sgt i32 %low.1.i.i, %high.1.i.i
  br i1 %letmp.not.i.i, label %intSqrt.exit.i, label %loopbody.i.i

then13.i.i:                                       ; preds = %else.i.i
  %addtmp18.i.i = add i32 %addtmp.i.i, 1
  br label %ifcont.i.i

else14.i.i:                                       ; preds = %else.i.i
  %subtmp20.i.i = add nsw i32 %addtmp.i.i, -1
  br label %ifcont.i.i

intSqrt.exit.i:                                   ; preds = %ifcont.i.i
  %addtmp.i = add i32 %result.1.i.i, %sum.013.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp7.i = add nuw nsw i32 %i.012.i, 1
  %letmp.i = icmp samesign ult i32 %i.012.i, 100000000
  br i1 %letmp.i, label %loopbody.i.preheader.i, label %intSqrtStress.exit

intSqrtStress.exit:                               ; preds = %intSqrt.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
