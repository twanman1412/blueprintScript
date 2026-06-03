; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i1 @isPrime(i32 noundef %0) #0 {
entry:
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %n1 = load i32, ptr %n, align 4
  %letmp = icmp sle i32 %n1, 1
  br i1 %letmp, label %then, label %else

then:                                             ; preds = %entry
  ret i1 false

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else
  %n2 = load i32, ptr %n, align 4
  %letmp3 = icmp sle i32 %n2, 3
  br i1 %letmp3, label %then4, label %else5

then4:                                            ; preds = %ifcont
  ret i1 true

else5:                                            ; preds = %ifcont
  br label %ifcont6

ifcont6:                                          ; preds = %else5
  %n7 = load i32, ptr %n, align 4
  %modtmp = srem i32 %n7, 2
  %eqtmp = icmp eq i32 %modtmp, 0
  br i1 %eqtmp, label %then8, label %else9

then8:                                            ; preds = %ifcont6
  ret i1 false

else9:                                            ; preds = %ifcont6
  br label %ifcont10

ifcont10:                                         ; preds = %else9
  store i32 3, ptr %i, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont21, %ifcont10
  %i11 = load i32, ptr %i, align 4
  %n12 = load i32, ptr %n, align 4
  %i13 = load i32, ptr %i, align 4
  %divtmp = sdiv i32 %n12, %i13
  %letmp14 = icmp sle i32 %i11, %divtmp
  br i1 %letmp14, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %n15 = load i32, ptr %n, align 4
  %i16 = load i32, ptr %i, align 4
  %modtmp17 = srem i32 %n15, %i16
  %eqtmp18 = icmp eq i32 %modtmp17, 0
  br i1 %eqtmp18, label %then19, label %else20

loopexit:                                         ; preds = %loopcond
  ret i1 true

then19:                                           ; preds = %loopbody
  ret i1 false

else20:                                           ; preds = %loopbody
  br label %ifcont21

ifcont21:                                         ; preds = %else20
  %i22 = load i32, ptr %i, align 4
  %addtmp = add i32 %i22, 2
  store i32 %addtmp, ptr %i, align 4
  br label %loopcond
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i1 @isPrime(i32 29)
  %booltoint = zext i1 %calltmp to i32
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %booltoint)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
