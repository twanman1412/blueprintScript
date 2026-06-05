# BBS Bits Example

## `bbs_bits.bps`

### CFG (.dot)
```dot
digraph "CFG for bbsBits" {
    entry [label="entry"];
    blueprint [label="blueprint"];
    body_if [label="if (seed < 0)"];
    body_while [label="while (i < count)"];
    exit [label="exit"];

    entry -> blueprint;
    blueprint -> body_if [label="otherwise"];
    blueprint -> exit [label="base case"];
    body_if -> body_while;
    body_while -> body_while [label="true"];
    body_while -> exit [label="false"];
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 4

## `bbs_bits-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for bbsBits" {
    entry [label="entry"];
    body_if [label="if (seed < 0)"];
    body_while [label="while (i < count)"];
    exit [label="exit"];

    entry -> body_if;
    body_if -> body_while;
    body_while -> body_while [label="true"];
    body_while -> exit [label="false"];
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 3

## `bbs_bits.ll`

### CFG (.dot)
```dot
digraph "CFG for 'bbsBits' function" {
	label="CFG for 'bbsBits' function";

	Node0x559093cabb80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{entry:\l|  %eqtmp = icmp eq i32 %2, 0\l  br i1 %eqtmp, label %common.ret, label %default.next\l|{<s0>T|<s1>F}}"];
	Node0x559093cabb80:s0 -> Node0x559093cab910;
	Node0x559093cabb80:s1 -> Node0x559093cacaf0;
	Node0x559093cab910 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i32 [ 0, %entry ], [ %modtmp18, %mulMod.exit ]\l  ret i32 %common.ret.op\l}"];
	Node0x559093cacaf0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e5705870", fontname="Courier",label="{default.next:\l|  %modtmp = srem i32 %0, %1\l  %lttmp = icmp slt i32 %modtmp, 0\l  %addtmp = select i1 %lttmp, i32 %1, i32 0\l  %spec.select = add nsw i32 %addtmp, %modtmp\l  br label %loopbody\l}"];
	Node0x559093cacaf0 -> Node0x559093cacb80;
	Node0x559093cacb80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#cc403a70", fontname="Courier",label="{loopbody:\l|  %seed.134 = phi i32 [ %spec.select, %default.next ], [ %common.ret.op.i,\l... %mulMod.exit ]\l  %i.033 = phi i32 [ 0, %default.next ], [ %addtmp20, %mulMod.exit ]\l  %result.032 = phi i32 [ 0, %default.next ], [ %modtmp18, %mulMod.exit ]\l  %eqtmp3.i = icmp eq i32 %seed.134, 0\l  br i1 %eqtmp3.i, label %mulMod.exit, label %default.next5.i\l|{<s0>T|<s1>F}}"];
	Node0x559093cacb80:s0 -> Node0x559093caccf0;
	Node0x559093cacb80:s1 -> Node0x559093cad740;
	Node0x559093cad740 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{default.next5.i:\l|  %modtmp.i = srem i32 %seed.134, %1\l  %lttmp.i = icmp slt i32 %modtmp.i, 0\l  %addtmp.i = select i1 %lttmp.i, i32 %1, i32 0\l  %spec.select.i = add nsw i32 %addtmp.i, %modtmp.i\l  br label %loopbody.i\l}"];
	Node0x559093cad740 -> Node0x559093cadfe0;
	Node0x559093cadfe0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i:\l|  %a.147.i = phi i32 [ %spec.select.i, %default.next5.i ], [ %modtmp27.i,\l... %ifcont17.i ]\l  %b.046.i = phi i32 [ %seed.134, %default.next5.i ], [ %divtmp44.i,\l... %ifcont17.i ]\l  %result.045.i = phi i32 [ 0, %default.next5.i ], [ %result.1.i, %ifcont17.i ]\l  %modtmp13.i = and i32 %b.046.i, 1\l  %eqtmp14.not.i = icmp eq i32 %modtmp13.i, 0\l  br i1 %eqtmp14.not.i, label %ifcont17.i, label %then15.i\l|{<s0>T|<s1>F}}"];
	Node0x559093cadfe0:s0 -> Node0x559093cae560;
	Node0x559093cadfe0:s1 -> Node0x559093caef20;
	Node0x559093caef20 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then15.i:\l|  %addtmp20.i = add i32 %result.045.i, %a.147.i\l  %modtmp22.i = srem i32 %addtmp20.i, %1\l  br label %ifcont17.i\l}"];
	Node0x559093caef20 -> Node0x559093cae560;
	Node0x559093cae560 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont17.i:\l|  %result.1.i = phi i32 [ %modtmp22.i, %then15.i ], [ %result.045.i,\l... %loopbody.i ]\l  %addtmp25.i = shl i32 %a.147.i, 1\l  %modtmp27.i = srem i32 %addtmp25.i, %1\l  %divtmp44.i = lshr i32 %b.046.i, 1\l  %gttmp.not.i = icmp eq i32 %divtmp44.i, 0\l  br i1 %gttmp.not.i, label %mulMod.exit, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x559093cae560:s0 -> Node0x559093caccf0;
	Node0x559093cae560:s1 -> Node0x559093cadfe0;
	Node0x559093caccf0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#cc403a70", fontname="Courier",label="{mulMod.exit:\l|  %common.ret.op.i = phi i32 [ 0, %loopbody ], [ %result.1.i, %ifcont17.i ]\l  %modtmp15 = and i32 %common.ret.op.i, 1\l  %addtmp16 = add nsw i32 %modtmp15, %result.032\l  %modtmp18 = srem i32 %addtmp16, 1000000007\l  %addtmp20 = add nuw nsw i32 %i.033, 1\l  %lttmp9 = icmp samesign ult i32 %addtmp20, %2\l  br i1 %lttmp9, label %loopbody, label %common.ret\l|{<s0>T|<s1>F}}"];
	Node0x559093caccf0:s0 -> Node0x559093cacb80;
	Node0x559093caccf0:s1 -> Node0x559093cab910;
}
```

### Cyclomatic Complexity
Number of Nodes =  9
Number of Edges = 13 
Cyclomatic Complexity = E - N + 2 = 13 - 9 + 2 = 6

## `bbs_bits-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'bbsBits' function" {
	label="CFG for 'bbsBits' function";

	Node0x55d8b9dece30 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e8765c70", fontname="Courier",label="{entry:\l|  %lttmp830 = icmp sgt i32 %2, 0\l  br i1 %lttmp830, label %loopbody.preheader, label %loopexit\l|{<s0>T|<s1>F}}"];
	Node0x55d8b9dece30:s0 -> Node0x55d8b9dec9a0;
	Node0x55d8b9dece30:s1 -> Node0x55d8b9deec70;
	Node0x55d8b9dec9a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e97a5f70", fontname="Courier",label="{loopbody.preheader:\l|  %modtmp = srem i32 %0, %1\l  %lttmp = icmp slt i32 %modtmp, 0\l  %addtmp = select i1 %lttmp, i32 %1, i32 0\l  %spec.select = add i32 %addtmp, %modtmp\l  br label %loopbody\l}"];
	Node0x55d8b9dec9a0 -> Node0x55d8b9decfd0;
	Node0x55d8b9decfd0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{loopbody:\l|  %seed.133 = phi i32 [ %result.0.lcssa.i, %mulMod.exit ], [ %spec.select,\l... %loopbody.preheader ]\l  %i.032 = phi i32 [ %addtmp19, %mulMod.exit ], [ 0, %loopbody.preheader ]\l  %result.031 = phi i32 [ %modtmp17, %mulMod.exit ], [ 0, %loopbody.preheader ]\l  %gttmp27.i = icmp sgt i32 %seed.133, 0\l  br i1 %gttmp27.i, label %loopbody.i, label %mulMod.exit\l|{<s0>T|<s1>F}}"];
	Node0x55d8b9decfd0:s0 -> Node0x55d8b9def780;
	Node0x55d8b9decfd0:s1 -> Node0x55d8b9def0b0;
	Node0x55d8b9def780 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i:\l|  %addtmp12.pn.i = phi i32 [ %addtmp12.i, %ifcont.i ], [ %seed.133,\l... %loopbody ]\l  %b.029.i = phi i32 [ %divtmp25.i, %ifcont.i ], [ %seed.133, %loopbody ]\l  %result.028.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %loopbody ]\l  %a.030.i = srem i32 %addtmp12.pn.i, %1\l  %modtmp5.i = and i32 %b.029.i, 1\l  %eqtmp.not.i = icmp eq i32 %modtmp5.i, 0\l  br i1 %eqtmp.not.i, label %ifcont.i, label %then.i\l|{<s0>T|<s1>F}}"];
	Node0x55d8b9def780:s0 -> Node0x55d8b9def980;
	Node0x55d8b9def780:s1 -> Node0x55d8b9df07d0;
	Node0x55d8b9df07d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then.i:\l|  %addtmp.i = add i32 %a.030.i, %result.028.i\l  %modtmp9.i = srem i32 %addtmp.i, %1\l  br label %ifcont.i\l}"];
	Node0x55d8b9df07d0 -> Node0x55d8b9def980;
	Node0x55d8b9def980 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont.i:\l|  %result.1.i = phi i32 [ %modtmp9.i, %then.i ], [ %result.028.i,\l... %loopbody.i ]\l  %addtmp12.i = shl i32 %a.030.i, 1\l  %divtmp25.i = lshr i32 %b.029.i, 1\l  %gttmp.not.i = icmp eq i32 %divtmp25.i, 0\l  br i1 %gttmp.not.i, label %mulMod.exit, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55d8b9def980:s0 -> Node0x55d8b9def0b0;
	Node0x55d8b9def980:s1 -> Node0x55d8b9def780;
	Node0x55d8b9def0b0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{mulMod.exit:\l|  %result.0.lcssa.i = phi i32 [ 0, %loopbody ], [ %result.1.i, %ifcont.i ]\l  %modtmp14 = srem i32 %result.0.lcssa.i, 2\l  %addtmp15 = add nsw i32 %modtmp14, %result.031\l  %modtmp17 = srem i32 %addtmp15, 1000000007\l  %addtmp19 = add nuw nsw i32 %i.032, 1\l  %lttmp8 = icmp slt i32 %addtmp19, %2\l  br i1 %lttmp8, label %loopbody, label %loopexit\l|{<s0>T|<s1>F}}"];
	Node0x55d8b9def0b0:s0 -> Node0x55d8b9decfd0;
	Node0x55d8b9def0b0:s1 -> Node0x55d8b9deec70;
	Node0x55d8b9deec70 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e8765c70", fontname="Courier",label="{loopexit:\l|  %result.0.lcssa = phi i32 [ 0, %entry ], [ %modtmp17, %mulMod.exit ]\l  ret i32 %result.0.lcssa\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes =  8
Number of Edges = 12 
Cyclomatic Complexity = E - N + 2 = 12 - 8 + 2 = 6
