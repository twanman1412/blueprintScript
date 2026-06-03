; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define noundef range(i32 0, -2147483648) i32 @fibonacci(i32 noundef range(i32 0, -2147483648) %0) local_unnamed_addr #0 {
entry:
  %switch19 = icmp samesign ult i32 %0, 2
  br i1 %switch19, label %common.ret, label %default.next5

common.ret:                                       ; preds = %default.next5, %entry
  %accumulator.tr.lcssa = phi i32 [ 0, %entry ], [ %addtmp, %default.next5 ]
  %.tr.lcssa = phi i32 [ %0, %entry ], [ %subtmp8, %default.next5 ]
  %accumulator.ret.tr = add nuw i32 %.tr.lcssa, %accumulator.tr.lcssa
  ret i32 %accumulator.ret.tr

default.next5:                                    ; preds = %entry, %default.next5
  %.tr21 = phi i32 [ %subtmp8, %default.next5 ], [ %0, %entry ]
  %accumulator.tr20 = phi i32 [ %addtmp, %default.next5 ], [ 0, %entry ]
  %subtmp = add nsw i32 %.tr21, -1
  %calltmp = tail call i32 @fibonacci(i32 %subtmp)
  %subtmp8 = add nsw i32 %.tr21, -2
  %addtmp = add nuw i32 %calltmp, %accumulator.tr20
  %switch = icmp ult i32 %subtmp8, 2
  br i1 %switch, label %common.ret, label %default.next5
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
