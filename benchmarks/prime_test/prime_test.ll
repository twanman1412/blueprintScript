; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %default.next.i.i

default.next.i.i:                                 ; preds = %isPrime.exit.i.3, %entry
  %count.016.i = phi i32 [ 0, %entry ], [ %4, %isPrime.exit.i.3 ]
  %i.014.i = phi i32 [ 2, %entry ], [ %addtmp6.i.3, %isPrime.exit.i.3 ]
  %0 = icmp samesign ult i32 %i.014.i, 4
  %addtmp12.i = add nsw i32 %count.016.i, 1
  %1 = select i1 %0, i32 %addtmp12.i, i32 %count.016.i
  %addtmp6.i = or disjoint i32 %i.014.i, 1
  %2 = icmp samesign ult i32 %i.014.i, 4
  %letmp20.not39.i.i.1 = icmp samesign ult i32 %addtmp6.i, 9
  %or.cond = select i1 %2, i1 true, i1 %letmp20.not39.i.i.1
  br i1 %or.cond, label %.loopexit.i.1, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %default.next.i.i, %loopcond.i.i.1
  %i.040.i.i.1 = phi i32 [ %addtmp.i.i.1, %loopcond.i.i.1 ], [ 3, %default.next.i.i ]
  %modtmp23.i.i.1 = urem i32 %addtmp6.i, %i.040.i.i.1
  %eqtmp24.not.i.i.1 = icmp eq i32 %modtmp23.i.i.1, 0
  br i1 %eqtmp24.not.i.i.1, label %isPrime.exit.i.2, label %loopcond.i.i.1

loopcond.i.i.1:                                   ; preds = %loopbody.i.i.1
  %addtmp.i.i.1 = add nuw nsw i32 %i.040.i.i.1, 2
  %divtmp.i.i.1 = udiv i32 %addtmp6.i, %addtmp.i.i.1
  %letmp20.not.i.i.1 = icmp samesign ugt i32 %addtmp.i.i.1, %divtmp.i.i.1
  br i1 %letmp20.not.i.i.1, label %.loopexit.i.1, label %loopbody.i.i.1

.loopexit.i.1:                                    ; preds = %loopcond.i.i.1, %default.next.i.i
  %addtmp12.i.1 = add nsw i32 %1, 1
  br label %isPrime.exit.i.2

isPrime.exit.i.2:                                 ; preds = %loopbody.i.i.1, %.loopexit.i.1
  %3 = phi i32 [ %addtmp12.i.1, %.loopexit.i.1 ], [ %1, %loopbody.i.i.1 ]
  %addtmp6.i.2 = add nuw nsw i32 %i.014.i, 3
  %exitcond.not.i.2 = icmp eq i32 %addtmp6.i.2, 50000001
  br i1 %exitcond.not.i.2, label %primeStress.exit, label %loopcond.preheader.i.i.3

loopcond.preheader.i.i.3:                         ; preds = %isPrime.exit.i.2
  %letmp20.not39.i.i.3 = icmp samesign ult i32 %i.014.i, 6
  br i1 %letmp20.not39.i.i.3, label %.loopexit.i.3, label %loopbody.i.i.3

loopbody.i.i.3:                                   ; preds = %loopcond.preheader.i.i.3, %loopcond.i.i.3
  %i.040.i.i.3 = phi i32 [ %addtmp.i.i.3, %loopcond.i.i.3 ], [ 3, %loopcond.preheader.i.i.3 ]
  %modtmp23.i.i.3 = urem i32 %addtmp6.i.2, %i.040.i.i.3
  %eqtmp24.not.i.i.3 = icmp eq i32 %modtmp23.i.i.3, 0
  br i1 %eqtmp24.not.i.i.3, label %isPrime.exit.i.3, label %loopcond.i.i.3

loopcond.i.i.3:                                   ; preds = %loopbody.i.i.3
  %addtmp.i.i.3 = add nuw nsw i32 %i.040.i.i.3, 2
  %divtmp.i.i.3 = udiv i32 %addtmp6.i.2, %addtmp.i.i.3
  %letmp20.not.i.i.3 = icmp samesign ugt i32 %addtmp.i.i.3, %divtmp.i.i.3
  br i1 %letmp20.not.i.i.3, label %.loopexit.i.3, label %loopbody.i.i.3

.loopexit.i.3:                                    ; preds = %loopcond.i.i.3, %loopcond.preheader.i.i.3
  %addtmp12.i.3 = add nsw i32 %3, 1
  br label %isPrime.exit.i.3

isPrime.exit.i.3:                                 ; preds = %loopbody.i.i.3, %.loopexit.i.3
  %4 = phi i32 [ %addtmp12.i.3, %.loopexit.i.3 ], [ %3, %loopbody.i.i.3 ]
  %addtmp6.i.3 = add nuw nsw i32 %i.014.i, 4
  br label %default.next.i.i

primeStress.exit:                                 ; preds = %isPrime.exit.i.2
  %5 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %3)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
