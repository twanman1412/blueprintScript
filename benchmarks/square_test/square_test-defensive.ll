; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i1 @isSquare(i32 noundef %0) local_unnamed_addr #0 {
entry:
  %gttmp9 = icmp sgt i32 %0, 0
  br i1 %gttmp9, label %loopbody, label %loopexit

loopbody:                                         ; preds = %entry, %loopbody
  %n.011 = phi i32 [ %subtmp, %loopbody ], [ %0, %entry ]
  %odd.010 = phi i32 [ %addtmp, %loopbody ], [ 1, %entry ]
  %subtmp = sub i32 %n.011, %odd.010
  %addtmp = add i32 %odd.010, 2
  %gttmp = icmp sgt i32 %subtmp, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopexit:                                         ; preds = %loopbody, %entry
  %n.0.lcssa = phi i32 [ %0, %entry ], [ %subtmp, %loopbody ]
  %eqtmp = icmp eq i32 %n.0.lcssa, 0
  ret i1 %eqtmp
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @squareStress() local_unnamed_addr #0 {
entry:
  br label %loopbody

loopbody:                                         ; preds = %entry, %isSquare.exit
  %count.012 = phi i32 [ 0, %entry ], [ %spec.select, %isSquare.exit ]
  %i.011 = phi i32 [ 0, %entry ], [ %addtmp6, %isSquare.exit ]
  %gttmp9.i.not = icmp eq i32 %i.011, 0
  br i1 %gttmp9.i.not, label %isSquare.exit, label %loopbody.i

loopbody.i:                                       ; preds = %loopbody, %loopbody.i
  %n.011.i = phi i32 [ %subtmp.i, %loopbody.i ], [ %i.011, %loopbody ]
  %odd.010.i = phi i32 [ %addtmp.i, %loopbody.i ], [ 1, %loopbody ]
  %subtmp.i = sub i32 %n.011.i, %odd.010.i
  %addtmp.i = add i32 %odd.010.i, 2
  %gttmp.i = icmp sgt i32 %subtmp.i, 0
  br i1 %gttmp.i, label %loopbody.i, label %isSquare.exit.loopexit

isSquare.exit.loopexit:                           ; preds = %loopbody.i
  %0 = icmp eq i32 %subtmp.i, 0
  br label %isSquare.exit

isSquare.exit:                                    ; preds = %isSquare.exit.loopexit, %loopbody
  %n.0.lcssa.i = phi i1 [ true, %loopbody ], [ %0, %isSquare.exit.loopexit ]
  %addtmp = zext i1 %n.0.lcssa.i to i32
  %spec.select = add i32 %count.012, %addtmp
  %addtmp6 = add nuw nsw i32 %i.011, 1
  %letmp = icmp samesign ult i32 %i.011, 10000000
  br i1 %letmp, label %loopbody, label %loopexit

loopexit:                                         ; preds = %isSquare.exit
  ret i32 %spec.select
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %isSquare.exit.i, %entry
  %count.012.i = phi i32 [ 0, %entry ], [ %spec.select.i, %isSquare.exit.i ]
  %i.011.i = phi i32 [ 0, %entry ], [ %addtmp6.i, %isSquare.exit.i ]
  %gttmp9.i.not.i = icmp eq i32 %i.011.i, 0
  br i1 %gttmp9.i.not.i, label %isSquare.exit.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i, %loopbody.i.i
  %n.011.i.i = phi i32 [ %subtmp.i.i, %loopbody.i.i ], [ %i.011.i, %loopbody.i ]
  %odd.010.i.i = phi i32 [ %addtmp.i.i, %loopbody.i.i ], [ 1, %loopbody.i ]
  %subtmp.i.i = sub i32 %n.011.i.i, %odd.010.i.i
  %addtmp.i.i = add i32 %odd.010.i.i, 2
  %gttmp.i.i = icmp sgt i32 %subtmp.i.i, 0
  br i1 %gttmp.i.i, label %loopbody.i.i, label %isSquare.exit.loopexit.i

isSquare.exit.loopexit.i:                         ; preds = %loopbody.i.i
  %0 = icmp eq i32 %subtmp.i.i, 0
  br label %isSquare.exit.i

isSquare.exit.i:                                  ; preds = %isSquare.exit.loopexit.i, %loopbody.i
  %n.0.lcssa.i.i = phi i1 [ true, %loopbody.i ], [ %0, %isSquare.exit.loopexit.i ]
  %addtmp.i = zext i1 %n.0.lcssa.i.i to i32
  %spec.select.i = add i32 %count.012.i, %addtmp.i
  %addtmp6.i = add nuw nsw i32 %i.011.i, 1
  %letmp.i = icmp samesign ult i32 %i.011.i, 10000000
  br i1 %letmp.i, label %loopbody.i, label %squareStress.exit

squareStress.exit:                                ; preds = %isSquare.exit.i
  %1 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %spec.select.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
