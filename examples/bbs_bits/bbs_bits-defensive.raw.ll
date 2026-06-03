; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind willreturn
define noundef i32 @mulMod(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %result = alloca i32, align 4
  %mod = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 %0, ptr %a, align 4
  store i32 %1, ptr %b, align 4
  store i32 %2, ptr %mod, align 4
  store i32 0, ptr %result, align 4
  %a1 = load i32, ptr %a, align 4
  %mod2 = load i32, ptr %mod, align 4
  %modtmp = srem i32 %a1, %mod2
  store i32 %modtmp, ptr %a, align 4
  br label %loopcond

loopcond:                                         ; preds = %ifcont, %entry
  %b3 = load i32, ptr %b, align 4
  %gttmp = icmp sgt i32 %b3, 0
  br i1 %gttmp, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %b4 = load i32, ptr %b, align 4
  %modtmp5 = srem i32 %b4, 2
  %eqtmp = icmp eq i32 %modtmp5, 1
  br i1 %eqtmp, label %then, label %else

loopexit:                                         ; preds = %loopcond
  %result16 = load i32, ptr %result, align 4
  ret i32 %result16

then:                                             ; preds = %loopbody
  %result6 = load i32, ptr %result, align 4
  %a7 = load i32, ptr %a, align 4
  %addtmp = add i32 %result6, %a7
  %mod8 = load i32, ptr %mod, align 4
  %modtmp9 = srem i32 %addtmp, %mod8
  store i32 %modtmp9, ptr %result, align 4
  br label %ifcont

else:                                             ; preds = %loopbody
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %a10 = load i32, ptr %a, align 4
  %a11 = load i32, ptr %a, align 4
  %addtmp12 = add i32 %a10, %a11
  %mod13 = load i32, ptr %mod, align 4
  %modtmp14 = srem i32 %addtmp12, %mod13
  store i32 %modtmp14, ptr %a, align 4
  %b15 = load i32, ptr %b, align 4
  %divtmp = sdiv i32 %b15, 2
  store i32 %divtmp, ptr %b, align 4
  br label %loopcond
}

; Function Attrs: nounwind willreturn
define noundef i32 @bbsBits(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %i = alloca i32, align 4
  %sumMod = alloca i32, align 4
  %result = alloca i32, align 4
  %count = alloca i32, align 4
  %modulus = alloca i32, align 4
  %seed = alloca i32, align 4
  store i32 %0, ptr %seed, align 4
  store i32 %1, ptr %modulus, align 4
  store i32 %2, ptr %count, align 4
  store i32 0, ptr %result, align 4
  store i32 1000000007, ptr %sumMod, align 4
  store i32 0, ptr %i, align 4
  %seed1 = load i32, ptr %seed, align 4
  %modulus2 = load i32, ptr %modulus, align 4
  %modtmp = srem i32 %seed1, %modulus2
  store i32 %modtmp, ptr %seed, align 4
  %seed3 = load i32, ptr %seed, align 4
  %lttmp = icmp slt i32 %seed3, 0
  br i1 %lttmp, label %then, label %else

then:                                             ; preds = %entry
  %seed4 = load i32, ptr %seed, align 4
  %modulus5 = load i32, ptr %modulus, align 4
  %addtmp = add i32 %seed4, %modulus5
  store i32 %addtmp, ptr %seed, align 4
  br label %ifcont

else:                                             ; preds = %entry
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  br label %loopcond

loopcond:                                         ; preds = %loopbody, %ifcont
  %i6 = load i32, ptr %i, align 4
  %count7 = load i32, ptr %count, align 4
  %lttmp8 = icmp slt i32 %i6, %count7
  br i1 %lttmp8, label %loopbody, label %loopexit

loopbody:                                         ; preds = %loopcond
  %seed9 = load i32, ptr %seed, align 4
  %seed10 = load i32, ptr %seed, align 4
  %modulus11 = load i32, ptr %modulus, align 4
  %calltmp = call i32 @mulMod(i32 %seed9, i32 %seed10, i32 %modulus11)
  store i32 %calltmp, ptr %seed, align 4
  %result12 = load i32, ptr %result, align 4
  %seed13 = load i32, ptr %seed, align 4
  %modtmp14 = srem i32 %seed13, 2
  %addtmp15 = add i32 %result12, %modtmp14
  %sumMod16 = load i32, ptr %sumMod, align 4
  %modtmp17 = srem i32 %addtmp15, %sumMod16
  store i32 %modtmp17, ptr %result, align 4
  %i18 = load i32, ptr %i, align 4
  %addtmp19 = add i32 %i18, 1
  store i32 %addtmp19, ptr %i, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %result20 = load i32, ptr %result, align 4
  ret i32 %result20
}

; Function Attrs: nounwind
define noundef i32 @main() #1 {
entry:
  %calltmp = call i32 @bbsBits(i32 123456789, i32 1000003, i32 10)
  %0 = call i32 (ptr, ...) @printf(ptr @fmt, i32 %calltmp)
  ret i32 0
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind willreturn }
attributes #1 = { nounwind }
