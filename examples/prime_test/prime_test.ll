; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i1 @isPrime(i32 noundef range(i32 0, -2147483648) %0) local_unnamed_addr #0 {
entry:
  %letmp = icmp samesign ult i32 %0, 2
  br i1 %letmp, label %common.ret, label %default.next

common.ret:                                       ; preds = %loopcond, %loopbody, %loopcond.preheader, %default.next, %ifcont11, %entry
  %common.ret.op = phi i1 [ false, %ifcont11 ], [ false, %entry ], [ true, %default.next ], [ true, %loopcond.preheader ], [ %eqtmp24.not.not, %loopbody ], [ %eqtmp24.not.not, %loopcond ]
  ret i1 %common.ret.op

default.next:                                     ; preds = %entry
  %1 = icmp samesign ult i32 %0, 4
  br i1 %1, label %common.ret, label %ifcont11

ifcont11:                                         ; preds = %default.next
  %modtmp = and i32 %0, 1
  %eqtmp13 = icmp eq i32 %modtmp, 0
  br i1 %eqtmp13, label %common.ret, label %loopcond.preheader

loopcond.preheader:                               ; preds = %ifcont11
  %letmp20.not39 = icmp samesign ult i32 %0, 9
  br i1 %letmp20.not39, label %common.ret, label %loopbody

loopcond:                                         ; preds = %loopbody
  %addtmp = add i32 %i.040, 2
  %divtmp = sdiv i32 %0, %addtmp
  %letmp20.not = icmp sgt i32 %addtmp, %divtmp
  br i1 %letmp20.not, label %common.ret, label %loopbody

loopbody:                                         ; preds = %loopcond.preheader, %loopcond
  %i.040 = phi i32 [ %addtmp, %loopcond ], [ 3, %loopcond.preheader ]
  %modtmp23 = srem i32 %0, %i.040
  %eqtmp24.not.not = icmp ne i32 %modtmp23, 0
  br i1 %eqtmp24.not.not, label %loopcond, label %common.ret
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
