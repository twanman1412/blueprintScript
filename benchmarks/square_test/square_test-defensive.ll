; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %isSquare.exit.loopexit.i.7, %entry
  %count.012.i = phi i32 [ 0, %entry ], [ %spec.select.i.7, %isSquare.exit.loopexit.i.7 ]
  %i.011.i = phi i32 [ 0, %entry ], [ %addtmp6.i.7, %isSquare.exit.loopexit.i.7 ]
  %gttmp9.i.not.i = icmp eq i32 %i.011.i, 0
  br i1 %gttmp9.i.not.i, label %isSquare.exit.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i, %loopbody.i.i
  %n.011.i.i = phi i32 [ %subtmp.i.i, %loopbody.i.i ], [ %i.011.i, %loopbody.i ]
  %odd.010.i.i = phi i32 [ %addtmp.i.i, %loopbody.i.i ], [ 1, %loopbody.i ]
  %subtmp.i.i = sub nsw i32 %n.011.i.i, %odd.010.i.i
  %addtmp.i.i = add nuw nsw i32 %odd.010.i.i, 2
  %gttmp.i.i = icmp sgt i32 %subtmp.i.i, 0
  br i1 %gttmp.i.i, label %loopbody.i.i, label %isSquare.exit.loopexit.i

isSquare.exit.loopexit.i:                         ; preds = %loopbody.i.i
  %0 = icmp eq i32 %subtmp.i.i, 0
  %1 = zext i1 %0 to i32
  br label %isSquare.exit.i

isSquare.exit.i:                                  ; preds = %isSquare.exit.loopexit.i, %loopbody.i
  %n.0.lcssa.i.i = phi i32 [ 1, %loopbody.i ], [ %1, %isSquare.exit.loopexit.i ]
  %spec.select.i = add nuw nsw i32 %n.0.lcssa.i.i, %count.012.i
  %addtmp6.i = or disjoint i32 %i.011.i, 1
  %exitcond.not.i = icmp eq i32 %i.011.i, 10000000
  br i1 %exitcond.not.i, label %squareStress.exit, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %isSquare.exit.i, %loopbody.i.i.1
  %n.011.i.i.1 = phi i32 [ %subtmp.i.i.1, %loopbody.i.i.1 ], [ %addtmp6.i, %isSquare.exit.i ]
  %odd.010.i.i.1 = phi i32 [ %addtmp.i.i.1, %loopbody.i.i.1 ], [ 1, %isSquare.exit.i ]
  %subtmp.i.i.1 = sub nsw i32 %n.011.i.i.1, %odd.010.i.i.1
  %addtmp.i.i.1 = add nuw nsw i32 %odd.010.i.i.1, 2
  %gttmp.i.i.1 = icmp sgt i32 %subtmp.i.i.1, 0
  br i1 %gttmp.i.i.1, label %loopbody.i.i.1, label %isSquare.exit.loopexit.i.1

isSquare.exit.loopexit.i.1:                       ; preds = %loopbody.i.i.1
  %2 = icmp eq i32 %subtmp.i.i.1, 0
  %3 = zext i1 %2 to i32
  %spec.select.i.1 = add nuw nsw i32 %3, %spec.select.i
  %addtmp6.i.1 = or disjoint i32 %i.011.i, 2
  br label %loopbody.i.i.2

loopbody.i.i.2:                                   ; preds = %loopbody.i.i.2, %isSquare.exit.loopexit.i.1
  %n.011.i.i.2 = phi i32 [ %subtmp.i.i.2, %loopbody.i.i.2 ], [ %addtmp6.i.1, %isSquare.exit.loopexit.i.1 ]
  %odd.010.i.i.2 = phi i32 [ %addtmp.i.i.2, %loopbody.i.i.2 ], [ 1, %isSquare.exit.loopexit.i.1 ]
  %subtmp.i.i.2 = sub nsw i32 %n.011.i.i.2, %odd.010.i.i.2
  %addtmp.i.i.2 = add nuw nsw i32 %odd.010.i.i.2, 2
  %gttmp.i.i.2 = icmp sgt i32 %subtmp.i.i.2, 0
  br i1 %gttmp.i.i.2, label %loopbody.i.i.2, label %isSquare.exit.loopexit.i.2

isSquare.exit.loopexit.i.2:                       ; preds = %loopbody.i.i.2
  %4 = icmp eq i32 %subtmp.i.i.2, 0
  %5 = zext i1 %4 to i32
  %spec.select.i.2 = add nuw nsw i32 %5, %spec.select.i.1
  %addtmp6.i.2 = or disjoint i32 %i.011.i, 3
  br label %loopbody.i.i.3

loopbody.i.i.3:                                   ; preds = %loopbody.i.i.3, %isSquare.exit.loopexit.i.2
  %n.011.i.i.3 = phi i32 [ %subtmp.i.i.3, %loopbody.i.i.3 ], [ %addtmp6.i.2, %isSquare.exit.loopexit.i.2 ]
  %odd.010.i.i.3 = phi i32 [ %addtmp.i.i.3, %loopbody.i.i.3 ], [ 1, %isSquare.exit.loopexit.i.2 ]
  %subtmp.i.i.3 = sub nsw i32 %n.011.i.i.3, %odd.010.i.i.3
  %addtmp.i.i.3 = add nuw nsw i32 %odd.010.i.i.3, 2
  %gttmp.i.i.3 = icmp sgt i32 %subtmp.i.i.3, 0
  br i1 %gttmp.i.i.3, label %loopbody.i.i.3, label %isSquare.exit.loopexit.i.3

isSquare.exit.loopexit.i.3:                       ; preds = %loopbody.i.i.3
  %6 = icmp eq i32 %subtmp.i.i.3, 0
  %7 = zext i1 %6 to i32
  %spec.select.i.3 = add nuw nsw i32 %7, %spec.select.i.2
  %addtmp6.i.3 = or disjoint i32 %i.011.i, 4
  br label %loopbody.i.i.4

loopbody.i.i.4:                                   ; preds = %loopbody.i.i.4, %isSquare.exit.loopexit.i.3
  %n.011.i.i.4 = phi i32 [ %subtmp.i.i.4, %loopbody.i.i.4 ], [ %addtmp6.i.3, %isSquare.exit.loopexit.i.3 ]
  %odd.010.i.i.4 = phi i32 [ %addtmp.i.i.4, %loopbody.i.i.4 ], [ 1, %isSquare.exit.loopexit.i.3 ]
  %subtmp.i.i.4 = sub nsw i32 %n.011.i.i.4, %odd.010.i.i.4
  %addtmp.i.i.4 = add nuw nsw i32 %odd.010.i.i.4, 2
  %gttmp.i.i.4 = icmp sgt i32 %subtmp.i.i.4, 0
  br i1 %gttmp.i.i.4, label %loopbody.i.i.4, label %isSquare.exit.loopexit.i.4

isSquare.exit.loopexit.i.4:                       ; preds = %loopbody.i.i.4
  %8 = icmp eq i32 %subtmp.i.i.4, 0
  %9 = zext i1 %8 to i32
  %spec.select.i.4 = add nuw nsw i32 %9, %spec.select.i.3
  %addtmp6.i.4 = or disjoint i32 %i.011.i, 5
  br label %loopbody.i.i.5

loopbody.i.i.5:                                   ; preds = %loopbody.i.i.5, %isSquare.exit.loopexit.i.4
  %n.011.i.i.5 = phi i32 [ %subtmp.i.i.5, %loopbody.i.i.5 ], [ %addtmp6.i.4, %isSquare.exit.loopexit.i.4 ]
  %odd.010.i.i.5 = phi i32 [ %addtmp.i.i.5, %loopbody.i.i.5 ], [ 1, %isSquare.exit.loopexit.i.4 ]
  %subtmp.i.i.5 = sub nsw i32 %n.011.i.i.5, %odd.010.i.i.5
  %addtmp.i.i.5 = add nuw nsw i32 %odd.010.i.i.5, 2
  %gttmp.i.i.5 = icmp sgt i32 %subtmp.i.i.5, 0
  br i1 %gttmp.i.i.5, label %loopbody.i.i.5, label %isSquare.exit.loopexit.i.5

isSquare.exit.loopexit.i.5:                       ; preds = %loopbody.i.i.5
  %10 = icmp eq i32 %subtmp.i.i.5, 0
  %11 = zext i1 %10 to i32
  %spec.select.i.5 = add nuw nsw i32 %11, %spec.select.i.4
  %addtmp6.i.5 = or disjoint i32 %i.011.i, 6
  br label %loopbody.i.i.6

loopbody.i.i.6:                                   ; preds = %loopbody.i.i.6, %isSquare.exit.loopexit.i.5
  %n.011.i.i.6 = phi i32 [ %subtmp.i.i.6, %loopbody.i.i.6 ], [ %addtmp6.i.5, %isSquare.exit.loopexit.i.5 ]
  %odd.010.i.i.6 = phi i32 [ %addtmp.i.i.6, %loopbody.i.i.6 ], [ 1, %isSquare.exit.loopexit.i.5 ]
  %subtmp.i.i.6 = sub nsw i32 %n.011.i.i.6, %odd.010.i.i.6
  %addtmp.i.i.6 = add nuw nsw i32 %odd.010.i.i.6, 2
  %gttmp.i.i.6 = icmp sgt i32 %subtmp.i.i.6, 0
  br i1 %gttmp.i.i.6, label %loopbody.i.i.6, label %isSquare.exit.loopexit.i.6

isSquare.exit.loopexit.i.6:                       ; preds = %loopbody.i.i.6
  %12 = icmp eq i32 %subtmp.i.i.6, 0
  %13 = zext i1 %12 to i32
  %spec.select.i.6 = add nuw nsw i32 %13, %spec.select.i.5
  %addtmp6.i.6 = or disjoint i32 %i.011.i, 7
  br label %loopbody.i.i.7

loopbody.i.i.7:                                   ; preds = %loopbody.i.i.7, %isSquare.exit.loopexit.i.6
  %n.011.i.i.7 = phi i32 [ %subtmp.i.i.7, %loopbody.i.i.7 ], [ %addtmp6.i.6, %isSquare.exit.loopexit.i.6 ]
  %odd.010.i.i.7 = phi i32 [ %addtmp.i.i.7, %loopbody.i.i.7 ], [ 1, %isSquare.exit.loopexit.i.6 ]
  %subtmp.i.i.7 = sub nsw i32 %n.011.i.i.7, %odd.010.i.i.7
  %addtmp.i.i.7 = add nuw nsw i32 %odd.010.i.i.7, 2
  %gttmp.i.i.7 = icmp sgt i32 %subtmp.i.i.7, 0
  br i1 %gttmp.i.i.7, label %loopbody.i.i.7, label %isSquare.exit.loopexit.i.7

isSquare.exit.loopexit.i.7:                       ; preds = %loopbody.i.i.7
  %14 = icmp eq i32 %subtmp.i.i.7, 0
  %15 = zext i1 %14 to i32
  %spec.select.i.7 = add nuw nsw i32 %15, %spec.select.i.6
  %addtmp6.i.7 = add nuw nsw i32 %i.011.i, 8
  br label %loopbody.i

squareStress.exit:                                ; preds = %isSquare.exit.i
  %16 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %spec.select.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
