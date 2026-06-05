# Fibonacci Example

## `fibonacci.bps`

### CFG (.dot)
```dot
digraph "CFG for fibonacci.bps" {
    blueprint [label="blueprint"];
    body [label="fibonacci(n - 1) + fibonacci(n - 2)"];
    exit [label="exit"];

    blueprint -> exit [label="base case"];
    blueprint -> body [label="otherwise"];
    body -> blueprint;
}
```

### Cyclomatic Complexity
Number of Nodes = 3
Number of Edges = 3
Cyclomatic Complexity = E - N + 2 = 3 - 3 + 2 = 2

## `fibonacci-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for fibonacci-defensive.bps" {
    entry [label="entry"];
    check_n_le_0 [label="n <= 0"];
    return_0 [label="return 0"];
    check_n_eq_1 [label="n == 1"];
    return_1 [label="return 1"];
    recursive_call [label="fibonacci(n - 1) + fibonacci(n - 2)"];
    exit [label="exit"];

    entry -> check_n_le_0;
    check_n_le_0 -> return_0 [label="true"];
    check_n_le_0 -> check_n_eq_1 [label="false"];
    return_0 -> exit;
    check_n_eq_1 -> return_1 [label="true"];
    check_n_eq_1 -> recursive_call [label="false"];
    return_1 -> exit;
    recursive_call -> entry;
}
```

### Cyclomatic Complexity
Number of Nodes = 7
Number of Edges = 8
Cyclomatic Complexity = E - N + 2 = 8 - 7 + 2 = 3

## `fibonacci.ll`

### CFG (.dot)
```dot
digraph "CFG for 'fibonacci' function" {
	label="CFG for 'fibonacci' function";

	Node0x56258c7d5e40 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{entry:\l|  %switch19 = icmp samesign ult i32 %0, 2\l  br i1 %switch19, label %common.ret, label %default.next5\l|{<s0>T|<s1>F}}"];
	Node0x56258c7d5e40:s0 -> Node0x56258c7d5f80;
	Node0x56258c7d5e40:s1 -> Node0x56258c7d66e0;
	Node0x56258c7d5f80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{common.ret:\l|  %accumulator.tr.lcssa = phi i32 [ 0, %entry ], [ %addtmp, %default.next5 ]\l  %.tr.lcssa = phi i32 [ %0, %entry ], [ %subtmp8, %default.next5 ]\l  %accumulator.ret.tr = add nuw i32 %.tr.lcssa, %accumulator.tr.lcssa\l  ret i32 %accumulator.ret.tr\l}"];
	Node0x56258c7d66e0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{default.next5:\l|  %.tr21 = phi i32 [ %subtmp8, %default.next5 ], [ %0, %entry ]\l  %accumulator.tr20 = phi i32 [ %addtmp, %default.next5 ], [ 0, %entry ]\l  %subtmp = add nsw i32 %.tr21, -1\l  %calltmp = tail call i32 @fibonacci(i32 %subtmp)\l  %subtmp8 = add nsw i32 %.tr21, -2\l  %addtmp = add nuw i32 %calltmp, %accumulator.tr20\l  %switch = icmp ult i32 %subtmp8, 2\l  br i1 %switch, label %common.ret, label %default.next5\l|{<s0>T|<s1>F}}"];
	Node0x56258c7d66e0:s0 -> Node0x56258c7d5f80;
	Node0x56258c7d66e0:s1 -> Node0x56258c7d66e0;
}
```

### Cyclomatic Complexity
Number of Nodes = 3
Number of Edges = 4
Cyclomatic Complexity = E - N + 2 = 4 - 3 + 2 = 3

## `fibonacci-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'fibonacci' function" {
	label="CFG for 'fibonacci' function";

	Node0x5624d15f6fa0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#cc403a70", fontname="Courier",label="{entry:\l|  %letmp14 = icmp slt i32 %0, 1\l  br i1 %letmp14, label %common.ret, label %ifcont\l|{<s0>T|<s1>F}}"];
	Node0x5624d15f6fa0:s0 -> Node0x5624d15f70e0;
	Node0x5624d15f6fa0:s1 -> Node0x5624d15f7610;
	Node0x5624d15f77d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{common.ret.loopexit:\l|  %accumulator.tr.lcssa.ph = phi i32 [ %addtmp, %ifcont5 ], [\l... %accumulator.tr15, %ifcont ]\l  %common.ret.op.ph = phi i32 [ 0, %ifcont5 ], [ 1, %ifcont ]\l  %1 = add i32 %common.ret.op.ph, %accumulator.tr.lcssa.ph\l  br label %common.ret\l}"];
	Node0x5624d15f77d0 -> Node0x5624d15f70e0;
	Node0x5624d15f70e0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#cc403a70", fontname="Courier",label="{common.ret:\l|  %accumulator.ret.tr = phi i32 [ 0, %entry ], [ %1, %common.ret.loopexit ]\l  ret i32 %accumulator.ret.tr\l}"];
	Node0x5624d15f7610 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont:\l|  %.tr16 = phi i32 [ %subtmp8, %ifcont5 ], [ %0, %entry ]\l  %accumulator.tr15 = phi i32 [ %addtmp, %ifcont5 ], [ 0, %entry ]\l  %eqtmp = icmp eq i32 %.tr16, 1\l  br i1 %eqtmp, label %common.ret.loopexit, label %ifcont5\l|{<s0>T|<s1>F}}"];
	Node0x5624d15f7610:s0 -> Node0x5624d15f77d0;
	Node0x5624d15f7610:s1 -> Node0x5624d15f7940;
	Node0x5624d15f7940 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont5:\l|  %subtmp = add nsw i32 %.tr16, -1\l  %calltmp = tail call i32 @fibonacci(i32 %subtmp)\l  %subtmp8 = add nsw i32 %.tr16, -2\l  %addtmp = add i32 %calltmp, %accumulator.tr15\l  %letmp = icmp samesign ult i32 %.tr16, 3\l  br i1 %letmp, label %common.ret.loopexit, label %ifcont\l|{<s0>T|<s1>F}}"];
	Node0x5624d15f7940:s0 -> Node0x5624d15f77d0;
	Node0x5624d15f7940:s1 -> Node0x5624d15f7610;
}
```

### Cyclomatic Complexity
Number of Nodes = 5
Number of Edges = 7
Cyclomatic Complexity = E - N + 2 = 7 - 5 + 2 = 4
