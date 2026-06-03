; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i1 @isPrime(i32 noundef range(i32 0, -2147483648) %0) #0 {
entry:
  %i = alloca i32, align 4
  %isPrime = alloca i1, align 1
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %n1 = load i32, ptr %n, align 4
  %letmp = icmp sle i32 %n1, 1
  br i1 %letmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i1 false, ptr %isPrime, align 1
  ret i1 false

default.next:                                     ; preds = %entry
  %n2 = load i32, ptr %n, align 4
  %eqtmp = icmp eq i32 %n2, 2
  br i1 %eqtmp, label %default.return3, label %default.next4

default.return3:                                  ; preds = %default.next
  store i1 true, ptr %isPrime, align 1
  ret i1 true

default.next4:                                    ; preds = %default.next
  %n5 = load i32, ptr %n, align 4
  %letmp6 = icmp sle i32 %n5, 1
  br i1 %letmp6, label %then, label %else

then:                                             ; preds = %default.next4
  store i1 false, ptr %isPrime, align 1
  ret i1 false

else:                                             ; preds = %default.next4
  br label %ifcont

ifcont:                                           ; preds = %else
  %n7 = load i32, ptr %n, align 4
  %letmp8 = icmp sle i32 %n7, 3
  br i1 %letmp8, label %then9, label %else10

then9:                                            ; preds = %ifcont
  store i1 true, ptr %isPrime, align 1
  ret i1 true

else10:                                           ; preds = %ifcont
  br label %ifcont11

ifcont11:                                         ; preds = %else10
  %n12 = load i32, ptr %n, align 4
  %modtmp = srem i32 %n12, 2
  %eqtmp13 = icmp eq i32 %modtmp, 0
  br i1 %eqtmp13, label %then14, label %else15

then14:                                           ; preds = %ifcont11
  store i1 false, ptr %isPrime, align 1
  ret i1 false

else15:                                           ; preds = %ifcont11
  br label %ifcont16

ifcont16:                                         ; preds = %else15
  store i32 3, ptr %i, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont27, %ifcont16
  %i17 = load i32, ptr %i, align 4
  %n18 = load i32, ptr %n, align 4
  %i19 = load i32, ptr %i, align 4
  %divtmp = sdiv i32 %n18, %i19
  %letmp20 = icmp sle i32 %i17, %divtmp
  br i1 %letmp20, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %n21 = load i32, ptr %n, align 4
  %i22 = load i32, ptr %i, align 4
  %modtmp23 = srem i32 %n21, %i22
  %eqtmp24 = icmp eq i32 %modtmp23, 0
  br i1 %eqtmp24, label %then25, label %else26

loopexit:                                         ; preds = %loopcond
  store i1 true, ptr %isPrime, align 1
  ret i1 true

then25:                                           ; preds = %loopbody
  store i1 false, ptr %isPrime, align 1
  ret i1 false

else26:                                           ; preds = %loopbody
  br label %ifcont27

ifcont27:                                         ; preds = %else26
  %i28 = load i32, ptr %i, align 4
  %addtmp = add i32 %i28, 2
  store i32 %addtmp, ptr %i, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef i32 @primeStress() #0 {
entry:
  %limit = alloca i32, align 4
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  store i32 0, ptr %count, align 4
  store i32 2, ptr %i, align 4
  store i32 50000000, ptr %limit, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %entry
  %i1 = load i32, ptr %i, align 4
  %limit2 = load i32, ptr %limit, align 4
  %letmp = icmp sle i32 %i1, %limit2
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %i3 = load i32, ptr %i, align 4
  %calltmp = call i1 @isPrime(i32 %i3)
  br i1 %calltmp, label %then, label %else

loopexit:                                         ; preds = %loopcond
  %count7 = load i32, ptr %count, align 4
  ret i32 %count7

then:                                             ; preds = %loopbody
  %count4 = load i32, ptr %count, align 4
  %addtmp = add i32 %count4, 1
  store i32 %addtmp, ptr %count, align 4
  br label %ifcont

else:                                             ; preds = %loopbody
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %i5 = load i32, ptr %i, align 4
  %addtmp6 = add i32 %i5, 1
  store i32 %addtmp6, ptr %i, align 4
  br label %loopcond
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @primeStress()
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
