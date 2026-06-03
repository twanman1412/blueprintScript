; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define noundef i32 @fibonacci(i32 noundef %0) local_unnamed_addr #0 {
entry:
  %letmp14 = icmp slt i32 %0, 1
  br i1 %letmp14, label %common.ret, label %ifcont

common.ret.loopexit:                              ; preds = %ifcont, %ifcont5
  %accumulator.tr.lcssa.ph = phi i32 [ %addtmp, %ifcont5 ], [ %accumulator.tr15, %ifcont ]
  %common.ret.op.ph = phi i32 [ 0, %ifcont5 ], [ 1, %ifcont ]
  %1 = add i32 %common.ret.op.ph, %accumulator.tr.lcssa.ph
  br label %common.ret

common.ret:                                       ; preds = %common.ret.loopexit, %entry
  %accumulator.ret.tr = phi i32 [ 0, %entry ], [ %1, %common.ret.loopexit ]
  ret i32 %accumulator.ret.tr

ifcont:                                           ; preds = %entry, %ifcont5
  %.tr16 = phi i32 [ %subtmp8, %ifcont5 ], [ %0, %entry ]
  %accumulator.tr15 = phi i32 [ %addtmp, %ifcont5 ], [ 0, %entry ]
  %eqtmp = icmp eq i32 %.tr16, 1
  br i1 %eqtmp, label %common.ret.loopexit, label %ifcont5

ifcont5:                                          ; preds = %ifcont
  %subtmp = add nsw i32 %.tr16, -1
  %calltmp = tail call i32 @fibonacci(i32 %subtmp)
  %subtmp8 = add nsw i32 %.tr16, -2
  %addtmp = add i32 %calltmp, %accumulator.tr15
  %letmp = icmp samesign ult i32 %.tr16, 3
  br i1 %letmp, label %common.ret.loopexit, label %ifcont
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  %calltmp = tail call i32 @fibonacci(i32 10)
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %calltmp)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
