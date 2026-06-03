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
  %a8 = load i32, ptr %a, align 4
  %lttmp = icmp slt i32 %a8, 0
  br i1 %lttmp, label %then, label %else

then:                                             ; preds = %default.next5
  %a9 = load i32, ptr %a, align 4
  %mod10 = load i32, ptr %mod, align 4
  %addtmp = add i32 %a9, %mod10
  store i32 %addtmp, ptr %a, align 4
  br label %ifcont

else:                                             ; preds = %default.next5
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  br label %loopcond

loopcond:                                         ; preds = %ifcont17, %ifcont
  %b11 = load i32, ptr %b, align 4
  %gttmp = icmp sgt i32 %b11, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %b12 = load i32, ptr %b, align 4
  %modtmp13 = srem i32 %b12, 2
  %eqtmp14 = icmp eq i32 %modtmp13, 1
  br i1 %eqtmp14, label %then15, label %else16

loopexit:                                         ; preds = %loopcond
  %result29 = load i32, ptr %result, align 4
  store i32 %result29, ptr %mulMod, align 4
  ret i32 %result29

then15:                                           ; preds = %loopbody
  %result18 = load i32, ptr %result, align 4
  %a19 = load i32, ptr %a, align 4
  %addtmp20 = add i32 %result18, %a19
  %mod21 = load i32, ptr %mod, align 4
  %modtmp22 = srem i32 %addtmp20, %mod21
  store i32 %modtmp22, ptr %result, align 4
  br label %ifcont17

else16:                                           ; preds = %loopbody
  br label %ifcont17

ifcont17:                                         ; preds = %else16, %then15
  %a23 = load i32, ptr %a, align 4
  %a24 = load i32, ptr %a, align 4
  %addtmp25 = add i32 %a23, %a24
  %mod26 = load i32, ptr %mod, align 4
  %modtmp27 = srem i32 %addtmp25, %mod26
  store i32 %modtmp27, ptr %a, align 4
  %b28 = load i32, ptr %b, align 4
  %divtmp = sdiv i32 %b28, 2
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
  store i32 1, ptr %result, align 4
  %base2 = load i32, ptr %base, align 4
  %mod3 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %base2, %mod3
  store i32 %modtmp, ptr %base, align 4
  %base4 = load i32, ptr %base, align 4
  %lttmp = icmp slt i32 %base4, 0
  br i1 %lttmp, label %then, label %else

then:                                             ; preds = %default.next
  %base5 = load i32, ptr %base, align 4
  %mod6 = load i32, ptr %mod, align 4
  %addtmp = add i32 %base5, %mod6
  store i32 %addtmp, ptr %base, align 4
  br label %ifcont

else:                                             ; preds = %default.next
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  br label %loopcond

loopcond:                                         ; preds = %ifcont13, %ifcont
  %exp7 = load i32, ptr %exp, align 4
  %gttmp = icmp sgt i32 %exp7, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %exp8 = load i32, ptr %exp, align 4
  %modtmp9 = srem i32 %exp8, 2
  %eqtmp10 = icmp eq i32 %modtmp9, 1
  br i1 %eqtmp10, label %then11, label %else12

loopexit:                                         ; preds = %loopcond
  %result22 = load i32, ptr %result, align 4
  store i32 %result22, ptr %modExp, align 4
  ret i32 %result22

then11:                                           ; preds = %loopbody
  %result14 = load i32, ptr %result, align 4
  %base15 = load i32, ptr %base, align 4
  %mod16 = load i32, ptr %mod, align 4
  %calltmp = call i32 @mulMod(i32 %result14, i32 %base15, i32 %mod16)
  store i32 %calltmp, ptr %result, align 4
  br label %ifcont13

else12:                                           ; preds = %loopbody
  br label %ifcont13

ifcont13:                                         ; preds = %else12, %then11
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
define noundef range(i32 0, -2147483648) i32 @modInverse(i32 noundef %0, i32 noundef range(i32 2, -2147483648) %1) #0 {
entry:
  %modInverse = alloca i32, align 4
  %mod = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %0, ptr %a, align 4
  store i32 %1, ptr %mod, align 4
  %a1 = load i32, ptr %a, align 4
  %mod2 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %a1, %mod2
  %eqtmp = icmp eq i32 %modtmp, 0
  br i1 %eqtmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i32 0, ptr %modInverse, align 4
  ret i32 0

default.next:                                     ; preds = %entry
  %a3 = load i32, ptr %a, align 4
  %mod4 = load i32, ptr %mod, align 4
  %subtmp = sub i32 %mod4, 2
  %mod5 = load i32, ptr %mod, align 4
  %calltmp = call i32 @modExp(i32 %a3, i32 %subtmp, i32 %mod5)
  store i32 %calltmp, ptr %modInverse, align 4
  ret i32 %calltmp
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @modInverse(i32 3, i32 11)
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
