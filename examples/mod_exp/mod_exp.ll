; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
loopbody.i38.2.i.preheader:
  br label %loopbody.i.3.i

loopbody.i.3.i:                                   ; preds = %loopbody.i38.2.i.preheader, %ifcont.i.3.i
  %a.038.in.i.3.i = phi i32 [ %addtmp18.i.3.i, %ifcont.i.3.i ], [ 4, %loopbody.i38.2.i.preheader ]
  %b.037.i.3.i = phi i32 [ %divtmp34.i.3.i, %ifcont.i.3.i ], [ 256, %loopbody.i38.2.i.preheader ]
  %result.036.i.3.i = phi i32 [ %result.1.i.3.i, %ifcont.i.3.i ], [ 0, %loopbody.i38.2.i.preheader ]
  %a.038.i.3.i = srem i32 %a.038.in.i.3.i, 1000
  %modtmp10.i.3.i = and i32 %b.037.i.3.i, 1
  %eqtmp11.not.i.3.i = icmp eq i32 %modtmp10.i.3.i, 0
  br i1 %eqtmp11.not.i.3.i, label %ifcont.i.3.i, label %then.i.3.i

then.i.3.i:                                       ; preds = %loopbody.i.3.i
  %addtmp.i.3.i = add nsw i32 %result.036.i.3.i, %a.038.i.3.i
  %modtmp15.i.3.i = srem i32 %addtmp.i.3.i, 1000
  br label %ifcont.i.3.i

ifcont.i.3.i:                                     ; preds = %then.i.3.i, %loopbody.i.3.i
  %result.1.i.3.i = phi i32 [ %modtmp15.i.3.i, %then.i.3.i ], [ %result.036.i.3.i, %loopbody.i.3.i ]
  %addtmp18.i.3.i = shl nsw i32 %a.038.i.3.i, 1
  %divtmp34.i.3.i = lshr i32 %b.037.i.3.i, 1
  %gttmp.not.i.3.i = icmp eq i32 %divtmp34.i.3.i, 0
  br i1 %gttmp.not.i.3.i, label %modExp.exit, label %loopbody.i.3.i

modExp.exit:                                      ; preds = %ifcont.i.3.i
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %result.1.i.3.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
