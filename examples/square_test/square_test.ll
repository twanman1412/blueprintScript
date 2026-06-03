; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i1 @isSquare(i32 noundef range(i32 0, -2147483648) %0) local_unnamed_addr #0 {
entry:
  %eqtmp = icmp eq i32 %0, 0
  br i1 %eqtmp, label %common.ret, label %loopbody

common.ret:                                       ; preds = %entry, %loopexit
  %common.ret.op = phi i1 [ %eqtmp7, %loopexit ], [ true, %entry ]
  ret i1 %common.ret.op

loopbody:                                         ; preds = %entry, %loopbody
  %n.013 = phi i32 [ %subtmp, %loopbody ], [ %0, %entry ]
  %odd.012 = phi i32 [ %addtmp, %loopbody ], [ 1, %entry ]
  %subtmp = sub i32 %n.013, %odd.012
  %addtmp = add i32 %odd.012, 2
  %gttmp = icmp sgt i32 %subtmp, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopexit:                                         ; preds = %loopbody
  %eqtmp7 = icmp eq i32 %subtmp, 0
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @squareStress() local_unnamed_addr #0 {
entry:
  br label %loopbody

loopbody:                                         ; preds = %entry, %isSquare.exit.thread
  %count.016 = phi i32 [ 0, %entry ], [ %0, %isSquare.exit.thread ]
  %i.015 = phi i32 [ 0, %entry ], [ %addtmp6, %isSquare.exit.thread ]
  %eqtmp.i = icmp eq i32 %i.015, 0
  br i1 %eqtmp.i, label %isSquare.exit.thread, label %loopbody.i

loopbody.i:                                       ; preds = %loopbody, %loopbody.i
  %n.013.i = phi i32 [ %subtmp.i.fr, %loopbody.i ], [ %i.015, %loopbody ]
  %odd.012.i = phi i32 [ %addtmp.i, %loopbody.i ], [ 1, %loopbody ]
  %subtmp.i = sub i32 %n.013.i, %odd.012.i
  %subtmp.i.fr = freeze i32 %subtmp.i
  %addtmp.i = add i32 %odd.012.i, 2
  %gttmp.i = icmp sgt i32 %subtmp.i.fr, 0
  br i1 %gttmp.i, label %loopbody.i, label %isSquare.exit

isSquare.exit:                                    ; preds = %loopbody.i
  %eqtmp7.i = icmp eq i32 %subtmp.i.fr, 0
  %addtmp = zext i1 %eqtmp7.i to i32
  br label %isSquare.exit.thread

isSquare.exit.thread:                             ; preds = %loopbody, %isSquare.exit
  %addtmp.pn = phi i32 [ %addtmp, %isSquare.exit ], [ 1, %loopbody ]
  %0 = add i32 %addtmp.pn, %count.016
  %addtmp6 = add nuw nsw i32 %i.015, 1
  %letmp = icmp samesign ult i32 %i.015, 10000000
  br i1 %letmp, label %loopbody, label %loopexit

loopexit:                                         ; preds = %isSquare.exit.thread
  ret i32 %0
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %isSquare.exit.thread.i, %entry
  %count.016.i = phi i32 [ 0, %entry ], [ %0, %isSquare.exit.thread.i ]
  %i.015.i = phi i32 [ 0, %entry ], [ %addtmp6.i, %isSquare.exit.thread.i ]
  %eqtmp.i.i = icmp eq i32 %i.015.i, 0
  br i1 %eqtmp.i.i, label %isSquare.exit.thread.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i, %loopbody.i.i
  %n.013.i.i = phi i32 [ %subtmp.i.fr.i, %loopbody.i.i ], [ %i.015.i, %loopbody.i ]
  %odd.012.i.i = phi i32 [ %addtmp.i.i, %loopbody.i.i ], [ 1, %loopbody.i ]
  %subtmp.i.i = sub i32 %n.013.i.i, %odd.012.i.i
  %subtmp.i.fr.i = freeze i32 %subtmp.i.i
  %addtmp.i.i = add i32 %odd.012.i.i, 2
  %gttmp.i.i = icmp sgt i32 %subtmp.i.fr.i, 0
  br i1 %gttmp.i.i, label %loopbody.i.i, label %isSquare.exit.i

isSquare.exit.i:                                  ; preds = %loopbody.i.i
  %eqtmp7.i.i = icmp eq i32 %subtmp.i.fr.i, 0
  %addtmp.i = zext i1 %eqtmp7.i.i to i32
  br label %isSquare.exit.thread.i

isSquare.exit.thread.i:                           ; preds = %isSquare.exit.i, %loopbody.i
  %addtmp.pn.i = phi i32 [ %addtmp.i, %isSquare.exit.i ], [ 1, %loopbody.i ]
  %0 = add i32 %addtmp.pn.i, %count.016.i
  %addtmp6.i = add nuw nsw i32 %i.015.i, 1
  %letmp.i = icmp samesign ult i32 %i.015.i, 10000000
  br i1 %letmp.i, label %loopbody.i, label %squareStress.exit

squareStress.exit:                                ; preds = %isSquare.exit.thread.i
  %1 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %0)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
