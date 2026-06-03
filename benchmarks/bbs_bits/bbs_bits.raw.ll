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
define noundef range(i32 0, -2147483648) i32 @bbsBits(i32 noundef %0, i32 noundef range(i32 2, -2147483648) %1, i32 noundef range(i32 0, -2147483648) %2) #0 {
entry:
  %i = alloca i32, align 4
  %sumMod = alloca i32, align 4
  %result = alloca i32, align 4
  %bbsBits = alloca i32, align 4
  %count = alloca i32, align 4
  %modulus = alloca i32, align 4
  %seed = alloca i32, align 4
  store i32 %0, ptr %seed, align 4
  store i32 %1, ptr %modulus, align 4
  store i32 %2, ptr %count, align 4
  %count1 = load i32, ptr %count, align 4
  %eqtmp = icmp eq i32 %count1, 0
  br i1 %eqtmp, label %default.return, label %default.next

default.return:                                   ; preds = %entry
  store i32 0, ptr %bbsBits, align 4
  ret i32 0

default.next:                                     ; preds = %entry
  store i32 0, ptr %result, align 4
  store i32 1000000007, ptr %sumMod, align 4
  store i32 0, ptr %i, align 4
  %seed2 = load i32, ptr %seed, align 4
  %modulus3 = load i32, ptr %modulus, align 4
  %modtmp = srem i32 %seed2, %modulus3
  store i32 %modtmp, ptr %seed, align 4
  %seed4 = load i32, ptr %seed, align 4
  %lttmp = icmp slt i32 %seed4, 0
  br i1 %lttmp, label %then, label %else

then:                                             ; preds = %default.next
  %seed5 = load i32, ptr %seed, align 4
  %modulus6 = load i32, ptr %modulus, align 4
  %addtmp = add i32 %seed5, %modulus6
  store i32 %addtmp, ptr %seed, align 4
  br label %ifcont

else:                                             ; preds = %default.next
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %ifcont
  %i7 = load i32, ptr %i, align 4
  %count8 = load i32, ptr %count, align 4
  %lttmp9 = icmp slt i32 %i7, %count8
  br i1 %lttmp9, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %seed10 = load i32, ptr %seed, align 4
  %seed11 = load i32, ptr %seed, align 4
  %modulus12 = load i32, ptr %modulus, align 4
  %calltmp = call i32 @mulMod(i32 %seed10, i32 %seed11, i32 %modulus12)
  store i32 %calltmp, ptr %seed, align 4
  %result13 = load i32, ptr %result, align 4
  %seed14 = load i32, ptr %seed, align 4
  %modtmp15 = srem i32 %seed14, 2
  %addtmp16 = add i32 %result13, %modtmp15
  %sumMod17 = load i32, ptr %sumMod, align 4
  %modtmp18 = srem i32 %addtmp16, %sumMod17
  store i32 %modtmp18, ptr %result, align 4
  %i19 = load i32, ptr %i, align 4
  %addtmp20 = add i32 %i19, 1
  store i32 %addtmp20, ptr %i, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %result21 = load i32, ptr %result, align 4
  store i32 %result21, ptr %bbsBits, align 4
  ret i32 %result21
}

; Function Attrs: nounwind willreturn
define noundef i32 @bbsStress() #0 {
entry:
  %count = alloca i32, align 4
  %modulus = alloca i32, align 4
  %seed = alloca i32, align 4
  store i32 123456789, ptr %seed, align 4
  store i32 1000003, ptr %modulus, align 4
  store i32 200000000, ptr %count, align 4
  %seed1 = load i32, ptr %seed, align 4
  %modulus2 = load i32, ptr %modulus, align 4
  %count3 = load i32, ptr %count, align 4
  %calltmp = call i32 @bbsBits(i32 %seed1, i32 %modulus2, i32 %count3)
  ret i32 %calltmp
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @bbsStress()
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
