; ModuleID = 'blueprint_module'
source_filename = "blueprint_module"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define noundef range(i32 0, -2147483648) i32 @fibonacci(i32 noundef range(i32 0, -2147483648) %0) local_unnamed_addr #0 {
entry:
  %switch19 = icmp samesign ult i32 %0, 2
  br i1 %switch19, label %common.ret, label %default.next5

common.ret:                                       ; preds = %default.next5, %entry
  %accumulator.tr.lcssa = phi i32 [ 0, %entry ], [ %addtmp, %default.next5 ]
  %.tr.lcssa = phi i32 [ %0, %entry ], [ %subtmp8, %default.next5 ]
  %accumulator.ret.tr = add nuw i32 %.tr.lcssa, %accumulator.tr.lcssa
  ret i32 %accumulator.ret.tr

default.next5:                                    ; preds = %entry, %default.next5
  %.tr21 = phi i32 [ %subtmp8, %default.next5 ], [ %0, %entry ]
  %accumulator.tr20 = phi i32 [ %addtmp, %default.next5 ], [ 0, %entry ]
  %subtmp = add nsw i32 %.tr21, -1
  %calltmp = tail call i32 @fibonacci(i32 %subtmp)
  %subtmp8 = add nsw i32 %.tr21, -2
  %addtmp = add nuw i32 %calltmp, %accumulator.tr20
  %switch = icmp ult i32 %subtmp8, 2
  br i1 %switch, label %common.ret, label %default.next5
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
define noundef i32 @fibonacciStress() local_unnamed_addr #0 {
entry:
  %calltmp = tail call i32 @fibonacci(i32 0)
  %calltmp.1 = tail call i32 @fibonacci(i32 1)
  %addtmp.1 = add nuw i32 %calltmp.1, %calltmp
  %calltmp.2 = tail call i32 @fibonacci(i32 2)
  %addtmp.2 = add i32 %calltmp.2, %addtmp.1
  %calltmp.3 = tail call i32 @fibonacci(i32 3)
  %addtmp.3 = add i32 %calltmp.3, %addtmp.2
  %calltmp.4 = tail call i32 @fibonacci(i32 4)
  %addtmp.4 = add i32 %calltmp.4, %addtmp.3
  %calltmp.5 = tail call i32 @fibonacci(i32 5)
  %addtmp.5 = add i32 %calltmp.5, %addtmp.4
  %calltmp.6 = tail call i32 @fibonacci(i32 6)
  %addtmp.6 = add i32 %calltmp.6, %addtmp.5
  %calltmp.7 = tail call i32 @fibonacci(i32 7)
  %addtmp.7 = add i32 %calltmp.7, %addtmp.6
  %calltmp.8 = tail call i32 @fibonacci(i32 8)
  %addtmp.8 = add i32 %calltmp.8, %addtmp.7
  %calltmp.9 = tail call i32 @fibonacci(i32 9)
  %addtmp.9 = add i32 %calltmp.9, %addtmp.8
  %calltmp.10 = tail call i32 @fibonacci(i32 10)
  %addtmp.10 = add i32 %calltmp.10, %addtmp.9
  %calltmp.11 = tail call i32 @fibonacci(i32 11)
  %addtmp.11 = add i32 %calltmp.11, %addtmp.10
  %calltmp.12 = tail call i32 @fibonacci(i32 12)
  %addtmp.12 = add i32 %calltmp.12, %addtmp.11
  %calltmp.13 = tail call i32 @fibonacci(i32 13)
  %addtmp.13 = add i32 %calltmp.13, %addtmp.12
  %calltmp.14 = tail call i32 @fibonacci(i32 14)
  %addtmp.14 = add i32 %calltmp.14, %addtmp.13
  %calltmp.15 = tail call i32 @fibonacci(i32 15)
  %addtmp.15 = add i32 %calltmp.15, %addtmp.14
  %calltmp.16 = tail call i32 @fibonacci(i32 16)
  %addtmp.16 = add i32 %calltmp.16, %addtmp.15
  %calltmp.17 = tail call i32 @fibonacci(i32 17)
  %addtmp.17 = add i32 %calltmp.17, %addtmp.16
  %calltmp.18 = tail call i32 @fibonacci(i32 18)
  %addtmp.18 = add i32 %calltmp.18, %addtmp.17
  %calltmp.19 = tail call i32 @fibonacci(i32 19)
  %addtmp.19 = add i32 %calltmp.19, %addtmp.18
  %calltmp.20 = tail call i32 @fibonacci(i32 20)
  %addtmp.20 = add i32 %calltmp.20, %addtmp.19
  %calltmp.21 = tail call i32 @fibonacci(i32 21)
  %addtmp.21 = add i32 %calltmp.21, %addtmp.20
  %calltmp.22 = tail call i32 @fibonacci(i32 22)
  %addtmp.22 = add i32 %calltmp.22, %addtmp.21
  %calltmp.23 = tail call i32 @fibonacci(i32 23)
  %addtmp.23 = add i32 %calltmp.23, %addtmp.22
  %calltmp.24 = tail call i32 @fibonacci(i32 24)
  %addtmp.24 = add i32 %calltmp.24, %addtmp.23
  %calltmp.25 = tail call i32 @fibonacci(i32 25)
  %addtmp.25 = add i32 %calltmp.25, %addtmp.24
  %calltmp.26 = tail call i32 @fibonacci(i32 26)
  %addtmp.26 = add i32 %calltmp.26, %addtmp.25
  %calltmp.27 = tail call i32 @fibonacci(i32 27)
  %addtmp.27 = add i32 %calltmp.27, %addtmp.26
  %calltmp.28 = tail call i32 @fibonacci(i32 28)
  %addtmp.28 = add i32 %calltmp.28, %addtmp.27
  %calltmp.29 = tail call i32 @fibonacci(i32 29)
  %addtmp.29 = add i32 %calltmp.29, %addtmp.28
  %calltmp.30 = tail call i32 @fibonacci(i32 30)
  %addtmp.30 = add i32 %calltmp.30, %addtmp.29
  %calltmp.31 = tail call i32 @fibonacci(i32 31)
  %addtmp.31 = add i32 %calltmp.31, %addtmp.30
  %calltmp.32 = tail call i32 @fibonacci(i32 32)
  %addtmp.32 = add i32 %calltmp.32, %addtmp.31
  %calltmp.33 = tail call i32 @fibonacci(i32 33)
  %addtmp.33 = add i32 %calltmp.33, %addtmp.32
  %calltmp.34 = tail call i32 @fibonacci(i32 34)
  %addtmp.34 = add i32 %calltmp.34, %addtmp.33
  %calltmp.35 = tail call i32 @fibonacci(i32 35)
  %addtmp.35 = add i32 %calltmp.35, %addtmp.34
  %calltmp.36 = tail call i32 @fibonacci(i32 36)
  %addtmp.36 = add i32 %calltmp.36, %addtmp.35
  %calltmp.37 = tail call i32 @fibonacci(i32 37)
  %addtmp.37 = add i32 %calltmp.37, %addtmp.36
  %calltmp.38 = tail call i32 @fibonacci(i32 38)
  %addtmp.38 = add i32 %calltmp.38, %addtmp.37
  %calltmp.39 = tail call i32 @fibonacci(i32 39)
  %addtmp.39 = add i32 %calltmp.39, %addtmp.38
  %calltmp.40 = tail call i32 @fibonacci(i32 40)
  %addtmp.40 = add i32 %calltmp.40, %addtmp.39
  %calltmp.41 = tail call i32 @fibonacci(i32 41)
  %addtmp.41 = add i32 %calltmp.41, %addtmp.40
  %calltmp.42 = tail call i32 @fibonacci(i32 42)
  %addtmp.42 = add i32 %calltmp.42, %addtmp.41
  %calltmp.43 = tail call i32 @fibonacci(i32 43)
  %addtmp.43 = add i32 %calltmp.43, %addtmp.42
  %calltmp.44 = tail call i32 @fibonacci(i32 44)
  %addtmp.44 = add i32 %calltmp.44, %addtmp.43
  %calltmp.45 = tail call i32 @fibonacci(i32 45)
  %addtmp.45 = add i32 %calltmp.45, %addtmp.44
  ret i32 %addtmp.45
}

; Function Attrs: nofree nounwind
define noundef i32 @main() local_unnamed_addr #1 {
entry:
  %calltmp = tail call i32 @fibonacciStress()
  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt, i32 %calltmp)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #1

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
