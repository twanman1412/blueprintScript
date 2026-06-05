# Integer Square Root Example

## `int_sqrt.bps`

### CFG (.dot)
```dot
digraph "CFG for intSqrt" {
    entry [label="entry"];
    blueprint [label="blueprint"];
    while_loop [label="while (low <= high)"];
    if_mid [label="if (mid == 0)"];
    else_if_mid [label="else if (mid <= n / mid)"];
    exit [label="exit"];

    entry -> blueprint;
    blueprint -> while_loop [label="otherwise"];
    blueprint -> exit [label="base case"];
    while_loop -> if_mid [label="true"];
    while_loop -> exit [label="false"];
    if_mid -> while_loop [label="true"];
    if_mid -> else_if_mid [label="false"];
    else_if_mid -> while_loop;
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 5

## `int_sqrt-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for intSqrt" {
    entry [label="entry"];
    while_loop [label="while (low <= high)"];
    if_mid [label="if (mid == 0)"];
    else_if_mid [label="else if (mid <= n / mid)"];
    exit [label="exit"];

    entry -> while_loop;
    while_loop -> if_mid [label="true"];
    while_loop -> exit [label="false"];
    if_mid -> while_loop [label="true"];
    if_mid -> else_if_mid [label="false"];
    else_if_mid -> while_loop;
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 4

## `int_sqrt.ll`

### CFG (.dot)
```dot
digraph "CFG for 'intSqrt' function" {
	label="CFG for 'intSqrt' function";

	Node0x5601991866d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{entry:\l|  %eqtmp = icmp eq i32 %0, 0\l  br i1 %eqtmp, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x5601991866d0:s0 -> Node0x560199186810;
	Node0x5601991866d0:s1 -> Node0x560199186d40;
	Node0x560199186810 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i32 [ 0, %entry ], [ %result.1, %ifcont ]\l  ret i32 %common.ret.op\l}"];
	Node0x560199186d40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody:\l|  %result.036 = phi i32 [ %result.1, %ifcont ], [ 0, %entry ]\l  %low.035 = phi i32 [ %low.1, %ifcont ], [ 0, %entry ]\l  %high.034 = phi i32 [ %high.1, %ifcont ], [ %0, %entry ]\l  %subtmp = sub i32 %high.034, %low.035\l  %divtmp = sdiv i32 %subtmp, 2\l  %addtmp = add i32 %divtmp, %low.035\l  %eqtmp9 = icmp eq i32 %addtmp, 0\l  br i1 %eqtmp9, label %ifcont, label %else\l|{<s0>T|<s1>F}}"];
	Node0x560199186d40:s0 -> Node0x560199186f40;
	Node0x560199186d40:s1 -> Node0x560199187c00;
	Node0x560199187c00 [shape=record,color="#b70d28ff", style=filled, fillcolor="#bb1b2c70", fontname="Courier",label="{else:\l|  %divtmp13 = sdiv i32 %0, %addtmp\l  %letmp14.not = icmp sgt i32 %addtmp, %divtmp13\l  br i1 %letmp14.not, label %else16, label %then15\l|{<s0>T|<s1>F}}"];
	Node0x560199187c00:s0 -> Node0x560199187c80;
	Node0x560199187c00:s1 -> Node0x560199187e70;
	Node0x560199186f40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont:\l|  %high.1 = phi i32 [ %subtmp22, %else16 ], [ %high.034, %then15 ], [\l... %high.034, %loopbody ]\l  %low.1 = phi i32 [ %low.035, %else16 ], [ %addtmp20, %then15 ], [ 1,\l... %loopbody ]\l  %result.1 = phi i32 [ %result.036, %else16 ], [ %addtmp, %then15 ], [ 0,\l... %loopbody ]\l  %letmp.not = icmp sgt i32 %low.1, %high.1\l  br i1 %letmp.not, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x560199186f40:s0 -> Node0x560199186810;
	Node0x560199186f40:s1 -> Node0x560199186d40;
	Node0x560199187e70 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{then15:\l|  %addtmp20 = add i32 %addtmp, 1\l  br label %ifcont\l}"];
	Node0x560199187e70 -> Node0x560199186f40;
	Node0x560199187c80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{else16:\l|  %subtmp22 = add nsw i32 %addtmp, -1\l  br label %ifcont\l}"];
	Node0x560199187c80 -> Node0x560199186f40;
}
```

### Cyclomatic Complexity
Number of Nodes =  7
Number of Edges = 10 
Cyclomatic Complexity = E - N + 2 = 10 - 7 + 2 = 5

## `int_sqrt-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'intSqrt' function" {
	label="CFG for 'intSqrt' function";

	Node0x55985bd2f6a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{entry:\l|  %letmp.not31 = icmp slt i32 %0, 0\l  br i1 %letmp.not31, label %loopexit, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x55985bd2f6a0:s0 -> Node0x55985bd2f7e0;
	Node0x55985bd2f6a0:s1 -> Node0x55985bd2fd40;
	Node0x55985bd2fd40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody:\l|  %result.034 = phi i32 [ %result.1, %ifcont ], [ 0, %entry ]\l  %low.033 = phi i32 [ %low.1, %ifcont ], [ 0, %entry ]\l  %high.032 = phi i32 [ %high.1, %ifcont ], [ %0, %entry ]\l  %subtmp = sub i32 %high.032, %low.033\l  %divtmp = sdiv i32 %subtmp, 2\l  %addtmp = add i32 %divtmp, %low.033\l  %eqtmp = icmp eq i32 %addtmp, 0\l  br i1 %eqtmp, label %ifcont, label %else\l|{<s0>T|<s1>F}}"];
	Node0x55985bd2fd40:s0 -> Node0x55985bd2ff40;
	Node0x55985bd2fd40:s1 -> Node0x55985bd30ae0;
	Node0x55985bd2f7e0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{loopexit:\l|  %result.0.lcssa = phi i32 [ 0, %entry ], [ %result.1, %ifcont ]\l  ret i32 %result.0.lcssa\l}"];
	Node0x55985bd30ae0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#bb1b2c70", fontname="Courier",label="{else:\l|  %divtmp11 = sdiv i32 %0, %addtmp\l  %letmp12.not = icmp sgt i32 %addtmp, %divtmp11\l  br i1 %letmp12.not, label %else14, label %then13\l|{<s0>T|<s1>F}}"];
	Node0x55985bd30ae0:s0 -> Node0x55985bd30b60;
	Node0x55985bd30ae0:s1 -> Node0x55985bd30e50;
	Node0x55985bd2ff40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont:\l|  %high.1 = phi i32 [ %subtmp20, %else14 ], [ %high.032, %then13 ], [\l... %high.032, %loopbody ]\l  %low.1 = phi i32 [ %low.033, %else14 ], [ %addtmp18, %then13 ], [ 1,\l... %loopbody ]\l  %result.1 = phi i32 [ %result.034, %else14 ], [ %addtmp, %then13 ], [ 0,\l... %loopbody ]\l  %letmp.not = icmp sgt i32 %low.1, %high.1\l  br i1 %letmp.not, label %loopexit, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x55985bd2ff40:s0 -> Node0x55985bd2f7e0;
	Node0x55985bd2ff40:s1 -> Node0x55985bd2fd40;
	Node0x55985bd30e50 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{then13:\l|  %addtmp18 = add i32 %addtmp, 1\l  br label %ifcont\l}"];
	Node0x55985bd30e50 -> Node0x55985bd2ff40;
	Node0x55985bd30b60 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{else14:\l|  %subtmp20 = add nsw i32 %addtmp, -1\l  br label %ifcont\l}"];
	Node0x55985bd30b60 -> Node0x55985bd2ff40;
}
```

### Cyclomatic Complexity
Number of Nodes =  7
Number of Edges = 10 
Cyclomatic Complexity = E - N + 2 = 10 - 7 + 2 = 5
