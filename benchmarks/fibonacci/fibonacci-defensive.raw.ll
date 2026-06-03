; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i32 @fibonacci(i32 noundef %0) #0 {
entry:
  %res = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %n1 = load i32, ptr %n, align 4
  %letmp = icmp sle i32 %n1, 0
  br i1 %letmp, label %then, label %else

then:                                             ; preds = %entry
  ret i32 0

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else
  %n2 = load i32, ptr %n, align 4
  %eqtmp = icmp eq i32 %n2, 1
  br i1 %eqtmp, label %then3, label %else4

then3:                                            ; preds = %ifcont
  ret i32 1

else4:                                            ; preds = %ifcont
  br label %ifcont5

ifcont5:                                          ; preds = %else4
  %n6 = load i32, ptr %n, align 4
  %subtmp = sub i32 %n6, 1
  %calltmp = call i32 @fibonacci(i32 %subtmp)
  %n7 = load i32, ptr %n, align 4
  %subtmp8 = sub i32 %n7, 2
  %calltmp9 = call i32 @fibonacci(i32 %subtmp8)
  %addtmp = add i32 %calltmp, %calltmp9
  store i32 %addtmp, ptr %res, align 4
  %res10 = load i32, ptr %res, align 4
  ret i32 %res10
}

; Function Attrs: nounwind willreturn
define noundef i32 @fibonacciStress() #0 {
entry:
  %i = alloca i32, align 4
  %iterations = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, ptr %result, align 4
  store i32 45, ptr %iterations, align 4
  store i32 0, ptr %i, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %entry
  %i1 = load i32, ptr %i, align 4
  %iterations2 = load i32, ptr %iterations, align 4
  %letmp = icmp sle i32 %i1, %iterations2
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %result3 = load i32, ptr %result, align 4
  %i4 = load i32, ptr %i, align 4
  %calltmp = call i32 @fibonacci(i32 %i4)
  %addtmp = add i32 %result3, %calltmp
  store i32 %addtmp, ptr %result, align 4
  %i5 = load i32, ptr %i, align 4
  %addtmp6 = add i32 %i5, 1
  store i32 %addtmp6, ptr %i, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %result7 = load i32, ptr %result, align 4
  ret i32 %result7
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @fibonacciStress()
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
