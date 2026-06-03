; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i1 @isSquare(i32 noundef range(i32 0, -2147483648) %0) #0 {
entry:
  %odd = alloca i32, align 4
  %isSquare = alloca i1, align 1
  %n = alloca i32, align 4
  store i32 %0, ptr %n, align 4
  %n1 = load i32, ptr %n, align 4
  %eqtmp = icmp eq i32 %n1, 0
  br i1 %eqtmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i1 true, ptr %isSquare, align 1
  ret i1 true

default.next:                                     ; preds = %entry
  store i32 1, ptr %odd, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %default.next
  %n2 = load i32, ptr %n, align 4
  %gttmp = icmp sgt i32 %n2, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %n3 = load i32, ptr %n, align 4
  %odd4 = load i32, ptr %odd, align 4
  %subtmp = sub i32 %n3, %odd4
  store i32 %subtmp, ptr %n, align 4
  %odd5 = load i32, ptr %odd, align 4
  %addtmp = add i32 %odd5, 2
  store i32 %addtmp, ptr %odd, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %n6 = load i32, ptr %n, align 4
  %eqtmp7 = icmp eq i32 %n6, 0
  store i1 %eqtmp7, ptr %isSquare, align 1
  ret i1 %eqtmp7
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i1 @isSquare(i32 16)
  %booltoint = zext i1 %calltmp to i32
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %booltoint)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
