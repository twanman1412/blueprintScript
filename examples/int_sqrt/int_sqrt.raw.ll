; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef range(i32 0, -2147483648) i32 @intSqrt(i32 noundef range(i32 0, -2147483648) %0) #0 {
entry:
  %mid = alloca i32, align 4
  %result = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %intSqrt = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %n1 = load i32, ptr %n, align 4
  %eqtmp = icmp eq i32 %n1, 0
  br i1 %eqtmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i32 0, ptr %intSqrt, align 4
  ret i32 0

default.next:                                     ; preds = %entry
  store i32 0, ptr %low, align 4
  %n2 = load i32, ptr %n, align 4
  store i32 %n2, ptr %high, align 4
  store i32 0, ptr %result, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %default.next
  %low3 = load i32, ptr %low, align 4
  %high4 = load i32, ptr %high, align 4
  %letmp = icmp sle i32 %low3, %high4
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %low5 = load i32, ptr %low, align 4
  %high6 = load i32, ptr %high, align 4
  %low7 = load i32, ptr %low, align 4
  %subtmp = sub i32 %high6, %low7
  %divtmp = sdiv i32 %subtmp, 2
  %addtmp = add i32 %low5, %divtmp
  store i32 %addtmp, ptr %mid, align 4
  %mid8 = load i32, ptr %mid, align 4
  %eqtmp9 = icmp eq i32 %mid8, 0
  br i1 %eqtmp9, label %then, label %else

loopexit:                                         ; preds = %loopcond
  %result23 = load i32, ptr %result, align 4
  store i32 %result23, ptr %intSqrt, align 4
  ret i32 %result23

then:                                             ; preds = %loopbody
  store i32 0, ptr %result, align 4
  store i32 1, ptr %low, align 4
  br label %ifcont

else:                                             ; preds = %loopbody
  %mid10 = load i32, ptr %mid, align 4
  %n11 = load i32, ptr %n, align 4
  %mid12 = load i32, ptr %mid, align 4
  %divtmp13 = sdiv i32 %n11, %mid12
  %letmp14 = icmp sle i32 %mid10, %divtmp13
  br i1 %letmp14, label %then15, label %else16

ifcont:                                           ; preds = %ifcont17, %then
  br label %loopcond

then15:                                           ; preds = %else
  %mid18 = load i32, ptr %mid, align 4
  store i32 %mid18, ptr %result, align 4
  %mid19 = load i32, ptr %mid, align 4
  %addtmp20 = add i32 %mid19, 1
  store i32 %addtmp20, ptr %low, align 4
  br label %ifcont17

else16:                                           ; preds = %else
  %mid21 = load i32, ptr %mid, align 4
  %subtmp22 = sub i32 %mid21, 1
  store i32 %subtmp22, ptr %high, align 4
  br label %ifcont17

ifcont17:                                         ; preds = %else16, %then15
  br label %ifcont
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @intSqrt(i32 70)
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
