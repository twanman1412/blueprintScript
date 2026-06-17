; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define internal fastcc noundef i32 @fibonacci(i32 noundef range(i32 -2147483648, 46) %0) unnamed_addr #0 {
entry:
  %letmp14 = icmp slt i32 %0, 1
  br i1 %letmp14, label %common.ret, label %ifcont

common.ret.loopexit:                              ; preds = %ifcont, %ifcont5
  %accumulator.tr.lcssa.ph = phi i32 [ %addtmp, %ifcont5 ], [ %accumulator.tr15, %ifcont ]
  %common.ret.op.ph = phi i32 [ 0, %ifcont5 ], [ 1, %ifcont ]
  %1 = add nsw i32 %common.ret.op.ph, %accumulator.tr.lcssa.ph
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
  %calltmp = tail call fastcc noundef i32 @fibonacci(i32 noundef %subtmp)
  %subtmp8 = add nsw i32 %.tr16, -2
  %addtmp = add nsw i32 %calltmp, %accumulator.tr15
  %letmp = icmp samesign ult i32 %.tr16, 3
  br i1 %letmp, label %common.ret.loopexit, label %ifcont
}

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  %calltmp.1.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 1)
  %calltmp.2.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 2)
  %addtmp.2.i = add nsw i32 %calltmp.2.i, %calltmp.1.i
  %calltmp.3.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 3)
  %addtmp.3.i = add nsw i32 %addtmp.2.i, %calltmp.3.i
  %calltmp.4.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 4)
  %addtmp.4.i = add nsw i32 %addtmp.3.i, %calltmp.4.i
  %calltmp.5.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 5)
  %addtmp.5.i = add nsw i32 %addtmp.4.i, %calltmp.5.i
  %calltmp.6.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 6)
  %addtmp.6.i = add nsw i32 %addtmp.5.i, %calltmp.6.i
  %calltmp.7.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 7)
  %addtmp.7.i = add nsw i32 %addtmp.6.i, %calltmp.7.i
  %calltmp.8.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 8)
  %addtmp.8.i = add nsw i32 %addtmp.7.i, %calltmp.8.i
  %calltmp.9.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 9)
  %addtmp.9.i = add nsw i32 %addtmp.8.i, %calltmp.9.i
  %calltmp.10.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 10)
  %addtmp.10.i = add nsw i32 %addtmp.9.i, %calltmp.10.i
  %calltmp.11.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 11)
  %addtmp.11.i = add nsw i32 %addtmp.10.i, %calltmp.11.i
  %calltmp.12.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 12)
  %addtmp.12.i = add nsw i32 %addtmp.11.i, %calltmp.12.i
  %calltmp.13.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 13)
  %addtmp.13.i = add nsw i32 %addtmp.12.i, %calltmp.13.i
  %calltmp.14.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 14)
  %addtmp.14.i = add nsw i32 %addtmp.13.i, %calltmp.14.i
  %calltmp.15.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 15)
  %addtmp.15.i = add nsw i32 %addtmp.14.i, %calltmp.15.i
  %calltmp.16.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 16)
  %addtmp.16.i = add nsw i32 %addtmp.15.i, %calltmp.16.i
  %calltmp.17.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 17)
  %addtmp.17.i = add nsw i32 %addtmp.16.i, %calltmp.17.i
  %calltmp.18.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 18)
  %addtmp.18.i = add nsw i32 %addtmp.17.i, %calltmp.18.i
  %calltmp.19.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 19)
  %addtmp.19.i = add nsw i32 %addtmp.18.i, %calltmp.19.i
  %calltmp.20.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 20)
  %addtmp.20.i = add nsw i32 %addtmp.19.i, %calltmp.20.i
  %calltmp.21.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 21)
  %addtmp.21.i = add nsw i32 %addtmp.20.i, %calltmp.21.i
  %calltmp.22.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 22)
  %addtmp.22.i = add nsw i32 %addtmp.21.i, %calltmp.22.i
  %calltmp.23.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 23)
  %addtmp.23.i = add nsw i32 %addtmp.22.i, %calltmp.23.i
  %calltmp.24.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 24)
  %addtmp.24.i = add nsw i32 %addtmp.23.i, %calltmp.24.i
  %calltmp.25.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 25)
  %addtmp.25.i = add nsw i32 %addtmp.24.i, %calltmp.25.i
  %calltmp.26.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 26)
  %addtmp.26.i = add nsw i32 %addtmp.25.i, %calltmp.26.i
  %calltmp.27.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 27)
  %addtmp.27.i = add nsw i32 %addtmp.26.i, %calltmp.27.i
  %calltmp.28.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 28)
  %addtmp.28.i = add nsw i32 %addtmp.27.i, %calltmp.28.i
  %calltmp.29.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 29)
  %addtmp.29.i = add nsw i32 %addtmp.28.i, %calltmp.29.i
  %calltmp.30.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 30)
  %addtmp.30.i = add nsw i32 %addtmp.29.i, %calltmp.30.i
  %calltmp.31.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 31)
  %addtmp.31.i = add nsw i32 %addtmp.30.i, %calltmp.31.i
  %calltmp.32.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 32)
  %addtmp.32.i = add nsw i32 %addtmp.31.i, %calltmp.32.i
  %calltmp.33.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 33)
  %addtmp.33.i = add nsw i32 %addtmp.32.i, %calltmp.33.i
  %calltmp.34.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 34)
  %addtmp.34.i = add nsw i32 %addtmp.33.i, %calltmp.34.i
  %calltmp.35.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 35)
  %addtmp.35.i = add nsw i32 %addtmp.34.i, %calltmp.35.i
  %calltmp.36.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 36)
  %addtmp.36.i = add nsw i32 %addtmp.35.i, %calltmp.36.i
  %calltmp.37.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 37)
  %addtmp.37.i = add nsw i32 %addtmp.36.i, %calltmp.37.i
  %calltmp.38.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 38)
  %addtmp.38.i = add nsw i32 %addtmp.37.i, %calltmp.38.i
  %calltmp.39.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 39)
  %addtmp.39.i = add nsw i32 %addtmp.38.i, %calltmp.39.i
  %calltmp.40.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 40)
  %addtmp.40.i = add nsw i32 %addtmp.39.i, %calltmp.40.i
  %calltmp.41.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 41)
  %addtmp.41.i = add nsw i32 %addtmp.40.i, %calltmp.41.i
  %calltmp.42.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 42)
  %addtmp.42.i = add nsw i32 %addtmp.41.i, %calltmp.42.i
  %calltmp.43.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 43)
  %addtmp.43.i = add nsw i32 %addtmp.42.i, %calltmp.43.i
  %calltmp.44.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 44)
  %addtmp.44.i = add nsw i32 %addtmp.43.i, %calltmp.44.i
  %calltmp.45.i = tail call fastcc noundef i32 @fibonacci(i32 noundef 45)
  %addtmp.45.i = add nsw i32 %addtmp.44.i, %calltmp.45.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %addtmp.45.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #2 = { nofree nounwind }
