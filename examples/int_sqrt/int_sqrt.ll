; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 0, -2147483648) i32 @intSqrt(i32 noundef range(i32 0, -2147483648) %0) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %0, 0
  br i1 %eqtmp, label %common.ret, label %loopbody

common.ret:                                       ; preds = %ifcont, %entry
  %common.ret.op = phi i32 [ 0, %entry ], [ %result.1, %ifcont ]
  ret i32 %common.ret.op

loopbody:                                         ; preds = %entry, %ifcont
  %result.036 = phi i32 [ %result.1, %ifcont ], [ 0, %entry ]
  %low.035 = phi i32 [ %low.1, %ifcont ], [ 0, %entry ]
  %high.034 = phi i32 [ %high.1, %ifcont ], [ %0, %entry ]
  %subtmp = sub i32 %high.034, %low.035
  %divtmp = sdiv i32 %subtmp, 2
  %addtmp = add i32 %divtmp, %low.035
  %eqtmp9 = icmp eq i32 %addtmp, 0
  br i1 %eqtmp9, label %ifcont, label %else

else:                                             ; preds = %loopbody
  %divtmp13 = sdiv i32 %0, %addtmp
  %letmp14.not = icmp sgt i32 %addtmp, %divtmp13
  br i1 %letmp14.not, label %else16, label %then15

ifcont:                                           ; preds = %loopbody, %then15, %else16
  %high.1 = phi i32 [ %subtmp22, %else16 ], [ %high.034, %then15 ], [ %high.034, %loopbody ]
  %low.1 = phi i32 [ %low.035, %else16 ], [ %addtmp20, %then15 ], [ 1, %loopbody ]
  %result.1 = phi i32 [ %result.036, %else16 ], [ %addtmp, %then15 ], [ 0, %loopbody ]
  %letmp.not = icmp sgt i32 %low.1, %high.1
  br i1 %letmp.not, label %common.ret, label %loopbody

then15:                                           ; preds = %else
  %addtmp20 = add i32 %addtmp, 1
  br label %ifcont

else16:                                           ; preds = %else
  %subtmp22 = add nsw i32 %addtmp, -1
  br label %ifcont
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %ifcont.i, %entry
  %result.036.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %entry ]
  %low.035.i = phi i32 [ %low.1.i, %ifcont.i ], [ 0, %entry ]
  %high.034.i = phi i32 [ %high.1.i, %ifcont.i ], [ 70, %entry ]
  %subtmp.i = sub i32 %high.034.i, %low.035.i
  %divtmp.i = sdiv i32 %subtmp.i, 2
  %addtmp.i = add i32 %divtmp.i, %low.035.i
  %eqtmp9.i = icmp eq i32 %addtmp.i, 0
  br i1 %eqtmp9.i, label %ifcont.i, label %else.i

else.i:                                           ; preds = %loopbody.i
  %divtmp13.i = sdiv i32 70, %addtmp.i
  %letmp14.not.i = icmp sgt i32 %addtmp.i, %divtmp13.i
  br i1 %letmp14.not.i, label %else16.i, label %then15.i

ifcont.i:                                         ; preds = %else16.i, %then15.i, %loopbody.i
  %high.1.i = phi i32 [ %subtmp22.i, %else16.i ], [ %high.034.i, %then15.i ], [ %high.034.i, %loopbody.i ]
  %low.1.i = phi i32 [ %low.035.i, %else16.i ], [ %addtmp20.i, %then15.i ], [ 1, %loopbody.i ]
  %result.1.i = phi i32 [ %result.036.i, %else16.i ], [ %addtmp.i, %then15.i ], [ 0, %loopbody.i ]
  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i
  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i

then15.i:                                         ; preds = %else.i
  %addtmp20.i = add nsw i32 %addtmp.i, 1
  br label %ifcont.i

else16.i:                                         ; preds = %else.i
  %subtmp22.i = add nsw i32 %addtmp.i, -1
  br label %ifcont.i

intSqrt.exit:                                     ; preds = %ifcont.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %result.1.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
