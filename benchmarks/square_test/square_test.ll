; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i

loopbody.i:                                       ; preds = %isSquare.exit.i.7, %entry
  %count.016.i = phi i32 [ 0, %entry ], [ %7, %isSquare.exit.i.7 ]
  %i.015.i = phi i32 [ 0, %entry ], [ %addtmp6.i.7, %isSquare.exit.i.7 ]
  %eqtmp.i.i = icmp eq i32 %i.015.i, 0
  br i1 %eqtmp.i.i, label %isSquare.exit.thread.i, label %loopbody.i.i

loopbody.i.i:                                     ; preds = %loopbody.i, %loopbody.i.i
  %n.013.i.i = phi i32 [ %subtmp.i.fr.i, %loopbody.i.i ], [ %i.015.i, %loopbody.i ]
  %odd.012.i.i = phi i32 [ %addtmp.i.i, %loopbody.i.i ], [ 1, %loopbody.i ]
  %subtmp.i.i = sub nsw i32 %n.013.i.i, %odd.012.i.i
  %subtmp.i.fr.i = freeze i32 %subtmp.i.i
  %addtmp.i.i = add nuw nsw i32 %odd.012.i.i, 2
  %gttmp.i.i = icmp sgt i32 %subtmp.i.fr.i, 0
  br i1 %gttmp.i.i, label %loopbody.i.i, label %isSquare.exit.i

isSquare.exit.i:                                  ; preds = %loopbody.i.i
  %eqtmp7.i.i = icmp eq i32 %subtmp.i.fr.i, 0
  %addtmp.i = zext i1 %eqtmp7.i.i to i32
  br label %isSquare.exit.thread.i

isSquare.exit.thread.i:                           ; preds = %isSquare.exit.i, %loopbody.i
  %addtmp.pn.i = phi i32 [ %addtmp.i, %isSquare.exit.i ], [ 1, %loopbody.i ]
  %0 = add nuw nsw i32 %addtmp.pn.i, %count.016.i
  %addtmp6.i = or disjoint i32 %i.015.i, 1
  %exitcond.not.i = icmp eq i32 %i.015.i, 10000000
  br i1 %exitcond.not.i, label %squareStress.exit, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %isSquare.exit.thread.i, %loopbody.i.i.1
  %n.013.i.i.1 = phi i32 [ %subtmp.i.fr.i.1, %loopbody.i.i.1 ], [ %addtmp6.i, %isSquare.exit.thread.i ]
  %odd.012.i.i.1 = phi i32 [ %addtmp.i.i.1, %loopbody.i.i.1 ], [ 1, %isSquare.exit.thread.i ]
  %subtmp.i.i.1 = sub nsw i32 %n.013.i.i.1, %odd.012.i.i.1
  %subtmp.i.fr.i.1 = freeze i32 %subtmp.i.i.1
  %addtmp.i.i.1 = add nuw nsw i32 %odd.012.i.i.1, 2
  %gttmp.i.i.1 = icmp sgt i32 %subtmp.i.fr.i.1, 0
  br i1 %gttmp.i.i.1, label %loopbody.i.i.1, label %isSquare.exit.i.1

isSquare.exit.i.1:                                ; preds = %loopbody.i.i.1
  %eqtmp7.i.i.1 = icmp eq i32 %subtmp.i.fr.i.1, 0
  %addtmp.i.1 = zext i1 %eqtmp7.i.i.1 to i32
  %1 = add nuw nsw i32 %addtmp.i.1, %0
  %addtmp6.i.1 = or disjoint i32 %i.015.i, 2
  br label %loopbody.i.i.2

loopbody.i.i.2:                                   ; preds = %loopbody.i.i.2, %isSquare.exit.i.1
  %n.013.i.i.2 = phi i32 [ %subtmp.i.fr.i.2, %loopbody.i.i.2 ], [ %addtmp6.i.1, %isSquare.exit.i.1 ]
  %odd.012.i.i.2 = phi i32 [ %addtmp.i.i.2, %loopbody.i.i.2 ], [ 1, %isSquare.exit.i.1 ]
  %subtmp.i.i.2 = sub nsw i32 %n.013.i.i.2, %odd.012.i.i.2
  %subtmp.i.fr.i.2 = freeze i32 %subtmp.i.i.2
  %addtmp.i.i.2 = add nuw nsw i32 %odd.012.i.i.2, 2
  %gttmp.i.i.2 = icmp sgt i32 %subtmp.i.fr.i.2, 0
  br i1 %gttmp.i.i.2, label %loopbody.i.i.2, label %isSquare.exit.i.2

isSquare.exit.i.2:                                ; preds = %loopbody.i.i.2
  %eqtmp7.i.i.2 = icmp eq i32 %subtmp.i.fr.i.2, 0
  %addtmp.i.2 = zext i1 %eqtmp7.i.i.2 to i32
  %2 = add nuw nsw i32 %addtmp.i.2, %1
  %addtmp6.i.2 = or disjoint i32 %i.015.i, 3
  br label %loopbody.i.i.3

loopbody.i.i.3:                                   ; preds = %loopbody.i.i.3, %isSquare.exit.i.2
  %n.013.i.i.3 = phi i32 [ %subtmp.i.fr.i.3, %loopbody.i.i.3 ], [ %addtmp6.i.2, %isSquare.exit.i.2 ]
  %odd.012.i.i.3 = phi i32 [ %addtmp.i.i.3, %loopbody.i.i.3 ], [ 1, %isSquare.exit.i.2 ]
  %subtmp.i.i.3 = sub nsw i32 %n.013.i.i.3, %odd.012.i.i.3
  %subtmp.i.fr.i.3 = freeze i32 %subtmp.i.i.3
  %addtmp.i.i.3 = add nuw nsw i32 %odd.012.i.i.3, 2
  %gttmp.i.i.3 = icmp sgt i32 %subtmp.i.fr.i.3, 0
  br i1 %gttmp.i.i.3, label %loopbody.i.i.3, label %isSquare.exit.i.3

isSquare.exit.i.3:                                ; preds = %loopbody.i.i.3
  %eqtmp7.i.i.3 = icmp eq i32 %subtmp.i.fr.i.3, 0
  %addtmp.i.3 = zext i1 %eqtmp7.i.i.3 to i32
  %3 = add nuw nsw i32 %addtmp.i.3, %2
  %addtmp6.i.3 = or disjoint i32 %i.015.i, 4
  br label %loopbody.i.i.4

loopbody.i.i.4:                                   ; preds = %loopbody.i.i.4, %isSquare.exit.i.3
  %n.013.i.i.4 = phi i32 [ %subtmp.i.fr.i.4, %loopbody.i.i.4 ], [ %addtmp6.i.3, %isSquare.exit.i.3 ]
  %odd.012.i.i.4 = phi i32 [ %addtmp.i.i.4, %loopbody.i.i.4 ], [ 1, %isSquare.exit.i.3 ]
  %subtmp.i.i.4 = sub nsw i32 %n.013.i.i.4, %odd.012.i.i.4
  %subtmp.i.fr.i.4 = freeze i32 %subtmp.i.i.4
  %addtmp.i.i.4 = add nuw nsw i32 %odd.012.i.i.4, 2
  %gttmp.i.i.4 = icmp sgt i32 %subtmp.i.fr.i.4, 0
  br i1 %gttmp.i.i.4, label %loopbody.i.i.4, label %isSquare.exit.i.4

isSquare.exit.i.4:                                ; preds = %loopbody.i.i.4
  %eqtmp7.i.i.4 = icmp eq i32 %subtmp.i.fr.i.4, 0
  %addtmp.i.4 = zext i1 %eqtmp7.i.i.4 to i32
  %4 = add nuw nsw i32 %addtmp.i.4, %3
  %addtmp6.i.4 = or disjoint i32 %i.015.i, 5
  br label %loopbody.i.i.5

loopbody.i.i.5:                                   ; preds = %loopbody.i.i.5, %isSquare.exit.i.4
  %n.013.i.i.5 = phi i32 [ %subtmp.i.fr.i.5, %loopbody.i.i.5 ], [ %addtmp6.i.4, %isSquare.exit.i.4 ]
  %odd.012.i.i.5 = phi i32 [ %addtmp.i.i.5, %loopbody.i.i.5 ], [ 1, %isSquare.exit.i.4 ]
  %subtmp.i.i.5 = sub nsw i32 %n.013.i.i.5, %odd.012.i.i.5
  %subtmp.i.fr.i.5 = freeze i32 %subtmp.i.i.5
  %addtmp.i.i.5 = add nuw nsw i32 %odd.012.i.i.5, 2
  %gttmp.i.i.5 = icmp sgt i32 %subtmp.i.fr.i.5, 0
  br i1 %gttmp.i.i.5, label %loopbody.i.i.5, label %isSquare.exit.i.5

isSquare.exit.i.5:                                ; preds = %loopbody.i.i.5
  %eqtmp7.i.i.5 = icmp eq i32 %subtmp.i.fr.i.5, 0
  %addtmp.i.5 = zext i1 %eqtmp7.i.i.5 to i32
  %5 = add nuw nsw i32 %addtmp.i.5, %4
  %addtmp6.i.5 = or disjoint i32 %i.015.i, 6
  br label %loopbody.i.i.6

loopbody.i.i.6:                                   ; preds = %loopbody.i.i.6, %isSquare.exit.i.5
  %n.013.i.i.6 = phi i32 [ %subtmp.i.fr.i.6, %loopbody.i.i.6 ], [ %addtmp6.i.5, %isSquare.exit.i.5 ]
  %odd.012.i.i.6 = phi i32 [ %addtmp.i.i.6, %loopbody.i.i.6 ], [ 1, %isSquare.exit.i.5 ]
  %subtmp.i.i.6 = sub nsw i32 %n.013.i.i.6, %odd.012.i.i.6
  %subtmp.i.fr.i.6 = freeze i32 %subtmp.i.i.6
  %addtmp.i.i.6 = add nuw nsw i32 %odd.012.i.i.6, 2
  %gttmp.i.i.6 = icmp sgt i32 %subtmp.i.fr.i.6, 0
  br i1 %gttmp.i.i.6, label %loopbody.i.i.6, label %isSquare.exit.i.6

isSquare.exit.i.6:                                ; preds = %loopbody.i.i.6
  %eqtmp7.i.i.6 = icmp eq i32 %subtmp.i.fr.i.6, 0
  %addtmp.i.6 = zext i1 %eqtmp7.i.i.6 to i32
  %6 = add nuw nsw i32 %addtmp.i.6, %5
  %addtmp6.i.6 = or disjoint i32 %i.015.i, 7
  br label %loopbody.i.i.7

loopbody.i.i.7:                                   ; preds = %loopbody.i.i.7, %isSquare.exit.i.6
  %n.013.i.i.7 = phi i32 [ %subtmp.i.fr.i.7, %loopbody.i.i.7 ], [ %addtmp6.i.6, %isSquare.exit.i.6 ]
  %odd.012.i.i.7 = phi i32 [ %addtmp.i.i.7, %loopbody.i.i.7 ], [ 1, %isSquare.exit.i.6 ]
  %subtmp.i.i.7 = sub nsw i32 %n.013.i.i.7, %odd.012.i.i.7
  %subtmp.i.fr.i.7 = freeze i32 %subtmp.i.i.7
  %addtmp.i.i.7 = add nuw nsw i32 %odd.012.i.i.7, 2
  %gttmp.i.i.7 = icmp sgt i32 %subtmp.i.fr.i.7, 0
  br i1 %gttmp.i.i.7, label %loopbody.i.i.7, label %isSquare.exit.i.7

isSquare.exit.i.7:                                ; preds = %loopbody.i.i.7
  %eqtmp7.i.i.7 = icmp eq i32 %subtmp.i.fr.i.7, 0
  %addtmp.i.7 = zext i1 %eqtmp7.i.i.7 to i32
  %7 = add nuw nsw i32 %addtmp.i.7, %6
  %addtmp6.i.7 = add nuw nsw i32 %i.015.i, 8
  br label %loopbody.i

squareStress.exit:                                ; preds = %isSquare.exit.thread.i
  %8 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %0)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
