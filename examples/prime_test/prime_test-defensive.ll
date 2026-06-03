; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i1 @isPrime(i32 noundef %0) local_unnamed_addr #0 {
entry:
  %letmp = icmp slt i32 %0, 2
  br i1 %letmp, label %common.ret, label %ifcont

common.ret:                                       ; preds = %loopcond, %loopbody, %loopcond.preheader, %ifcont6, %ifcont, %entry
  %common.ret.op = phi i1 [ false, %ifcont6 ], [ false, %entry ], [ true, %ifcont ], [ true, %loopcond.preheader ], [ %eqtmp18.not.not, %loopbody ], [ %eqtmp18.not.not, %loopcond ]
  ret i1 %common.ret.op

ifcont:                                           ; preds = %entry
  %letmp3 = icmp samesign ult i32 %0, 4
  br i1 %letmp3, label %common.ret, label %ifcont6

ifcont6:                                          ; preds = %ifcont
  %modtmp = and i32 %0, 1
  %eqtmp = icmp eq i32 %modtmp, 0
  br i1 %eqtmp, label %common.ret, label %loopcond.preheader

loopcond.preheader:                               ; preds = %ifcont6
  %letmp14.not31 = icmp samesign ult i32 %0, 9
  br i1 %letmp14.not31, label %common.ret, label %loopbody

loopcond:                                         ; preds = %loopbody
  %addtmp = add i32 %i.032, 2
  %divtmp = sdiv i32 %0, %addtmp
  %letmp14.not = icmp sgt i32 %addtmp, %divtmp
  br i1 %letmp14.not, label %common.ret, label %loopbody

loopbody:                                         ; preds = %loopcond.preheader, %loopcond
  %i.032 = phi i32 [ %addtmp, %loopcond ], [ 3, %loopcond.preheader ]
  %modtmp17 = srem i32 %0, %i.032
  %eqtmp18.not.not = icmp ne i32 %modtmp17, 0
  br i1 %eqtmp18.not.not, label %loopcond, label %common.ret
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
