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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define noundef i32 @primeStress() local_unnamed_addr #0 {
entry:
  br label %ifcont.i

ifcont.i:                                         ; preds = %isPrime.exit, %entry
  %count.016 = phi i32 [ 0, %entry ], [ %0, %isPrime.exit ]
  %i.014 = phi i32 [ 2, %entry ], [ %addtmp6, %isPrime.exit ]
  %letmp3.i = icmp samesign ult i32 %i.014, 4
  br i1 %letmp3.i, label %.loopexit, label %ifcont6.i

ifcont6.i:                                        ; preds = %ifcont.i
  %modtmp.i = and i32 %i.014, 1
  %eqtmp.i = icmp eq i32 %modtmp.i, 0
  br i1 %eqtmp.i, label %isPrime.exit, label %loopcond.preheader.i

loopcond.preheader.i:                             ; preds = %ifcont6.i
  %letmp14.not31.i = icmp samesign ult i32 %i.014, 9
  br i1 %letmp14.not31.i, label %.loopexit, label %loopbody.i

loopcond.i:                                       ; preds = %loopbody.i
  %addtmp.i = add i32 %i.032.i, 2
  %divtmp.i = sdiv i32 %i.014, %addtmp.i
  %letmp14.not.i = icmp sgt i32 %addtmp.i, %divtmp.i
  br i1 %letmp14.not.i, label %.loopexit, label %loopbody.i

loopbody.i:                                       ; preds = %loopcond.preheader.i, %loopcond.i
  %i.032.i = phi i32 [ %addtmp.i, %loopcond.i ], [ 3, %loopcond.preheader.i ]
  %modtmp17.i = srem i32 %i.014, %i.032.i
  %eqtmp18.not.i = icmp eq i32 %modtmp17.i, 0
  br i1 %eqtmp18.not.i, label %isPrime.exit, label %loopcond.i

.loopexit:                                        ; preds = %loopcond.i, %ifcont.i, %loopcond.preheader.i
  %addtmp12 = add i32 %count.016, 1
  br label %isPrime.exit

isPrime.exit:                                     ; preds = %loopbody.i, %ifcont6.i, %.loopexit
  %0 = phi i32 [ %addtmp12, %.loopexit ], [ %count.016, %ifcont6.i ], [ %count.016, %loopbody.i ]
  %addtmp6 = add nuw nsw i32 %i.014, 1
  %letmp = icmp samesign ult i32 %i.014, 50000000
  br i1 %letmp, label %ifcont.i, label %loopexit

loopexit:                                         ; preds = %isPrime.exit
  ret i32 %0
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  br label %ifcont.i.i

ifcont.i.i:                                       ; preds = %isPrime.exit.i, %entry
  %count.016.i = phi i32 [ 0, %entry ], [ %0, %isPrime.exit.i ]
  %i.014.i = phi i32 [ 2, %entry ], [ %addtmp6.i, %isPrime.exit.i ]
  %letmp3.i.i = icmp samesign ult i32 %i.014.i, 4
  br i1 %letmp3.i.i, label %.loopexit.i, label %ifcont6.i.i

ifcont6.i.i:                                      ; preds = %ifcont.i.i
  %modtmp.i.i = and i32 %i.014.i, 1
  %eqtmp.i.i = icmp eq i32 %modtmp.i.i, 0
  br i1 %eqtmp.i.i, label %isPrime.exit.i, label %loopcond.preheader.i.i

loopcond.preheader.i.i:                           ; preds = %ifcont6.i.i
  %letmp14.not31.i.i = icmp samesign ult i32 %i.014.i, 9
  br i1 %letmp14.not31.i.i, label %.loopexit.i, label %loopbody.i.i

loopcond.i.i:                                     ; preds = %loopbody.i.i
  %addtmp.i.i = add i32 %i.032.i.i, 2
  %divtmp.i.i = sdiv i32 %i.014.i, %addtmp.i.i
  %letmp14.not.i.i = icmp sgt i32 %addtmp.i.i, %divtmp.i.i
  br i1 %letmp14.not.i.i, label %.loopexit.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopcond.preheader.i.i, %loopcond.i.i
  %i.032.i.i = phi i32 [ %addtmp.i.i, %loopcond.i.i ], [ 3, %loopcond.preheader.i.i ]
  %modtmp17.i.i = srem i32 %i.014.i, %i.032.i.i
  %eqtmp18.not.i.i = icmp eq i32 %modtmp17.i.i, 0
  br i1 %eqtmp18.not.i.i, label %isPrime.exit.i, label %loopcond.i.i

.loopexit.i:                                      ; preds = %loopcond.i.i, %loopcond.preheader.i.i, %ifcont.i.i
  %addtmp12.i = add i32 %count.016.i, 1
  br label %isPrime.exit.i

isPrime.exit.i:                                   ; preds = %loopbody.i.i, %.loopexit.i, %ifcont6.i.i
  %0 = phi i32 [ %addtmp12.i, %.loopexit.i ], [ %count.016.i, %ifcont6.i.i ], [ %count.016.i, %loopbody.i.i ]
  %addtmp6.i = add nuw nsw i32 %i.014.i, 1
  %letmp.i = icmp samesign ult i32 %i.014.i, 50000000
  br i1 %letmp.i, label %ifcont.i.i, label %primeStress.exit

primeStress.exit:                                 ; preds = %isPrime.exit.i
  %1 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %0)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
