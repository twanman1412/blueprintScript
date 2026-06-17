; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit.i.i.1, %entry
  %seed.132.i.i = phi i32 [ 456420, %entry ], [ %result.0.lcssa.i.i.i.1, %mulMod.exit.i.i.1 ]
  %i.031.i.i = phi i32 [ 0, %entry ], [ %addtmp19.i.i.1, %mulMod.exit.i.i.1 ]
  %result.030.i.i = phi i32 [ 0, %entry ], [ %modtmp17.i.i.1, %mulMod.exit.i.i.1 ]
  %gttmp.not26.i.i.i = icmp eq i32 %seed.132.i.i, 0
  br i1 %gttmp.not26.i.i.i, label %mulMod.exit.i.i, label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %loopbody.i.i, %ifcont.i.i.i
  %a.029.i.i.i = phi i32 [ %modtmp14.i.i.i, %ifcont.i.i.i ], [ %seed.132.i.i, %loopbody.i.i ]
  %b.028.i.i.i = phi i32 [ %divtmp25.i.i.i, %ifcont.i.i.i ], [ %seed.132.i.i, %loopbody.i.i ]
  %result.027.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont.i.i.i ], [ 0, %loopbody.i.i ]
  %modtmp5.i.i.i = and i32 %b.028.i.i.i, 1
  %eqtmp.not.i.i.i = icmp eq i32 %modtmp5.i.i.i, 0
  br i1 %eqtmp.not.i.i.i, label %ifcont.i.i.i, label %then.i.i.i

then.i.i.i:                                       ; preds = %loopbody.i.i.i
  %addtmp.i.i.i = add nuw nsw i32 %result.027.i.i.i, %a.029.i.i.i
  %modtmp9.i.i.i = urem i32 %addtmp.i.i.i, 1000003
  br label %ifcont.i.i.i

ifcont.i.i.i:                                     ; preds = %then.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp9.i.i.i, %then.i.i.i ], [ %result.027.i.i.i, %loopbody.i.i.i ]
  %addtmp12.i.i.i = shl nuw nsw i32 %a.029.i.i.i, 1
  %modtmp14.i.i.i = urem i32 %addtmp12.i.i.i, 1000003
  %divtmp25.i.i.i = lshr i32 %b.028.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp25.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %mulMod.exit.i.i, label %loopbody.i.i.i

mulMod.exit.i.i:                                  ; preds = %ifcont.i.i.i, %loopbody.i.i
  %result.0.lcssa.i.i.i = phi i32 [ 0, %loopbody.i.i ], [ %result.1.i.i.i, %ifcont.i.i.i ]
  %modtmp14.i.i = and i32 %result.0.lcssa.i.i.i, 1
  %addtmp15.i.i = add nsw i32 %modtmp14.i.i, %result.030.i.i
  %modtmp17.i.i = srem i32 %addtmp15.i.i, 1000000007
  %gttmp.not26.i.i.i.1 = icmp eq i32 %result.0.lcssa.i.i.i, 0
  br i1 %gttmp.not26.i.i.i.1, label %mulMod.exit.i.i.1, label %loopbody.i.i.i.1

loopbody.i.i.i.1:                                 ; preds = %mulMod.exit.i.i, %ifcont.i.i.i.1
  %a.029.i.i.i.1 = phi i32 [ %modtmp14.i.i.i.1, %ifcont.i.i.i.1 ], [ %result.0.lcssa.i.i.i, %mulMod.exit.i.i ]
  %b.028.i.i.i.1 = phi i32 [ %divtmp25.i.i.i.1, %ifcont.i.i.i.1 ], [ %result.0.lcssa.i.i.i, %mulMod.exit.i.i ]
  %result.027.i.i.i.1 = phi i32 [ %result.1.i.i.i.1, %ifcont.i.i.i.1 ], [ 0, %mulMod.exit.i.i ]
  %modtmp5.i.i.i.1 = and i32 %b.028.i.i.i.1, 1
  %eqtmp.not.i.i.i.1 = icmp eq i32 %modtmp5.i.i.i.1, 0
  br i1 %eqtmp.not.i.i.i.1, label %ifcont.i.i.i.1, label %then.i.i.i.1

then.i.i.i.1:                                     ; preds = %loopbody.i.i.i.1
  %addtmp.i.i.i.1 = add nuw nsw i32 %result.027.i.i.i.1, %a.029.i.i.i.1
  %modtmp9.i.i.i.1 = urem i32 %addtmp.i.i.i.1, 1000003
  br label %ifcont.i.i.i.1

ifcont.i.i.i.1:                                   ; preds = %then.i.i.i.1, %loopbody.i.i.i.1
  %result.1.i.i.i.1 = phi i32 [ %modtmp9.i.i.i.1, %then.i.i.i.1 ], [ %result.027.i.i.i.1, %loopbody.i.i.i.1 ]
  %addtmp12.i.i.i.1 = shl nuw nsw i32 %a.029.i.i.i.1, 1
  %modtmp14.i.i.i.1 = urem i32 %addtmp12.i.i.i.1, 1000003
  %divtmp25.i.i.i.1 = lshr i32 %b.028.i.i.i.1, 1
  %gttmp.not.i.i.i.1 = icmp eq i32 %divtmp25.i.i.i.1, 0
  br i1 %gttmp.not.i.i.i.1, label %mulMod.exit.i.i.1, label %loopbody.i.i.i.1

mulMod.exit.i.i.1:                                ; preds = %ifcont.i.i.i.1, %mulMod.exit.i.i
  %result.0.lcssa.i.i.i.1 = phi i32 [ 0, %mulMod.exit.i.i ], [ %result.1.i.i.i.1, %ifcont.i.i.i.1 ]
  %modtmp14.i.i.1 = and i32 %result.0.lcssa.i.i.i.1, 1
  %addtmp15.i.i.1 = add nsw i32 %modtmp14.i.i.1, %modtmp17.i.i
  %modtmp17.i.i.1 = srem i32 %addtmp15.i.i.1, 1000000007
  %addtmp19.i.i.1 = add nuw nsw i32 %i.031.i.i, 2
  %exitcond.not.i.i.1 = icmp eq i32 %addtmp19.i.i.1, 200000000
  br i1 %exitcond.not.i.i.1, label %bbsStress.exit, label %loopbody.i.i

bbsStress.exit:                                   ; preds = %mulMod.exit.i.i.1
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp17.i.i.1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
