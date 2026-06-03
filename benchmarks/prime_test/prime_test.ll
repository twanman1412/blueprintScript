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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @primeStress() local_unnamed_addr #0 {
entry:
  br label %default.next.i

default.next.i:                                   ; preds = %isPrime.exit, %entry
  %count.016 = phi i32 [ 0, %entry ], [ %1, %isPrime.exit ]
  %i.014 = phi i32 [ 2, %entry ], [ %addtmp6, %isPrime.exit ]
  %0 = icmp samesign ult i32 %i.014, 4
  br i1 %0, label %.loopexit, label %ifcont11.i

ifcont11.i:                                       ; preds = %default.next.i
  %modtmp.i = and i32 %i.014, 1
  %eqtmp13.i = icmp eq i32 %modtmp.i, 0
  br i1 %eqtmp13.i, label %isPrime.exit, label %loopcond.preheader.i

loopcond.preheader.i:                             ; preds = %ifcont11.i
  %letmp20.not39.i = icmp samesign ult i32 %i.014, 9
  br i1 %letmp20.not39.i, label %.loopexit, label %loopbody.i

loopcond.i:                                       ; preds = %loopbody.i
  %addtmp.i = add i32 %i.040.i, 2
  %divtmp.i = sdiv i32 %i.014, %addtmp.i
  %letmp20.not.i = icmp sgt i32 %addtmp.i, %divtmp.i
  br i1 %letmp20.not.i, label %.loopexit, label %loopbody.i

loopbody.i:                                       ; preds = %loopcond.preheader.i, %loopcond.i
  %i.040.i = phi i32 [ %addtmp.i, %loopcond.i ], [ 3, %loopcond.preheader.i ]
  %modtmp23.i = srem i32 %i.014, %i.040.i
  %eqtmp24.not.i = icmp eq i32 %modtmp23.i, 0
  br i1 %eqtmp24.not.i, label %isPrime.exit, label %loopcond.i

.loopexit:                                        ; preds = %loopcond.i, %default.next.i, %loopcond.preheader.i
  %addtmp12 = add i32 %count.016, 1
  br label %isPrime.exit

isPrime.exit:                                     ; preds = %loopbody.i, %ifcont11.i, %.loopexit
  %1 = phi i32 [ %addtmp12, %.loopexit ], [ %count.016, %ifcont11.i ], [ %count.016, %loopbody.i ]
  %addtmp6 = add nuw nsw i32 %i.014, 1
  %letmp = icmp samesign ult i32 %i.014, 50000000
  br i1 %letmp, label %default.next.i, label %loopexit

loopexit:                                         ; preds = %isPrime.exit
  ret i32 %1
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %default.next.i.i

default.next.i.i:                                 ; preds = %isPrime.exit.i, %entry
  %count.016.i = phi i32 [ 0, %entry ], [ %1, %isPrime.exit.i ]
  %i.014.i = phi i32 [ 2, %entry ], [ %addtmp6.i, %isPrime.exit.i ]
  %0 = icmp samesign ult i32 %i.014.i, 4
  br i1 %0, label %.loopexit.i, label %ifcont11.i.i

ifcont11.i.i:                                     ; preds = %default.next.i.i
  %modtmp.i.i = and i32 %i.014.i, 1
  %eqtmp13.i.i = icmp eq i32 %modtmp.i.i, 0
  br i1 %eqtmp13.i.i, label %isPrime.exit.i, label %loopcond.preheader.i.i

loopcond.preheader.i.i:                           ; preds = %ifcont11.i.i
  %letmp20.not39.i.i = icmp samesign ult i32 %i.014.i, 9
  br i1 %letmp20.not39.i.i, label %.loopexit.i, label %loopbody.i.i

loopcond.i.i:                                     ; preds = %loopbody.i.i
  %addtmp.i.i = add i32 %i.040.i.i, 2
  %divtmp.i.i = sdiv i32 %i.014.i, %addtmp.i.i
  %letmp20.not.i.i = icmp sgt i32 %addtmp.i.i, %divtmp.i.i
  br i1 %letmp20.not.i.i, label %.loopexit.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopcond.preheader.i.i, %loopcond.i.i
  %i.040.i.i = phi i32 [ %addtmp.i.i, %loopcond.i.i ], [ 3, %loopcond.preheader.i.i ]
  %modtmp23.i.i = srem i32 %i.014.i, %i.040.i.i
  %eqtmp24.not.i.i = icmp eq i32 %modtmp23.i.i, 0
  br i1 %eqtmp24.not.i.i, label %isPrime.exit.i, label %loopcond.i.i

.loopexit.i:                                      ; preds = %loopcond.i.i, %loopcond.preheader.i.i, %default.next.i.i
  %addtmp12.i = add i32 %count.016.i, 1
  br label %isPrime.exit.i

isPrime.exit.i:                                   ; preds = %loopbody.i.i, %.loopexit.i, %ifcont11.i.i
  %1 = phi i32 [ %addtmp12.i, %.loopexit.i ], [ %count.016.i, %ifcont11.i.i ], [ %count.016.i, %loopbody.i.i ]
  %addtmp6.i = add nuw nsw i32 %i.014.i, 1
  %letmp.i = icmp samesign ult i32 %i.014.i, 50000000
  br i1 %letmp.i, label %default.next.i.i, label %primeStress.exit

primeStress.exit:                                 ; preds = %isPrime.exit.i
  %2 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
