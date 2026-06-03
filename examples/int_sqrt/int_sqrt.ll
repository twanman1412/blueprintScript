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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef range(i32 -1000000006, 1000000007) i32 @intSqrtStress() local_unnamed_addr #0 {
entry:
  br label %loopbody

loopbody:                                         ; preds = %entry, %intSqrt.exit
  %sum.013 = phi i32 [ 0, %entry ], [ %modtmp, %intSqrt.exit ]
  %i.012 = phi i32 [ 0, %entry ], [ %addtmp7, %intSqrt.exit ]
  %eqtmp.i = icmp eq i32 %i.012, 0
  br i1 %eqtmp.i, label %intSqrt.exit, label %loopbody.i

loopbody.i:                                       ; preds = %loopbody, %ifcont.i
  %result.036.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %loopbody ]
  %low.035.i = phi i32 [ %low.1.i, %ifcont.i ], [ 0, %loopbody ]
  %high.034.i = phi i32 [ %high.1.i, %ifcont.i ], [ %i.012, %loopbody ]
  %subtmp.i = sub i32 %high.034.i, %low.035.i
  %divtmp.i = sdiv i32 %subtmp.i, 2
  %addtmp.i = add i32 %divtmp.i, %low.035.i
  %eqtmp9.i = icmp eq i32 %addtmp.i, 0
  br i1 %eqtmp9.i, label %ifcont.i, label %else.i

else.i:                                           ; preds = %loopbody.i
  %divtmp13.i = sdiv i32 %i.012, %addtmp.i
  %letmp14.not.i = icmp sgt i32 %addtmp.i, %divtmp13.i
  br i1 %letmp14.not.i, label %else16.i, label %then15.i

ifcont.i:                                         ; preds = %else16.i, %then15.i, %loopbody.i
  %high.1.i = phi i32 [ %subtmp22.i, %else16.i ], [ %high.034.i, %then15.i ], [ %high.034.i, %loopbody.i ]
  %low.1.i = phi i32 [ %low.035.i, %else16.i ], [ %addtmp20.i, %then15.i ], [ 1, %loopbody.i ]
  %result.1.i = phi i32 [ %result.036.i, %else16.i ], [ %addtmp.i, %then15.i ], [ 0, %loopbody.i ]
  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i
  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i

then15.i:                                         ; preds = %else.i
  %addtmp20.i = add i32 %addtmp.i, 1
  br label %ifcont.i

else16.i:                                         ; preds = %else.i
  %subtmp22.i = add nsw i32 %addtmp.i, -1
  br label %ifcont.i

intSqrt.exit:                                     ; preds = %ifcont.i, %loopbody
  %common.ret.op.i = phi i32 [ 0, %loopbody ], [ %result.1.i, %ifcont.i ]
  %addtmp = add i32 %common.ret.op.i, %sum.013
  %modtmp = srem i32 %addtmp, 1000000007
  %addtmp7 = add nuw nsw i32 %i.012, 1
  %letmp = icmp samesign ult i32 %i.012, 100000000
  br i1 %letmp, label %loopbody, label %loopexit

loopexit:                                         ; preds = %intSqrt.exit
  ret i32 %modtmp
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %intSqrt.exit.i, %entry
  %sum.013.i = phi i32 [ 0, %entry ], [ %modtmp.i, %intSqrt.exit.i ]
  %i.012.i = phi i32 [ 0, %entry ], [ %addtmp7.i, %intSqrt.exit.i ]
  %eqtmp.i.i = icmp eq i32 %i.012.i, 0
  br i1 %eqtmp.i.i, label %intSqrt.exit.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i, %ifcont.i.i
  %result.036.i.i = phi i32 [ %result.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i ]
  %low.035.i.i = phi i32 [ %low.1.i.i, %ifcont.i.i ], [ 0, %loopbody.i ]
  %high.034.i.i = phi i32 [ %high.1.i.i, %ifcont.i.i ], [ %i.012.i, %loopbody.i ]
  %subtmp.i.i = sub i32 %high.034.i.i, %low.035.i.i
  %divtmp.i.i = sdiv i32 %subtmp.i.i, 2
  %addtmp.i.i = add i32 %divtmp.i.i, %low.035.i.i
  %eqtmp9.i.i = icmp eq i32 %addtmp.i.i, 0
  br i1 %eqtmp9.i.i, label %ifcont.i.i, label %else.i.i

else.i.i:                                         ; preds = %loopbody.i.i
  %divtmp13.i.i = sdiv i32 %i.012.i, %addtmp.i.i
  %letmp14.not.i.i = icmp sgt i32 %addtmp.i.i, %divtmp13.i.i
  br i1 %letmp14.not.i.i, label %else16.i.i, label %then15.i.i

ifcont.i.i:                                       ; preds = %else16.i.i, %then15.i.i, %loopbody.i.i
  %high.1.i.i = phi i32 [ %subtmp22.i.i, %else16.i.i ], [ %high.034.i.i, %then15.i.i ], [ %high.034.i.i, %loopbody.i.i ]
  %low.1.i.i = phi i32 [ %low.035.i.i, %else16.i.i ], [ %addtmp20.i.i, %then15.i.i ], [ 1, %loopbody.i.i ]
  %result.1.i.i = phi i32 [ %result.036.i.i, %else16.i.i ], [ %addtmp.i.i, %then15.i.i ], [ 0, %loopbody.i.i ]
  %letmp.not.i.i = icmp sgt i32 %low.1.i.i, %high.1.i.i
  br i1 %letmp.not.i.i, label %intSqrt.exit.i, label %loopbody.i.i

then15.i.i:                                       ; preds = %else.i.i
  %addtmp20.i.i = add i32 %addtmp.i.i, 1
  br label %ifcont.i.i

else16.i.i:                                       ; preds = %else.i.i
  %subtmp22.i.i = add nsw i32 %addtmp.i.i, -1
  br label %ifcont.i.i

intSqrt.exit.i:                                   ; preds = %ifcont.i.i, %loopbody.i
  %common.ret.op.i.i = phi i32 [ 0, %loopbody.i ], [ %result.1.i.i, %ifcont.i.i ]
  %addtmp.i = add i32 %common.ret.op.i.i, %sum.013.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp7.i = add nuw nsw i32 %i.012.i, 1
  %letmp.i = icmp samesign ult i32 %i.012.i, 100000000
  br i1 %letmp.i, label %loopbody.i, label %intSqrtStress.exit

intSqrtStress.exit:                               ; preds = %intSqrt.exit.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
