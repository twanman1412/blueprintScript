; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i32 @intSqrt(i32 noundef %0) #0 {
entry:
  %mid = alloca i32, align 4
  %result = alloca i32, align 4
  %high = alloca i32, align 4
  %low = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 0, ptr %low, align 4
  %n1 = load i32, ptr %n, align 4
  store i32 %n1, ptr %high, align 4
  store i32 0, ptr %result, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %entry
  %low2 = load i32, ptr %low, align 4
  %high3 = load i32, ptr %high, align 4
  %letmp = icmp sle i32 %low2, %high3
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %low4 = load i32, ptr %low, align 4
  %high5 = load i32, ptr %high, align 4
  %low6 = load i32, ptr %low, align 4
  %subtmp = sub i32 %high5, %low6
  %divtmp = sdiv i32 %subtmp, 2
  %addtmp = add i32 %low4, %divtmp
  store i32 %addtmp, ptr %mid, align 4
  %mid7 = load i32, ptr %mid, align 4
  %eqtmp = icmp eq i32 %mid7, 0
  br i1 %eqtmp, label %then, label %else

loopexit:                                         ; preds = %loopcond
  %result21 = load i32, ptr %result, align 4
  ret i32 %result21

then:                                             ; preds = %loopbody
  store i32 0, ptr %result, align 4
  store i32 1, ptr %low, align 4
  br label %ifcont

else:                                             ; preds = %loopbody
  %mid8 = load i32, ptr %mid, align 4
  %n9 = load i32, ptr %n, align 4
  %mid10 = load i32, ptr %mid, align 4
  %divtmp11 = sdiv i32 %n9, %mid10
  %letmp12 = icmp sle i32 %mid8, %divtmp11
  br i1 %letmp12, label %then13, label %else14

ifcont:                                           ; preds = %ifcont15, %then
  br label %loopcond

then13:                                           ; preds = %else
  %mid16 = load i32, ptr %mid, align 4
  store i32 %mid16, ptr %result, align 4
  %mid17 = load i32, ptr %mid, align 4
  %addtmp18 = add i32 %mid17, 1
  store i32 %addtmp18, ptr %low, align 4
  br label %ifcont15

else14:                                           ; preds = %else
  %mid19 = load i32, ptr %mid, align 4
  %subtmp20 = sub i32 %mid19, 1
  store i32 %subtmp20, ptr %high, align 4
  br label %ifcont15

ifcont15:                                         ; preds = %else14, %then13
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
