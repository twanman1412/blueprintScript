; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef range(i32 0, -2147483648) i32 @mulMod(i32 noundef %0, i32 noundef range(i32 0, -2147483648) %1, i32 noundef range(i32 2, -2147483648) %2) #0 {
entry:
  %result = alloca i32, align 4
  %mulMod = alloca i32, align 4
  %mod = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %0, ptr %a, align 4
  store i32 %1, ptr %b, align 4
  store i32 %2, ptr %mod, align 4
  %a1 = load i32, ptr %a, align 4
  %eqtmp = icmp eq i32 %a1, 0
  br i1 %eqtmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i32 0, ptr %mulMod, align 4
  ret i32 0

default.next:                                     ; preds = %entry
  %b2 = load i32, ptr %b, align 4
  %eqtmp3 = icmp eq i32 %b2, 0
  br i1 %eqtmp3, label %default.return4, label %default.next5

default.return4:                                  ; preds = %default.next
  store i32 0, ptr %mulMod, align 4
  ret i32 0

default.next5:                                    ; preds = %default.next
  store i32 0, ptr %result, align 4
  %a6 = load i32, ptr %a, align 4
  %mod7 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %a6, %mod7
  store i32 %modtmp, ptr %a, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %default.next5
  %b8 = load i32, ptr %b, align 4
  %gttmp = icmp sgt i32 %b8, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %b9 = load i32, ptr %b, align 4
  %modtmp10 = srem i32 %b9, 2
  %eqtmp11 = icmp eq i32 %modtmp10, 1
  br i1 %eqtmp11, label %then, label %else

loopexit:                                         ; preds = %loopcond
  %result22 = load i32, ptr %result, align 4
  store i32 %result22, ptr %mulMod, align 4
  ret i32 %result22

then:                                             ; preds = %loopbody
  %result12 = load i32, ptr %result, align 4
  %a13 = load i32, ptr %a, align 4
  %addtmp = add i32 %result12, %a13
  %mod14 = load i32, ptr %mod, align 4
  %modtmp15 = srem i32 %addtmp, %mod14
  store i32 %modtmp15, ptr %result, align 4
  br label %ifcont

else:                                             ; preds = %loopbody
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %a16 = load i32, ptr %a, align 4
  %a17 = load i32, ptr %a, align 4
  %addtmp18 = add i32 %a16, %a17
  %mod19 = load i32, ptr %mod, align 4
  %modtmp20 = srem i32 %addtmp18, %mod19
  store i32 %modtmp20, ptr %a, align 4
  %b21 = load i32, ptr %b, align 4
  %divtmp = sdiv i32 %b21, 2
  store i32 %divtmp, ptr %b, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef range(i32 0, -2147483648) i32 @modExp(i32 noundef %0, i32 noundef range(i32 0, -2147483648) %1, i32 noundef range(i32 2, -2147483648) %2) #0 {
entry:
  %result = alloca i32, align 4
  %modExp = alloca i32, align 4
  %mod = alloca i32, align 4
  %exp = alloca i32, align 4
  %base = alloca i32, align 4
  store i32 %0, ptr %base, align 4
  store i32 %1, ptr %exp, align 4
  store i32 %2, ptr %mod, align 4
  %exp1 = load i32, ptr %exp, align 4
  %eqtmp = icmp eq i32 %exp1, 0
  br i1 %eqtmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i32 1, ptr %modExp, align 4
  ret i32 1

default.next:                                     ; preds = %entry
  %base2 = load i32, ptr %base, align 4
  %mod3 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %base2, %mod3
  %eqtmp4 = icmp eq i32 %modtmp, 0
  br i1 %eqtmp4, label %default.return5, label %default.next6

default.return5:                                  ; preds = %default.next
  store i32 0, ptr %modExp, align 4
  ret i32 0

default.next6:                                    ; preds = %default.next
  store i32 1, ptr %result, align 4
  %base7 = load i32, ptr %base, align 4
  %mod8 = load i32, ptr %mod, align 4
  %modtmp9 = srem i32 %base7, %mod8
  store i32 %modtmp9, ptr %base, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %default.next6
  %exp10 = load i32, ptr %exp, align 4
  %gttmp = icmp sgt i32 %exp10, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %exp11 = load i32, ptr %exp, align 4
  %modtmp12 = srem i32 %exp11, 2
  %eqtmp13 = icmp eq i32 %modtmp12, 1
  br i1 %eqtmp13, label %then, label %else

loopexit:                                         ; preds = %loopcond
  %result22 = load i32, ptr %result, align 4
  store i32 %result22, ptr %modExp, align 4
  ret i32 %result22

then:                                             ; preds = %loopbody
  %result14 = load i32, ptr %result, align 4
  %base15 = load i32, ptr %base, align 4
  %mod16 = load i32, ptr %mod, align 4
  %calltmp = call i32 @mulMod(i32 %result14, i32 %base15, i32 %mod16)
  store i32 %calltmp, ptr %result, align 4
  br label %ifcont

else:                                             ; preds = %loopbody
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %exp17 = load i32, ptr %exp, align 4
  %divtmp = sdiv i32 %exp17, 2
  store i32 %divtmp, ptr %exp, align 4
  %base18 = load i32, ptr %base, align 4
  %base19 = load i32, ptr %base, align 4
  %mod20 = load i32, ptr %mod, align 4
  %calltmp21 = call i32 @mulMod(i32 %base18, i32 %base19, i32 %mod20)
  store i32 %calltmp21, ptr %base, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef i32 @modExpStress() #0 {
entry:
  %currentMod = alloca i32, align 4
  %i = alloca i32, align 4
  %iterations = alloca i32, align 4
  %modulus = alloca i32, align 4
  %maxExponent = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, ptr %result, align 4
  store i32 2147483647, ptr %maxExponent, align 4
  store i32 1000000007, ptr %modulus, align 4
  store i32 1000000, ptr %iterations, align 4
  store i32 1, ptr %i, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %entry
  %i1 = load i32, ptr %i, align 4
  %iterations2 = load i32, ptr %iterations, align 4
  %letmp = icmp sle i32 %i1, %iterations2
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %i3 = load i32, ptr %i, align 4
  %maxExponent4 = load i32, ptr %maxExponent, align 4
  %modulus5 = load i32, ptr %modulus, align 4
  %calltmp = call i32 @modExp(i32 %i3, i32 %maxExponent4, i32 %modulus5)
  store i32 %calltmp, ptr %currentMod, align 4
  %result6 = load i32, ptr %result, align 4
  %currentMod7 = load i32, ptr %currentMod, align 4
  %addtmp = add i32 %result6, %currentMod7
  %modulus8 = load i32, ptr %modulus, align 4
  %modtmp = srem i32 %addtmp, %modulus8
  store i32 %modtmp, ptr %result, align 4
  %i9 = load i32, ptr %i, align 4
  %addtmp10 = add i32 %i9, 1
  store i32 %addtmp10, ptr %i, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %result11 = load i32, ptr %result, align 4
  ret i32 %result11
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @modExpStress()
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
