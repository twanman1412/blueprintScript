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

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %ifcont.i, %entry
  %result.034.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %entry ]
  %low.033.i = phi i32 [ %low.1.i, %ifcont.i ], [ 0, %entry ]
  %high.032.i = phi i32 [ %high.1.i, %ifcont.i ], [ 70, %entry ]
  %subtmp.i = sub i32 %high.032.i, %low.033.i
  %divtmp.i = sdiv i32 %subtmp.i, 2
  %addtmp.i = add i32 %divtmp.i, %low.033.i
  %eqtmp.i = icmp eq i32 %addtmp.i, 0
  br i1 %eqtmp.i, label %ifcont.i, label %else.i

else.i:                                           ; preds = %loopbody.i
  %divtmp11.i = sdiv i32 70, %addtmp.i
  %letmp12.not.i = icmp sgt i32 %addtmp.i, %divtmp11.i
  br i1 %letmp12.not.i, label %else14.i, label %then13.i

ifcont.i:                                         ; preds = %else14.i, %then13.i, %loopbody.i
  %high.1.i = phi i32 [ %subtmp20.i, %else14.i ], [ %high.032.i, %then13.i ], [ %high.032.i, %loopbody.i ]
  %low.1.i = phi i32 [ %low.033.i, %else14.i ], [ %addtmp18.i, %then13.i ], [ 1, %loopbody.i ]
  %result.1.i = phi i32 [ %result.034.i, %else14.i ], [ %addtmp.i, %then13.i ], [ 0, %loopbody.i ]
  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i
  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i

then13.i:                                         ; preds = %else.i
  %addtmp18.i = add nsw i32 %addtmp.i, 1
  br label %ifcont.i

else14.i:                                         ; preds = %else.i
  %subtmp20.i = add nsw i32 %addtmp.i, -1
  br label %ifcont.i

intSqrt.exit:                                     ; preds = %ifcont.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %result.1.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
