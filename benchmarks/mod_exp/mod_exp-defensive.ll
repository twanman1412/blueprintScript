; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nosync nounwind memory(none)
define noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %loopbody.i.preheader.i

loopbody.i.preheader.i:                           ; preds = %modExp.exit.i, %entry
  %result.017.i = phi i32 [ 0, %entry ], [ %modtmp.i, %modExp.exit.i ]
  %i.016.i = phi i32 [ 1, %entry ], [ %addtmp10.i, %modExp.exit.i ]
  br label %loopbody.i.i

loopbody.i.i:                                     ; preds = %mulMod.exit55.i.i.1, %loopbody.i.preheader.i
  %base.164.i.i = phi i32 [ %i.016.i, %loopbody.i.preheader.i ], [ %result.0.lcssa.i34.i.i.1, %mulMod.exit55.i.i.1 ]
  %exp.063.i.i = phi i32 [ 2147483647, %loopbody.i.preheader.i ], [ %divtmp3260.i.i.1, %mulMod.exit55.i.i.1 ]
  %result.062.i.i = phi i32 [ 1, %loopbody.i.preheader.i ], [ %result.159.i.i.1, %mulMod.exit55.i.i.1 ]
  %modtmp8.i.i = and i32 %exp.063.i.i, 1
  %eqtmp.not.i.i = icmp eq i32 %modtmp8.i.i, 0
  br i1 %eqtmp.not.i.i, label %ifcont11.i.i, label %then9.i.i

then9.i.i:                                        ; preds = %loopbody.i.i
  %gttmp36.i.i.i.not = icmp eq i32 %base.164.i.i, 0
  br i1 %gttmp36.i.i.i.not, label %mulMod.exit55.i.i, label %loopbody.preheader.i.i.i

loopbody.preheader.i.i.i:                         ; preds = %then9.i.i
  %modtmp.i.i.i = srem i32 %result.062.i.i, 1000000007
  %lttmp.i.i.i = icmp slt i32 %modtmp.i.i.i, 0
  %addtmp.i.i.i = add nsw i32 %modtmp.i.i.i, 1000000007
  %spec.select.i.i.i = select i1 %lttmp.i.i.i, i32 %addtmp.i.i.i, i32 %modtmp.i.i.i
  br label %loopbody.i.i.i

loopbody.i.i.i:                                   ; preds = %ifcont11.i.i.i, %loopbody.preheader.i.i.i
  %a.139.i.i.i = phi i32 [ %modtmp21.i.i.i, %ifcont11.i.i.i ], [ %spec.select.i.i.i, %loopbody.preheader.i.i.i ]
  %b.038.i.i.i = phi i32 [ %divtmp35.i.i.i, %ifcont11.i.i.i ], [ %base.164.i.i, %loopbody.preheader.i.i.i ]
  %result.037.i.i.i = phi i32 [ %result.1.i.i.i, %ifcont11.i.i.i ], [ 0, %loopbody.preheader.i.i.i ]
  %modtmp8.i.i.i = and i32 %b.038.i.i.i, 1
  %eqtmp.not.i.i.i = icmp eq i32 %modtmp8.i.i.i, 0
  br i1 %eqtmp.not.i.i.i, label %ifcont11.i.i.i, label %then9.i.i.i

then9.i.i.i:                                      ; preds = %loopbody.i.i.i
  %addtmp14.i.i.i = add nsw i32 %result.037.i.i.i, %a.139.i.i.i
  %modtmp16.i.i.i = srem i32 %addtmp14.i.i.i, 1000000007
  br label %ifcont11.i.i.i

ifcont11.i.i.i:                                   ; preds = %then9.i.i.i, %loopbody.i.i.i
  %result.1.i.i.i = phi i32 [ %modtmp16.i.i.i, %then9.i.i.i ], [ %result.037.i.i.i, %loopbody.i.i.i ]
  %addtmp19.i.i.i = shl nsw i32 %a.139.i.i.i, 1
  %modtmp21.i.i.i = srem i32 %addtmp19.i.i.i, 1000000007
  %divtmp35.i.i.i = lshr i32 %b.038.i.i.i, 1
  %gttmp.not.i.i.i = icmp eq i32 %divtmp35.i.i.i, 0
  br i1 %gttmp.not.i.i.i, label %ifcont11.i.i, label %loopbody.i.i.i

ifcont11.i.i:                                     ; preds = %ifcont11.i.i.i, %loopbody.i.i
  %result.1.i.i = phi i32 [ %result.062.i.i, %loopbody.i.i ], [ %result.1.i.i.i, %ifcont11.i.i.i ]
  %gttmp36.i33.i.i.not = icmp eq i32 %base.164.i.i, 0
  br i1 %gttmp36.i33.i.i.not, label %mulMod.exit55.i.i, label %loopbody.i40.i.i

loopbody.i40.i.i:                                 ; preds = %ifcont11.i.i, %ifcont11.i49.i.i
  %a.139.i41.in.i.i = phi i32 [ %addtmp19.i51.i.i, %ifcont11.i49.i.i ], [ %base.164.i.i, %ifcont11.i.i ]
  %b.038.i42.i.i = phi i32 [ %divtmp35.i53.i.i, %ifcont11.i49.i.i ], [ %base.164.i.i, %ifcont11.i.i ]
  %result.037.i43.i.i = phi i32 [ %result.1.i50.i.i, %ifcont11.i49.i.i ], [ 0, %ifcont11.i.i ]
  %a.139.i41.i.i = urem i32 %a.139.i41.in.i.i, 1000000007
  %modtmp8.i44.i.i = and i32 %b.038.i42.i.i, 1
  %eqtmp.not.i45.i.i = icmp eq i32 %modtmp8.i44.i.i, 0
  br i1 %eqtmp.not.i45.i.i, label %ifcont11.i49.i.i, label %then9.i46.i.i

then9.i46.i.i:                                    ; preds = %loopbody.i40.i.i
  %addtmp14.i47.i.i = add nuw nsw i32 %result.037.i43.i.i, %a.139.i41.i.i
  %modtmp16.i48.i.i = urem i32 %addtmp14.i47.i.i, 1000000007
  br label %ifcont11.i49.i.i

ifcont11.i49.i.i:                                 ; preds = %then9.i46.i.i, %loopbody.i40.i.i
  %result.1.i50.i.i = phi i32 [ %modtmp16.i48.i.i, %then9.i46.i.i ], [ %result.037.i43.i.i, %loopbody.i40.i.i ]
  %addtmp19.i51.i.i = shl nuw nsw i32 %a.139.i41.i.i, 1
  %divtmp35.i53.i.i = lshr i32 %b.038.i42.i.i, 1
  %gttmp.not.i54.i.i = icmp eq i32 %divtmp35.i53.i.i, 0
  br i1 %gttmp.not.i54.i.i, label %mulMod.exit55.i.i, label %loopbody.i40.i.i

mulMod.exit55.i.i:                                ; preds = %ifcont11.i49.i.i, %ifcont11.i.i, %then9.i.i
  %result.159.i.i = phi i32 [ %result.1.i.i, %ifcont11.i.i ], [ 0, %then9.i.i ], [ %result.1.i.i, %ifcont11.i49.i.i ]
  %result.0.lcssa.i34.i.i = phi i32 [ 0, %ifcont11.i.i ], [ 0, %then9.i.i ], [ %result.1.i50.i.i, %ifcont11.i49.i.i ]
  %gttmp.not.i.i = icmp samesign ult i32 %exp.063.i.i, 2
  br i1 %gttmp.not.i.i, label %modExp.exit.i, label %loopbody.i.i.1

loopbody.i.i.1:                                   ; preds = %mulMod.exit55.i.i
  %0 = and i32 %exp.063.i.i, 2
  %eqtmp.not.i.i.1 = icmp eq i32 %0, 0
  br i1 %eqtmp.not.i.i.1, label %ifcont11.i.i.1, label %then9.i.i.1

then9.i.i.1:                                      ; preds = %loopbody.i.i.1
  %gttmp36.i.i.i.1 = icmp sgt i32 %result.0.lcssa.i34.i.i, 0
  br i1 %gttmp36.i.i.i.1, label %loopbody.preheader.i.i.i.1, label %mulMod.exit55.i.i.1

loopbody.preheader.i.i.i.1:                       ; preds = %then9.i.i.1
  %modtmp.i.i.i.1 = srem i32 %result.159.i.i, 1000000007
  %lttmp.i.i.i.1 = icmp slt i32 %modtmp.i.i.i.1, 0
  %addtmp.i.i.i.1 = add nsw i32 %modtmp.i.i.i.1, 1000000007
  %spec.select.i.i.i.1 = select i1 %lttmp.i.i.i.1, i32 %addtmp.i.i.i.1, i32 %modtmp.i.i.i.1
  br label %loopbody.i.i.i.1

loopbody.i.i.i.1:                                 ; preds = %ifcont11.i.i.i.1, %loopbody.preheader.i.i.i.1
  %a.139.i.i.i.1 = phi i32 [ %modtmp21.i.i.i.1, %ifcont11.i.i.i.1 ], [ %spec.select.i.i.i.1, %loopbody.preheader.i.i.i.1 ]
  %b.038.i.i.i.1 = phi i32 [ %divtmp35.i.i.i.1, %ifcont11.i.i.i.1 ], [ %result.0.lcssa.i34.i.i, %loopbody.preheader.i.i.i.1 ]
  %result.037.i.i.i.1 = phi i32 [ %result.1.i.i.i.1, %ifcont11.i.i.i.1 ], [ 0, %loopbody.preheader.i.i.i.1 ]
  %modtmp8.i.i.i.1 = and i32 %b.038.i.i.i.1, 1
  %eqtmp.not.i.i.i.1 = icmp eq i32 %modtmp8.i.i.i.1, 0
  br i1 %eqtmp.not.i.i.i.1, label %ifcont11.i.i.i.1, label %then9.i.i.i.1

then9.i.i.i.1:                                    ; preds = %loopbody.i.i.i.1
  %addtmp14.i.i.i.1 = add nsw i32 %result.037.i.i.i.1, %a.139.i.i.i.1
  %modtmp16.i.i.i.1 = srem i32 %addtmp14.i.i.i.1, 1000000007
  br label %ifcont11.i.i.i.1

ifcont11.i.i.i.1:                                 ; preds = %then9.i.i.i.1, %loopbody.i.i.i.1
  %result.1.i.i.i.1 = phi i32 [ %modtmp16.i.i.i.1, %then9.i.i.i.1 ], [ %result.037.i.i.i.1, %loopbody.i.i.i.1 ]
  %addtmp19.i.i.i.1 = shl nsw i32 %a.139.i.i.i.1, 1
  %modtmp21.i.i.i.1 = srem i32 %addtmp19.i.i.i.1, 1000000007
  %divtmp35.i.i.i.1 = lshr i32 %b.038.i.i.i.1, 1
  %gttmp.not.i.i.i.1 = icmp eq i32 %divtmp35.i.i.i.1, 0
  br i1 %gttmp.not.i.i.i.1, label %ifcont11.i.i.1, label %loopbody.i.i.i.1

ifcont11.i.i.1:                                   ; preds = %ifcont11.i.i.i.1, %loopbody.i.i.1
  %result.1.i.i.1 = phi i32 [ %result.159.i.i, %loopbody.i.i.1 ], [ %result.1.i.i.i.1, %ifcont11.i.i.i.1 ]
  %gttmp36.i33.i.i.1 = icmp sgt i32 %result.0.lcssa.i34.i.i, 0
  br i1 %gttmp36.i33.i.i.1, label %loopbody.i40.i.i.1, label %mulMod.exit55.i.i.1

loopbody.i40.i.i.1:                               ; preds = %ifcont11.i.i.1, %ifcont11.i49.i.i.1
  %a.139.i41.in.i.i.1 = phi i32 [ %addtmp19.i51.i.i.1, %ifcont11.i49.i.i.1 ], [ %result.0.lcssa.i34.i.i, %ifcont11.i.i.1 ]
  %b.038.i42.i.i.1 = phi i32 [ %divtmp35.i53.i.i.1, %ifcont11.i49.i.i.1 ], [ %result.0.lcssa.i34.i.i, %ifcont11.i.i.1 ]
  %result.037.i43.i.i.1 = phi i32 [ %result.1.i50.i.i.1, %ifcont11.i49.i.i.1 ], [ 0, %ifcont11.i.i.1 ]
  %a.139.i41.i.i.1 = urem i32 %a.139.i41.in.i.i.1, 1000000007
  %modtmp8.i44.i.i.1 = and i32 %b.038.i42.i.i.1, 1
  %eqtmp.not.i45.i.i.1 = icmp eq i32 %modtmp8.i44.i.i.1, 0
  br i1 %eqtmp.not.i45.i.i.1, label %ifcont11.i49.i.i.1, label %then9.i46.i.i.1

then9.i46.i.i.1:                                  ; preds = %loopbody.i40.i.i.1
  %addtmp14.i47.i.i.1 = add nuw nsw i32 %result.037.i43.i.i.1, %a.139.i41.i.i.1
  %modtmp16.i48.i.i.1 = urem i32 %addtmp14.i47.i.i.1, 1000000007
  br label %ifcont11.i49.i.i.1

ifcont11.i49.i.i.1:                               ; preds = %then9.i46.i.i.1, %loopbody.i40.i.i.1
  %result.1.i50.i.i.1 = phi i32 [ %modtmp16.i48.i.i.1, %then9.i46.i.i.1 ], [ %result.037.i43.i.i.1, %loopbody.i40.i.i.1 ]
  %addtmp19.i51.i.i.1 = shl nuw nsw i32 %a.139.i41.i.i.1, 1
  %divtmp35.i53.i.i.1 = lshr i32 %b.038.i42.i.i.1, 1
  %gttmp.not.i54.i.i.1 = icmp eq i32 %divtmp35.i53.i.i.1, 0
  br i1 %gttmp.not.i54.i.i.1, label %mulMod.exit55.i.i.1, label %loopbody.i40.i.i.1

mulMod.exit55.i.i.1:                              ; preds = %ifcont11.i49.i.i.1, %ifcont11.i.i.1, %then9.i.i.1
  %result.159.i.i.1 = phi i32 [ %result.1.i.i.1, %ifcont11.i.i.1 ], [ 0, %then9.i.i.1 ], [ %result.1.i.i.1, %ifcont11.i49.i.i.1 ]
  %result.0.lcssa.i34.i.i.1 = phi i32 [ 0, %ifcont11.i.i.1 ], [ 0, %then9.i.i.1 ], [ %result.1.i50.i.i.1, %ifcont11.i49.i.i.1 ]
  %divtmp3260.i.i.1 = lshr i32 %exp.063.i.i, 2
  br label %loopbody.i.i

modExp.exit.i:                                    ; preds = %mulMod.exit55.i.i
  %addtmp.i = add nsw i32 %result.159.i.i, %result.017.i
  %modtmp.i = srem i32 %addtmp.i, 1000000007
  %addtmp10.i = add nuw nsw i32 %i.016.i, 1
  %exitcond.not.i = icmp eq i32 %addtmp10.i, 1000001
  br i1 %exitcond.not.i, label %modExpStress.exit, label %loopbody.i.preheader.i

modExpStress.exit:                                ; preds = %modExp.exit.i
  %1 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %modtmp.i)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "target-cpu"="znver4" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx10.1,+avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,+avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-sha512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,+vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,+gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,+avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,+clzero,+mwaitx,-lwp,+lzcnt,+sha,-movdir64b,-ppx,+wbnoinvd,-enqcmd,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,-avx10.2,+bmi2,+fma,+popcnt,-avxifma,+f16c,+avx512bitalg,+rdpru,+clwb,+mmx,+sse2,+rdseed,+avx512vbmi2,-prefetchi,-amx-movrs,+rdpid,-fma4,+avx512vbmi,+shstk,+vaes,-waitpkg,-sgx,+fxsr,+avx512dq,+sse4a" "tune-cpu"="znver4" }
attributes #1 = { nofree nounwind }
