; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i1 @isSquare(i32 noundef %0) #0 {
entry:
  %odd = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  store i32 1, ptr %odd, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %entry
  %n1 = load i32, ptr %n, align 4
  %gttmp = icmp sgt i32 %n1, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %n2 = load i32, ptr %n, align 4
  %odd3 = load i32, ptr %odd, align 4
  %subtmp = sub i32 %n2, %odd3
  store i32 %subtmp, ptr %n, align 4
  %odd4 = load i32, ptr %odd, align 4
  %addtmp = add i32 %odd4, 2
  store i32 %addtmp, ptr %odd, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %n5 = load i32, ptr %n, align 4
  %eqtmp = icmp eq i32 %n5, 0
  ret i1 %eqtmp
}

; Function Attrs: nounwind willreturn
define noundef i32 @squareStress() #0 {
entry:
  %limit = alloca i32, align 4
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  store i32 0, ptr %count, align 4
  store i32 0, ptr %i, align 4
  store i32 10000000, ptr %limit, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %entry
  %i1 = load i32, ptr %i, align 4
  %limit2 = load i32, ptr %limit, align 4
  %letmp = icmp sle i32 %i1, %limit2
  br i1 %letmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %i3 = load i32, ptr %i, align 4
  %calltmp = call i1 @isSquare(i32 %i3)
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
  %calltmp = call i32 @squareStress()
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
