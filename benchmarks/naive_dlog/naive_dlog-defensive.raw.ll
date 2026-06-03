; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i32 @mulMod(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %result = alloca i32, align 4
  %mod = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %0, ptr %a, align 4
  store i32 %1, ptr %b, align 4
  store i32 %2, ptr %mod, align 4
  store i32 0, ptr %result, align 4
  %a1 = load i32, ptr %a, align 4
  %mod2 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %a1, %mod2
  store i32 %modtmp, ptr %a, align 4
  %a3 = load i32, ptr %a, align 4
  %lttmp = icmp slt i32 %a3, 0
  br i1 %lttmp, label %then, label %else

then:                                             ; preds = %entry
  %a4 = load i32, ptr %a, align 4
  %mod5 = load i32, ptr %mod, align 4
  %addtmp = add i32 %a4, %mod5
  store i32 %addtmp, ptr %a, align 4
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  br label %loopcond

loopcond:                                         ; preds = %ifcont11, %ifcont
  %b6 = load i32, ptr %b, align 4
  %gttmp = icmp sgt i32 %b6, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %b7 = load i32, ptr %b, align 4
  %modtmp8 = srem i32 %b7, 2
  %eqtmp = icmp eq i32 %modtmp8, 1
  br i1 %eqtmp, label %then9, label %else10

loopexit:                                         ; preds = %loopcond
  %result23 = load i32, ptr %result, align 4
  ret i32 %result23

then9:                                            ; preds = %loopbody
  %result12 = load i32, ptr %result, align 4
  %a13 = load i32, ptr %a, align 4
  %addtmp14 = add i32 %result12, %a13
  %mod15 = load i32, ptr %mod, align 4
  %modtmp16 = srem i32 %addtmp14, %mod15
  store i32 %modtmp16, ptr %result, align 4
  br label %ifcont11

else10:                                           ; preds = %loopbody
  br label %ifcont11

ifcont11:                                         ; preds = %else10, %then9
  %a17 = load i32, ptr %a, align 4
  %a18 = load i32, ptr %a, align 4
  %addtmp19 = add i32 %a17, %a18
  %mod20 = load i32, ptr %mod, align 4
  %modtmp21 = srem i32 %addtmp19, %mod20
  store i32 %modtmp21, ptr %a, align 4
  %b22 = load i32, ptr %b, align 4
  %divtmp = sdiv i32 %b22, 2
  store i32 %divtmp, ptr %b, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef i32 @modExp(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %result = alloca i32, align 4
  %mod = alloca i32, align 4
  %exp = alloca i32, align 4
  %base = alloca i32, align 4
  store i32 %0, ptr %base, align 4
  store i32 %1, ptr %exp, align 4
  store i32 %2, ptr %mod, align 4
  store i32 1, ptr %result, align 4
  %base1 = load i32, ptr %base, align 4
  %mod2 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %base1, %mod2
  store i32 %modtmp, ptr %base, align 4
  %base3 = load i32, ptr %base, align 4
  %lttmp = icmp slt i32 %base3, 0
  br i1 %lttmp, label %then, label %else

then:                                             ; preds = %entry
  %base4 = load i32, ptr %base, align 4
  %mod5 = load i32, ptr %mod, align 4
  %addtmp = add i32 %base4, %mod5
  store i32 %addtmp, ptr %base, align 4
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  br label %loopcond

loopcond:                                         ; preds = %ifcont11, %ifcont
  %exp6 = load i32, ptr %exp, align 4
  %gttmp = icmp sgt i32 %exp6, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %exp7 = load i32, ptr %exp, align 4
  %modtmp8 = srem i32 %exp7, 2
  %eqtmp = icmp eq i32 %modtmp8, 1
  br i1 %eqtmp, label %then9, label %else10

loopexit:                                         ; preds = %loopcond
  %result20 = load i32, ptr %result, align 4
  ret i32 %result20

then9:                                            ; preds = %loopbody
  %result12 = load i32, ptr %result, align 4
  %base13 = load i32, ptr %base, align 4
  %mod14 = load i32, ptr %mod, align 4
  %calltmp = call i32 @mulMod(i32 %result12, i32 %base13, i32 %mod14)
  store i32 %calltmp, ptr %result, align 4
  br label %ifcont11

else10:                                           ; preds = %loopbody
  br label %ifcont11

ifcont11:                                         ; preds = %else10, %then9
  %exp15 = load i32, ptr %exp, align 4
  %divtmp = sdiv i32 %exp15, 2
  store i32 %divtmp, ptr %exp, align 4
  %base16 = load i32, ptr %base, align 4
  %base17 = load i32, ptr %base, align 4
  %mod18 = load i32, ptr %mod, align 4
  %calltmp19 = call i32 @mulMod(i32 %base16, i32 %base17, i32 %mod18)
  store i32 %calltmp19, ptr %base, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef i32 @discreteLog(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %x = alloca i32, align 4
  %value = alloca i32, align 4
  %mod = alloca i32, align 4
  %target = alloca i32, align 4
  %base = alloca i32, align 4
  store i32 %0, ptr %base, align 4
  store i32 %1, ptr %target, align 4
  store i32 %2, ptr %mod, align 4
  store i32 1, ptr %value, align 4
  store i32 0, ptr %x, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %entry
  %x1 = load i32, ptr %x, align 4
  %mod2 = load i32, ptr %mod, align 4
  %lttmp = icmp slt i32 %x1, %mod2
  br i1 %lttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %value3 = load i32, ptr %value, align 4
  %target4 = load i32, ptr %target, align 4
  %eqtmp = icmp eq i32 %value3, %target4
  br i1 %eqtmp, label %then, label %else

loopexit:                                         ; preds = %loopcond
  ret i32 -1

then:                                             ; preds = %loopbody
  %x5 = load i32, ptr %x, align 4
  ret i32 %x5

else:                                             ; preds = %loopbody
  br label %ifcont

ifcont:                                           ; preds = %else
  %value6 = load i32, ptr %value, align 4
  %base7 = load i32, ptr %base, align 4
  %mod8 = load i32, ptr %mod, align 4
  %calltmp = call i32 @mulMod(i32 %value6, i32 %base7, i32 %mod8)
  store i32 %calltmp, ptr %value, align 4
  %x9 = load i32, ptr %x, align 4
  %addtmp = add i32 %x9, 1
  store i32 %addtmp, ptr %x, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef i32 @dlogStress() #0 {
entry:
  %res = alloca i32, align 4
  %target = alloca i32, align 4
  %iterations = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %base = alloca i32, align 4
  %modulus = alloca i32, align 4
  store i32 1000003, ptr %modulus, align 4
  store i32 2, ptr %base, align 4
  store i32 0, ptr %sum, align 4
  store i32 1, ptr %i, align 4
  store i32 100000, ptr %iterations, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %entry
  %i1 = load i32, ptr %i, align 4
  %iterations2 = load i32, ptr %iterations, align 4
  %letmp = icmp sle i32 %i1, %iterations2
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %base3 = load i32, ptr %base, align 4
  %i4 = load i32, ptr %i, align 4
  %modulus5 = load i32, ptr %modulus, align 4
  %calltmp = call i32 @modExp(i32 %base3, i32 %i4, i32 %modulus5)
  store i32 %calltmp, ptr %target, align 4
  %base6 = load i32, ptr %base, align 4
  %target7 = load i32, ptr %target, align 4
  %modulus8 = load i32, ptr %modulus, align 4
  %calltmp9 = call i32 @discreteLog(i32 %base6, i32 %target7, i32 %modulus8)
  store i32 %calltmp9, ptr %res, align 4
  %sum10 = load i32, ptr %sum, align 4
  %res11 = load i32, ptr %res, align 4
  %addtmp = add i32 %sum10, %res11
  %modulus12 = load i32, ptr %modulus, align 4
  %modtmp = srem i32 %addtmp, %modulus12
  store i32 %modtmp, ptr %sum, align 4
  %i13 = load i32, ptr %i, align 4
  %addtmp14 = add i32 %i13, 1
  store i32 %addtmp14, ptr %i, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %sum15 = load i32, ptr %sum, align 4
  ret i32 %sum15
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @dlogStress()
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
