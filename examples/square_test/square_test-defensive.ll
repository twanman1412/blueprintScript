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

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
