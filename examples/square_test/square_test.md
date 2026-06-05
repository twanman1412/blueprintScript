# Square Test Example

## `square_test.bps`

### CFG (.dot)
```dot
digraph "CFG for isSquare" {
    entry [label="entry"];
    blueprint [label="blueprint"];
    while_loop [label="while (n > 0)"];
    exit [label="exit"];

    entry -> blueprint;
    blueprint -> while_loop [label="otherwise"];
    blueprint -> exit [label="base case"];
    while_loop -> while_loop [label="true"];
    while_loop -> exit [label="false"];
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 3

## `square_test-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for isSquare" {
    entry [label="entry"];
    while_loop [label="while (n > 0)"];
    exit [label="exit"];

    entry -> while_loop;
    while_loop -> while_loop [label="true"];
    while_loop -> exit [label="false"];
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 2

## `square_test.ll`

### CFG (.dot)
```dot
digraph "CFG for 'isSquare' function" {
	label="CFG for 'isSquare' function";

	Node0x56029043fd90 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{entry:\l|  %eqtmp = icmp eq i32 %0, 0\l  br i1 %eqtmp, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x56029043fd90:s0 -> Node0x56029043fed0;
	Node0x56029043fd90:s1 -> Node0x560290440400;
	Node0x56029043fed0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i1 [ %eqtmp7, %loopexit ], [ true, %entry ]\l  ret i1 %common.ret.op\l}"];
	Node0x560290440400 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody:\l|  %n.013 = phi i32 [ %subtmp, %loopbody ], [ %0, %entry ]\l  %odd.012 = phi i32 [ %addtmp, %loopbody ], [ 1, %entry ]\l  %subtmp = sub i32 %n.013, %odd.012\l  %addtmp = add i32 %odd.012, 2\l  %gttmp = icmp sgt i32 %subtmp, 0\l  br i1 %gttmp, label %loopbody, label %loopexit\l|{<s0>T|<s1>F}}"];
	Node0x560290440400:s0 -> Node0x560290440400;
	Node0x560290440400:s1 -> Node0x5602904405f0;
	Node0x5602904405f0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{loopexit:\l|  %eqtmp7 = icmp eq i32 %subtmp, 0\l  br label %common.ret\l}"];
	Node0x5602904405f0 -> Node0x56029043fed0;
}
```

### Cyclomatic Complexity
Number of Nodes = 4
Number of Edges = 5
Cyclomatic Complexity = E - N + 2 = 5 - 4 + 2 = 3

## `square_test-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'isSquare' function" {
	label="CFG for 'isSquare' function";

	Node0x5611170bbd30 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{entry:\l|  %gttmp9 = icmp sgt i32 %0, 0\l  br i1 %gttmp9, label %loopbody, label %loopexit\l|{<s0>T|<s1>F}}"];
	Node0x5611170bbd30:s0 -> Node0x5611170bbe70;
	Node0x5611170bbd30:s1 -> Node0x5611170bc3a0;
	Node0x5611170bbe70 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody:\l|  %n.011 = phi i32 [ %subtmp, %loopbody ], [ %0, %entry ]\l  %odd.010 = phi i32 [ %addtmp, %loopbody ], [ 1, %entry ]\l  %subtmp = sub i32 %n.011, %odd.010\l  %addtmp = add i32 %odd.010, 2\l  %gttmp = icmp sgt i32 %subtmp, 0\l  br i1 %gttmp, label %loopbody, label %loopexit\l|{<s0>T|<s1>F}}"];
	Node0x5611170bbe70:s0 -> Node0x5611170bbe70;
	Node0x5611170bbe70:s1 -> Node0x5611170bc3a0;
	Node0x5611170bc3a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{loopexit:\l|  %n.0.lcssa = phi i32 [ %0, %entry ], [ %subtmp, %loopbody ]\l  %eqtmp = icmp eq i32 %n.0.lcssa, 0\l  ret i1 %eqtmp\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 3
Number of Edges = 4
Cyclomatic Complexity = E - N + 2 = 4 - 3 + 2 = 3
