# Fibonacci Example

### CFG (.dot)
```dot
digraph "CFG for fibonacci" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\l}"];
	entry -> ret;
	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return fibonacci(n - 1) + fibonacci(n - 2);\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 3
Number of Edges = 3
Cyclomatic Complexity = E - N + 2 = 3 - 3 + 2 = 2

### CFG (.dot)
```dot
digraph "CFG for fibonacci" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\lbr (n \<= 0)\l|{<s0>T|<s1>F}}"];
	entry:s0 -> ret;
	entry:s1 -> if_end1;
	
	if_end1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end1\l|br (n == 1)\l|{<s0>T|<s1>F}}"];
	if_end1:s0 -> ret;
	if_end1:s1 -> if_end2;
	
	if_end2 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end2\l|res = fibonacci(n - 1) + fibonacci(n - 2);\lassert(res \>= 0);\l}"];
	if_end2 -> ret;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return ...;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 4
Number of Edges = 5
Cyclomatic Complexity = E - N + 2 = 5 - 4 + 2 = 3

## `fibonacci.ll`

### CFG (.dot)
```dot
digraph "CFG for 'fibonacci' function" {
	label="CFG for 'fibonacci' function";

	Node0x55da7adb1690 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{entry:\l|  %switch19 = icmp samesign ult i32 %0, 2\l  br i1 %switch19, label %common.ret, label %default.next5\l|{<s0>T|<s1>F}}"];
	Node0x55da7adb1690:s0 -> Node0x55da7adb1750;
	Node0x55da7adb1690:s1 -> Node0x55da7adb5130;
	Node0x55da7adb1750 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{common.ret:\l|  %accumulator.tr.lcssa = phi i32 [ 0, %entry ], [ %addtmp, %default.next5 ]\l  %.tr.lcssa = phi i32 [ %0, %entry ], [ %subtmp8, %default.next5 ]\l  %accumulator.ret.tr = add nuw nsw i32 %.tr.lcssa, %accumulator.tr.lcssa\l  ret i32 %accumulator.ret.tr\l}"];
	Node0x55da7adb5130 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{default.next5:\l|  %.tr21 = phi i32 [ %subtmp8, %default.next5 ], [ %0, %entry ]\l  %accumulator.tr20 = phi i32 [ %addtmp, %default.next5 ], [ 0, %entry ]\l  %subtmp = add nsw i32 %.tr21, -1\l  %calltmp = tail call fastcc noundef i32 @fibonacci(i32 noundef %subtmp)\l  %subtmp8 = add nsw i32 %.tr21, -2\l  %addtmp = add nuw nsw i32 %calltmp, %accumulator.tr20\l  %switch = icmp ult i32 %subtmp8, 2\l  br i1 %switch, label %common.ret, label %default.next5\l|{<s0>T|<s1>F}}"];
	Node0x55da7adb5130:s0 -> Node0x55da7adb1750;
	Node0x55da7adb5130:s1 -> Node0x55da7adb5130;
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

	Node0x5555cf78e6c0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{entry:\l|  %switch21 = icmp samesign ult i32 %0, 2\l  br i1 %switch21, label %common.ret, label %ifcont5\l|{<s0>T|<s1>F}}"];
	Node0x5555cf78e6c0:s0 -> Node0x5555cf78e780;
	Node0x5555cf78e6c0:s1 -> Node0x5555cf792140;
	Node0x5555cf78e780 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{common.ret:\l|  %accumulator.tr.lcssa = phi i32 [ 0, %entry ], [ %addtmp, %ifcont5 ]\l  %.tr.lcssa = phi i32 [ %0, %entry ], [ %subtmp8, %ifcont5 ]\l  %accumulator.ret.tr = add nsw i32 %.tr.lcssa, %accumulator.tr.lcssa\l  ret i32 %accumulator.ret.tr\l}"];
	Node0x5555cf792140 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont5:\l|  %.tr23 = phi i32 [ %subtmp8, %ifcont5 ], [ %0, %entry ]\l  %accumulator.tr22 = phi i32 [ %addtmp, %ifcont5 ], [ 0, %entry ]\l  %subtmp = add nsw i32 %.tr23, -1\l  %calltmp = tail call fastcc noundef i32 @fibonacci(i32 noundef %subtmp)\l  %subtmp8 = add nsw i32 %.tr23, -2\l  %addtmp = add nsw i32 %calltmp, %accumulator.tr22\l  %switch = icmp ult i32 %subtmp8, 2\l  br i1 %switch, label %common.ret, label %ifcont5\l|{<s0>T|<s1>F}}"];
	Node0x5555cf792140:s0 -> Node0x5555cf78e780;
	Node0x5555cf792140:s1 -> Node0x5555cf792140;
}
```

### Cyclomatic Complexity
Number of Nodes = 3
Number of Edges = 4
Cyclomatic Complexity = E - N + 2 = 4 - 3 + 2 = 3
