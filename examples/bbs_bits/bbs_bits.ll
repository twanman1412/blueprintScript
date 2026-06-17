; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.1.i

loopbody.i.1.i:                                   ; preds = %ifcont17.i.1.i.4, %entry
  %a.147.i.1.i = phi i32 [ 591446, %entry ], [ %modtmp27.i.1.i.4, %ifcont17.i.1.i.4 ]
  %b.046.i.1.i = phi i32 [ 591446, %entry ], [ %divtmp44.i.1.i, %ifcont17.i.1.i.4 ]
  %result.045.i.1.i = phi i32 [ 0, %entry ], [ %result.1.i.1.i.4, %ifcont17.i.1.i.4 ]
  %modtmp13.i.1.i = and i32 %b.046.i.1.i, 1
  %eqtmp14.not.i.1.i = icmp eq i32 %modtmp13.i.1.i, 0
  br i1 %eqtmp14.not.i.1.i, label %ifcont17.i.1.i, label %then15.i.1.i

then15.i.1.i:                                     ; preds = %loopbody.i.1.i
  %addtmp20.i.1.i = add nuw nsw i32 %result.045.i.1.i, %a.147.i.1.i
  %modtmp22.i.1.i = urem i32 %addtmp20.i.1.i, 1000003
  br label %ifcont17.i.1.i

ifcont17.i.1.i:                                   ; preds = %then15.i.1.i, %loopbody.i.1.i
  %result.1.i.1.i = phi i32 [ %modtmp22.i.1.i, %then15.i.1.i ], [ %result.045.i.1.i, %loopbody.i.1.i ]
  %addtmp25.i.1.i = shl nuw nsw i32 %a.147.i.1.i, 1
  %modtmp27.i.1.i = urem i32 %addtmp25.i.1.i, 1000003
  %divtmp44.i.1.i = lshr i32 %b.046.i.1.i, 5
  %0 = and i32 %b.046.i.1.i, 2
  %eqtmp14.not.i.1.i.1 = icmp eq i32 %0, 0
  br i1 %eqtmp14.not.i.1.i.1, label %ifcont17.i.1.i.1, label %then15.i.1.i.1

then15.i.1.i.1:                                   ; preds = %ifcont17.i.1.i
  %addtmp20.i.1.i.1 = add nuw nsw i32 %result.1.i.1.i, %modtmp27.i.1.i
  %modtmp22.i.1.i.1 = urem i32 %addtmp20.i.1.i.1, 1000003
  br label %ifcont17.i.1.i.1

ifcont17.i.1.i.1:                                 ; preds = %then15.i.1.i.1, %ifcont17.i.1.i
  %result.1.i.1.i.1 = phi i32 [ %modtmp22.i.1.i.1, %then15.i.1.i.1 ], [ %result.1.i.1.i, %ifcont17.i.1.i ]
  %addtmp25.i.1.i.1 = shl nuw nsw i32 %modtmp27.i.1.i, 1
  %modtmp27.i.1.i.1 = urem i32 %addtmp25.i.1.i.1, 1000003
  %1 = and i32 %b.046.i.1.i, 4
  %eqtmp14.not.i.1.i.2 = icmp eq i32 %1, 0
  br i1 %eqtmp14.not.i.1.i.2, label %ifcont17.i.1.i.2, label %then15.i.1.i.2

then15.i.1.i.2:                                   ; preds = %ifcont17.i.1.i.1
  %addtmp20.i.1.i.2 = add nuw nsw i32 %result.1.i.1.i.1, %modtmp27.i.1.i.1
  %modtmp22.i.1.i.2 = urem i32 %addtmp20.i.1.i.2, 1000003
  br label %ifcont17.i.1.i.2

ifcont17.i.1.i.2:                                 ; preds = %then15.i.1.i.2, %ifcont17.i.1.i.1
  %result.1.i.1.i.2 = phi i32 [ %modtmp22.i.1.i.2, %then15.i.1.i.2 ], [ %result.1.i.1.i.1, %ifcont17.i.1.i.1 ]
  %addtmp25.i.1.i.2 = shl nuw nsw i32 %modtmp27.i.1.i.1, 1
  %modtmp27.i.1.i.2 = urem i32 %addtmp25.i.1.i.2, 1000003
  %2 = and i32 %b.046.i.1.i, 8
  %eqtmp14.not.i.1.i.3 = icmp eq i32 %2, 0
  br i1 %eqtmp14.not.i.1.i.3, label %ifcont17.i.1.i.3, label %then15.i.1.i.3

then15.i.1.i.3:                                   ; preds = %ifcont17.i.1.i.2
  %addtmp20.i.1.i.3 = add nuw nsw i32 %result.1.i.1.i.2, %modtmp27.i.1.i.2
  %modtmp22.i.1.i.3 = urem i32 %addtmp20.i.1.i.3, 1000003
  br label %ifcont17.i.1.i.3

ifcont17.i.1.i.3:                                 ; preds = %then15.i.1.i.3, %ifcont17.i.1.i.2
  %result.1.i.1.i.3 = phi i32 [ %modtmp22.i.1.i.3, %then15.i.1.i.3 ], [ %result.1.i.1.i.2, %ifcont17.i.1.i.2 ]
  %addtmp25.i.1.i.3 = shl nuw nsw i32 %modtmp27.i.1.i.2, 1
  %modtmp27.i.1.i.3 = urem i32 %addtmp25.i.1.i.3, 1000003
  %3 = and i32 %b.046.i.1.i, 16
  %eqtmp14.not.i.1.i.4 = icmp eq i32 %3, 0
  br i1 %eqtmp14.not.i.1.i.4, label %ifcont17.i.1.i.4, label %then15.i.1.i.4

then15.i.1.i.4:                                   ; preds = %ifcont17.i.1.i.3
  %addtmp20.i.1.i.4 = add nuw nsw i32 %result.1.i.1.i.3, %modtmp27.i.1.i.3
  %modtmp22.i.1.i.4 = urem i32 %addtmp20.i.1.i.4, 1000003
  br label %ifcont17.i.1.i.4

ifcont17.i.1.i.4:                                 ; preds = %then15.i.1.i.4, %ifcont17.i.1.i.3
  %result.1.i.1.i.4 = phi i32 [ %modtmp22.i.1.i.4, %then15.i.1.i.4 ], [ %result.1.i.1.i.3, %ifcont17.i.1.i.3 ]
  %addtmp25.i.1.i.4 = shl nuw nsw i32 %modtmp27.i.1.i.3, 1
  %modtmp27.i.1.i.4 = urem i32 %addtmp25.i.1.i.4, 1000003
  %gttmp.not.i.1.i.4 = icmp eq i32 %divtmp44.i.1.i, 0
  br i1 %gttmp.not.i.1.i.4, label %mulMod.exit.1.i, label %loopbody.i.1.i

mulMod.exit.1.i:                                  ; preds = %ifcont17.i.1.i.4
  %eqtmp3.i.2.i = icmp eq i32 %result.1.i.1.i.4, 0
  br i1 %eqtmp3.i.2.i, label %bbsBits.exit, label %loopbody.i.2.i

loopbody.i.2.i:                                   ; preds = %mulMod.exit.1.i, %ifcont17.i.2.i
  %a.147.i.2.i = phi i32 [ %modtmp27.i.2.i, %ifcont17.i.2.i ], [ %result.1.i.1.i.4, %mulMod.exit.1.i ]
  %b.046.i.2.i = phi i32 [ %divtmp44.i.2.i, %ifcont17.i.2.i ], [ %result.1.i.1.i.4, %mulMod.exit.1.i ]
  %result.045.i.2.i = phi i32 [ %result.1.i.2.i, %ifcont17.i.2.i ], [ 0, %mulMod.exit.1.i ]
  %modtmp13.i.2.i = and i32 %b.046.i.2.i, 1
  %eqtmp14.not.i.2.i = icmp eq i32 %modtmp13.i.2.i, 0
  br i1 %eqtmp14.not.i.2.i, label %ifcont17.i.2.i, label %then15.i.2.i

then15.i.2.i:                                     ; preds = %loopbody.i.2.i
  %addtmp20.i.2.i = add nuw nsw i32 %result.045.i.2.i, %a.147.i.2.i
  %modtmp22.i.2.i = urem i32 %addtmp20.i.2.i, 1000003
  br label %ifcont17.i.2.i

ifcont17.i.2.i:                                   ; preds = %then15.i.2.i, %loopbody.i.2.i
  %result.1.i.2.i = phi i32 [ %modtmp22.i.2.i, %then15.i.2.i ], [ %result.045.i.2.i, %loopbody.i.2.i ]
  %addtmp25.i.2.i = shl nuw nsw i32 %a.147.i.2.i, 1
  %modtmp27.i.2.i = urem i32 %addtmp25.i.2.i, 1000003
  %divtmp44.i.2.i = lshr i32 %b.046.i.2.i, 1
  %gttmp.not.i.2.i = icmp eq i32 %divtmp44.i.2.i, 0
  br i1 %gttmp.not.i.2.i, label %mulMod.exit.2.i, label %loopbody.i.2.i

mulMod.exit.2.i:                                  ; preds = %ifcont17.i.2.i
  %eqtmp3.i.3.i = icmp eq i32 %result.1.i.2.i, 0
  br i1 %eqtmp3.i.3.i, label %bbsBits.exit, label %loopbody.i.3.i

loopbody.i.3.i:                                   ; preds = %mulMod.exit.2.i, %ifcont17.i.3.i
  %a.147.i.3.i = phi i32 [ %modtmp27.i.3.i, %ifcont17.i.3.i ], [ %result.1.i.2.i, %mulMod.exit.2.i ]
  %b.046.i.3.i = phi i32 [ %divtmp44.i.3.i, %ifcont17.i.3.i ], [ %result.1.i.2.i, %mulMod.exit.2.i ]
  %result.045.i.3.i = phi i32 [ %result.1.i.3.i, %ifcont17.i.3.i ], [ 0, %mulMod.exit.2.i ]
  %modtmp13.i.3.i = and i32 %b.046.i.3.i, 1
  %eqtmp14.not.i.3.i = icmp eq i32 %modtmp13.i.3.i, 0
  br i1 %eqtmp14.not.i.3.i, label %ifcont17.i.3.i, label %then15.i.3.i

then15.i.3.i:                                     ; preds = %loopbody.i.3.i
  %addtmp20.i.3.i = add nuw nsw i32 %result.045.i.3.i, %a.147.i.3.i
  %modtmp22.i.3.i = urem i32 %addtmp20.i.3.i, 1000003
  br label %ifcont17.i.3.i

ifcont17.i.3.i:                                   ; preds = %then15.i.3.i, %loopbody.i.3.i
  %result.1.i.3.i = phi i32 [ %modtmp22.i.3.i, %then15.i.3.i ], [ %result.045.i.3.i, %loopbody.i.3.i ]
  %addtmp25.i.3.i = shl nuw nsw i32 %a.147.i.3.i, 1
  %modtmp27.i.3.i = urem i32 %addtmp25.i.3.i, 1000003
  %divtmp44.i.3.i = lshr i32 %b.046.i.3.i, 1
  %gttmp.not.i.3.i = icmp eq i32 %divtmp44.i.3.i, 0
  br i1 %gttmp.not.i.3.i, label %mulMod.exit.3.i, label %loopbody.i.3.i

mulMod.exit.3.i:                                  ; preds = %ifcont17.i.3.i
  %eqtmp3.i.4.i = icmp eq i32 %result.1.i.3.i, 0
  br i1 %eqtmp3.i.4.i, label %bbsBits.exit, label %loopbody.i.4.i

loopbody.i.4.i:                                   ; preds = %mulMod.exit.3.i, %ifcont17.i.4.i
  %a.147.i.4.i = phi i32 [ %modtmp27.i.4.i, %ifcont17.i.4.i ], [ %result.1.i.3.i, %mulMod.exit.3.i ]
  %b.046.i.4.i = phi i32 [ %divtmp44.i.4.i, %ifcont17.i.4.i ], [ %result.1.i.3.i, %mulMod.exit.3.i ]
  %result.045.i.4.i = phi i32 [ %result.1.i.4.i, %ifcont17.i.4.i ], [ 0, %mulMod.exit.3.i ]
  %modtmp13.i.4.i = and i32 %b.046.i.4.i, 1
  %eqtmp14.not.i.4.i = icmp eq i32 %modtmp13.i.4.i, 0
  br i1 %eqtmp14.not.i.4.i, label %ifcont17.i.4.i, label %then15.i.4.i

then15.i.4.i:                                     ; preds = %loopbody.i.4.i
  %addtmp20.i.4.i = add nuw nsw i32 %result.045.i.4.i, %a.147.i.4.i
  %modtmp22.i.4.i = urem i32 %addtmp20.i.4.i, 1000003
  br label %ifcont17.i.4.i

ifcont17.i.4.i:                                   ; preds = %then15.i.4.i, %loopbody.i.4.i
  %result.1.i.4.i = phi i32 [ %modtmp22.i.4.i, %then15.i.4.i ], [ %result.045.i.4.i, %loopbody.i.4.i ]
  %addtmp25.i.4.i = shl nuw nsw i32 %a.147.i.4.i, 1
  %modtmp27.i.4.i = urem i32 %addtmp25.i.4.i, 1000003
  %divtmp44.i.4.i = lshr i32 %b.046.i.4.i, 1
  %gttmp.not.i.4.i = icmp eq i32 %divtmp44.i.4.i, 0
  br i1 %gttmp.not.i.4.i, label %mulMod.exit.4.i, label %loopbody.i.4.i

mulMod.exit.4.i:                                  ; preds = %ifcont17.i.4.i
  %eqtmp3.i.5.i = icmp eq i32 %result.1.i.4.i, 0
  br i1 %eqtmp3.i.5.i, label %bbsBits.exit, label %loopbody.i.5.i

loopbody.i.5.i:                                   ; preds = %mulMod.exit.4.i, %ifcont17.i.5.i
  %a.147.i.5.i = phi i32 [ %modtmp27.i.5.i, %ifcont17.i.5.i ], [ %result.1.i.4.i, %mulMod.exit.4.i ]
  %b.046.i.5.i = phi i32 [ %divtmp44.i.5.i, %ifcont17.i.5.i ], [ %result.1.i.4.i, %mulMod.exit.4.i ]
  %result.045.i.5.i = phi i32 [ %result.1.i.5.i, %ifcont17.i.5.i ], [ 0, %mulMod.exit.4.i ]
  %modtmp13.i.5.i = and i32 %b.046.i.5.i, 1
  %eqtmp14.not.i.5.i = icmp eq i32 %modtmp13.i.5.i, 0
  br i1 %eqtmp14.not.i.5.i, label %ifcont17.i.5.i, label %then15.i.5.i

then15.i.5.i:                                     ; preds = %loopbody.i.5.i
  %addtmp20.i.5.i = add nuw nsw i32 %result.045.i.5.i, %a.147.i.5.i
  %modtmp22.i.5.i = urem i32 %addtmp20.i.5.i, 1000003
  br label %ifcont17.i.5.i

ifcont17.i.5.i:                                   ; preds = %then15.i.5.i, %loopbody.i.5.i
  %result.1.i.5.i = phi i32 [ %modtmp22.i.5.i, %then15.i.5.i ], [ %result.045.i.5.i, %loopbody.i.5.i ]
  %addtmp25.i.5.i = shl nuw nsw i32 %a.147.i.5.i, 1
  %modtmp27.i.5.i = urem i32 %addtmp25.i.5.i, 1000003
  %divtmp44.i.5.i = lshr i32 %b.046.i.5.i, 1
  %gttmp.not.i.5.i = icmp eq i32 %divtmp44.i.5.i, 0
  br i1 %gttmp.not.i.5.i, label %mulMod.exit.5.i, label %loopbody.i.5.i

mulMod.exit.5.i:                                  ; preds = %ifcont17.i.5.i
  %eqtmp3.i.6.i = icmp eq i32 %result.1.i.5.i, 0
  br i1 %eqtmp3.i.6.i, label %bbsBits.exit, label %loopbody.i.6.i

loopbody.i.6.i:                                   ; preds = %mulMod.exit.5.i, %ifcont17.i.6.i
  %a.147.i.6.i = phi i32 [ %modtmp27.i.6.i, %ifcont17.i.6.i ], [ %result.1.i.5.i, %mulMod.exit.5.i ]
  %b.046.i.6.i = phi i32 [ %divtmp44.i.6.i, %ifcont17.i.6.i ], [ %result.1.i.5.i, %mulMod.exit.5.i ]
  %result.045.i.6.i = phi i32 [ %result.1.i.6.i, %ifcont17.i.6.i ], [ 0, %mulMod.exit.5.i ]
  %modtmp13.i.6.i = and i32 %b.046.i.6.i, 1
  %eqtmp14.not.i.6.i = icmp eq i32 %modtmp13.i.6.i, 0
  br i1 %eqtmp14.not.i.6.i, label %ifcont17.i.6.i, label %then15.i.6.i

then15.i.6.i:                                     ; preds = %loopbody.i.6.i
  %addtmp20.i.6.i = add nuw nsw i32 %result.045.i.6.i, %a.147.i.6.i
  %modtmp22.i.6.i = urem i32 %addtmp20.i.6.i, 1000003
  br label %ifcont17.i.6.i

ifcont17.i.6.i:                                   ; preds = %then15.i.6.i, %loopbody.i.6.i
  %result.1.i.6.i = phi i32 [ %modtmp22.i.6.i, %then15.i.6.i ], [ %result.045.i.6.i, %loopbody.i.6.i ]
  %addtmp25.i.6.i = shl nuw nsw i32 %a.147.i.6.i, 1
  %modtmp27.i.6.i = urem i32 %addtmp25.i.6.i, 1000003
  %divtmp44.i.6.i = lshr i32 %b.046.i.6.i, 1
  %gttmp.not.i.6.i = icmp eq i32 %divtmp44.i.6.i, 0
  br i1 %gttmp.not.i.6.i, label %mulMod.exit.6.i, label %loopbody.i.6.i

mulMod.exit.6.i:                                  ; preds = %ifcont17.i.6.i
  %eqtmp3.i.7.i = icmp eq i32 %result.1.i.6.i, 0
  br i1 %eqtmp3.i.7.i, label %bbsBits.exit, label %loopbody.i.7.i

loopbody.i.7.i:                                   ; preds = %mulMod.exit.6.i, %ifcont17.i.7.i
  %a.147.i.7.i = phi i32 [ %modtmp27.i.7.i, %ifcont17.i.7.i ], [ %result.1.i.6.i, %mulMod.exit.6.i ]
  %b.046.i.7.i = phi i32 [ %divtmp44.i.7.i, %ifcont17.i.7.i ], [ %result.1.i.6.i, %mulMod.exit.6.i ]
  %result.045.i.7.i = phi i32 [ %result.1.i.7.i, %ifcont17.i.7.i ], [ 0, %mulMod.exit.6.i ]
  %modtmp13.i.7.i = and i32 %b.046.i.7.i, 1
  %eqtmp14.not.i.7.i = icmp eq i32 %modtmp13.i.7.i, 0
  br i1 %eqtmp14.not.i.7.i, label %ifcont17.i.7.i, label %then15.i.7.i

then15.i.7.i:                                     ; preds = %loopbody.i.7.i
  %addtmp20.i.7.i = add nuw nsw i32 %result.045.i.7.i, %a.147.i.7.i
  %modtmp22.i.7.i = urem i32 %addtmp20.i.7.i, 1000003
  br label %ifcont17.i.7.i

ifcont17.i.7.i:                                   ; preds = %then15.i.7.i, %loopbody.i.7.i
  %result.1.i.7.i = phi i32 [ %modtmp22.i.7.i, %then15.i.7.i ], [ %result.045.i.7.i, %loopbody.i.7.i ]
  %addtmp25.i.7.i = shl nuw nsw i32 %a.147.i.7.i, 1
  %modtmp27.i.7.i = urem i32 %addtmp25.i.7.i, 1000003
  %divtmp44.i.7.i = lshr i32 %b.046.i.7.i, 1
  %gttmp.not.i.7.i = icmp eq i32 %divtmp44.i.7.i, 0
  br i1 %gttmp.not.i.7.i, label %mulMod.exit.7.i, label %loopbody.i.7.i

mulMod.exit.7.i:                                  ; preds = %ifcont17.i.7.i
  %eqtmp3.i.8.i = icmp eq i32 %result.1.i.7.i, 0
  br i1 %eqtmp3.i.8.i, label %bbsBits.exit, label %loopbody.i.8.i

loopbody.i.8.i:                                   ; preds = %mulMod.exit.7.i, %ifcont17.i.8.i
  %a.147.i.8.i = phi i32 [ %modtmp27.i.8.i, %ifcont17.i.8.i ], [ %result.1.i.7.i, %mulMod.exit.7.i ]
  %b.046.i.8.i = phi i32 [ %divtmp44.i.8.i, %ifcont17.i.8.i ], [ %result.1.i.7.i, %mulMod.exit.7.i ]
  %result.045.i.8.i = phi i32 [ %result.1.i.8.i, %ifcont17.i.8.i ], [ 0, %mulMod.exit.7.i ]
  %modtmp13.i.8.i = and i32 %b.046.i.8.i, 1
  %eqtmp14.not.i.8.i = icmp eq i32 %modtmp13.i.8.i, 0
  br i1 %eqtmp14.not.i.8.i, label %ifcont17.i.8.i, label %then15.i.8.i

then15.i.8.i:                                     ; preds = %loopbody.i.8.i
  %addtmp20.i.8.i = add nuw nsw i32 %result.045.i.8.i, %a.147.i.8.i
  %modtmp22.i.8.i = urem i32 %addtmp20.i.8.i, 1000003
  br label %ifcont17.i.8.i

ifcont17.i.8.i:                                   ; preds = %then15.i.8.i, %loopbody.i.8.i
  %result.1.i.8.i = phi i32 [ %modtmp22.i.8.i, %then15.i.8.i ], [ %result.045.i.8.i, %loopbody.i.8.i ]
  %addtmp25.i.8.i = shl nuw nsw i32 %a.147.i.8.i, 1
  %modtmp27.i.8.i = urem i32 %addtmp25.i.8.i, 1000003
  %divtmp44.i.8.i = lshr i32 %b.046.i.8.i, 1
  %gttmp.not.i.8.i = icmp eq i32 %divtmp44.i.8.i, 0
  br i1 %gttmp.not.i.8.i, label %mulMod.exit.8.i, label %loopbody.i.8.i

mulMod.exit.8.i:                                  ; preds = %ifcont17.i.8.i
  %eqtmp3.i.9.i = icmp eq i32 %result.1.i.8.i, 0
  br i1 %eqtmp3.i.9.i, label %bbsBits.exit, label %loopbody.i.9.i

loopbody.i.9.i:                                   ; preds = %mulMod.exit.8.i, %ifcont17.i.9.i
  %a.147.i.9.i = phi i32 [ %modtmp27.i.9.i, %ifcont17.i.9.i ], [ %result.1.i.8.i, %mulMod.exit.8.i ]
  %b.046.i.9.i = phi i32 [ %divtmp44.i.9.i, %ifcont17.i.9.i ], [ %result.1.i.8.i, %mulMod.exit.8.i ]
  %result.045.i.9.i = phi i32 [ %result.1.i.9.i, %ifcont17.i.9.i ], [ 0, %mulMod.exit.8.i ]
  %modtmp13.i.9.i = and i32 %b.046.i.9.i, 1
  %eqtmp14.not.i.9.i = icmp eq i32 %modtmp13.i.9.i, 0
  br i1 %eqtmp14.not.i.9.i, label %ifcont17.i.9.i, label %then15.i.9.i

then15.i.9.i:                                     ; preds = %loopbody.i.9.i
  %addtmp20.i.9.i = add nuw nsw i32 %result.045.i.9.i, %a.147.i.9.i
  %modtmp22.i.9.i = urem i32 %addtmp20.i.9.i, 1000003
  br label %ifcont17.i.9.i

ifcont17.i.9.i:                                   ; preds = %then15.i.9.i, %loopbody.i.9.i
  %result.1.i.9.i = phi i32 [ %modtmp22.i.9.i, %then15.i.9.i ], [ %result.045.i.9.i, %loopbody.i.9.i ]
  %addtmp25.i.9.i = shl nuw nsw i32 %a.147.i.9.i, 1
  %modtmp27.i.9.i = urem i32 %addtmp25.i.9.i, 1000003
  %divtmp44.i.9.i = lshr i32 %b.046.i.9.i, 1
  %gttmp.not.i.9.i = icmp eq i32 %divtmp44.i.9.i, 0
  br i1 %gttmp.not.i.9.i, label %mulMod.exit.loopexit.9.i, label %loopbody.i.9.i

mulMod.exit.loopexit.9.i:                         ; preds = %ifcont17.i.9.i
  %4 = and i32 %result.1.i.9.i, 1
  %5 = and i32 %result.1.i.8.i, 1
  br label %bbsBits.exit

bbsBits.exit:                                     ; preds = %mulMod.exit.1.i, %mulMod.exit.2.i, %mulMod.exit.3.i, %mulMod.exit.4.i, %mulMod.exit.5.i, %mulMod.exit.6.i, %mulMod.exit.7.i, %mulMod.exit.8.i, %mulMod.exit.loopexit.9.i
  %common.ret.op.i.8232.i = phi i32 [ 0, %mulMod.exit.8.i ], [ %5, %mulMod.exit.loopexit.9.i ], [ 0, %mulMod.exit.7.i ], [ 0, %mulMod.exit.6.i ], [ 0, %mulMod.exit.5.i ], [ 0, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.6204212231.i = phi i32 [ %result.1.i.6.i, %mulMod.exit.8.i ], [ %result.1.i.6.i, %mulMod.exit.loopexit.9.i ], [ %result.1.i.6.i, %mulMod.exit.7.i ], [ 0, %mulMod.exit.6.i ], [ 0, %mulMod.exit.5.i ], [ 0, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.4184190203213230.i = phi i32 [ %result.1.i.4.i, %mulMod.exit.8.i ], [ %result.1.i.4.i, %mulMod.exit.loopexit.9.i ], [ %result.1.i.4.i, %mulMod.exit.7.i ], [ %result.1.i.4.i, %mulMod.exit.6.i ], [ %result.1.i.4.i, %mulMod.exit.5.i ], [ 0, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.2172176183191202214229.i = phi i32 [ %result.1.i.2.i, %mulMod.exit.8.i ], [ %result.1.i.2.i, %mulMod.exit.loopexit.9.i ], [ %result.1.i.2.i, %mulMod.exit.7.i ], [ %result.1.i.2.i, %mulMod.exit.6.i ], [ %result.1.i.2.i, %mulMod.exit.5.i ], [ %result.1.i.2.i, %mulMod.exit.4.i ], [ %result.1.i.2.i, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.3177182192201215228.i = phi i32 [ %result.1.i.3.i, %mulMod.exit.8.i ], [ %result.1.i.3.i, %mulMod.exit.loopexit.9.i ], [ %result.1.i.3.i, %mulMod.exit.7.i ], [ %result.1.i.3.i, %mulMod.exit.6.i ], [ %result.1.i.3.i, %mulMod.exit.5.i ], [ %result.1.i.3.i, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.5193200216227.i = phi i32 [ %result.1.i.5.i, %mulMod.exit.8.i ], [ %result.1.i.5.i, %mulMod.exit.loopexit.9.i ], [ %result.1.i.5.i, %mulMod.exit.7.i ], [ %result.1.i.5.i, %mulMod.exit.6.i ], [ 0, %mulMod.exit.5.i ], [ 0, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.7217226.i = phi i32 [ %result.1.i.7.i, %mulMod.exit.8.i ], [ %result.1.i.7.i, %mulMod.exit.loopexit.9.i ], [ 0, %mulMod.exit.7.i ], [ 0, %mulMod.exit.6.i ], [ 0, %mulMod.exit.5.i ], [ 0, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %common.ret.op.i.9.i = phi i32 [ 0, %mulMod.exit.8.i ], [ %4, %mulMod.exit.loopexit.9.i ], [ 0, %mulMod.exit.7.i ], [ 0, %mulMod.exit.6.i ], [ 0, %mulMod.exit.5.i ], [ 0, %mulMod.exit.4.i ], [ 0, %mulMod.exit.3.i ], [ 0, %mulMod.exit.2.i ], [ 0, %mulMod.exit.1.i ]
  %modtmp15.7.i = and i32 %common.ret.op.i.7217226.i, 1
  %modtmp15.6.i = and i32 %common.ret.op.i.6204212231.i, 1
  %modtmp15.5.i = and i32 %common.ret.op.i.5193200216227.i, 1
  %modtmp15.4.i = and i32 %common.ret.op.i.4184190203213230.i, 1
  %modtmp15.3.i = and i32 %common.ret.op.i.3177182192201215228.i, 1
  %modtmp15.2.i = and i32 %common.ret.op.i.2172176183191202214229.i, 1
  %modtmp15.1.i = and i32 %result.1.i.1.i.4, 1
  %addtmp16.2.i = add nuw nsw i32 %common.ret.op.i.8232.i, %modtmp15.1.i
  %addtmp16.3.i = add nuw nsw i32 %addtmp16.2.i, %modtmp15.6.i
  %addtmp16.4.i = add nuw nsw i32 %addtmp16.3.i, %modtmp15.4.i
  %addtmp16.5.i = add nuw nsw i32 %addtmp16.4.i, %modtmp15.2.i
  %addtmp16.6.i = add nuw nsw i32 %addtmp16.5.i, %modtmp15.3.i
  %addtmp16.7.i = add nuw nsw i32 %addtmp16.6.i, %modtmp15.5.i
  %addtmp16.8.i = add nuw nsw i32 %addtmp16.7.i, %modtmp15.7.i
  %addtmp16.9.i = add nuw nsw i32 %addtmp16.8.i, %common.ret.op.i.9.i
  %6 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %addtmp16.9.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
