# Modular Exponentiation Example

## `mod_exp.bps`

### CFG (.dot)
```dot
digraph "CFG for modExp" {
    blueprint [label="blueprint"];
    while_loop [label="while (exp > 0)"];
    if_exp [label="if (exp % 2 == 1)"];
    exit [label="exit"];

    blueprint -> while_loop [label="otherwise"];
    blueprint -> exit [label="base case"];
    while_loop -> if_exp [label="true"];
    while_loop -> exit [label="false"];
    if_exp -> while_loop;
}
```

### Cyclomatic Complexity
Number of Nodes = 4
Number of Edges = 5
Cyclomatic Complexity = E - N + 2 = 5 - 4 + 2 = 3

## `mod_exp-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for modExp" {
    entry [label="entry"];
    if_base [label="if (base < 0)"];
    while_loop [label="while (exp > 0)"];
    if_exp [label="if (exp % 2 == 1)"];
    exit [label="exit"];

    entry -> if_base;
    if_base -> while_loop;
    while_loop -> if_exp [label="true"];
    while_loop -> exit [label="false"];
    if_exp -> while_loop;
}
```

### Cyclomatic Complexity
Number of Nodes = 5
Number of Edges = 5
Cyclomatic Complexity = E - N + 2 = 5 - 5 + 2 = 2

## `mod_exp.ll`

### CFG (.dot)
```dot
digraph "CFG for 'modExp' function" {
	label="CFG for 'modExp' function";

	Node0x55d7eb7b8a60 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e5705870", fontname="Courier",label="{entry:\l|  %eqtmp = icmp eq i32 %1, 0\l  br i1 %eqtmp, label %common.ret, label %default.next\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7b8a60:s0 -> Node0x55d7eb7b8510;
	Node0x55d7eb7b8a60:s1 -> Node0x55d7eb7b9640;
	Node0x55d7eb7b8510 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e5705870", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i32 [ 0, %default.next ], [ 1, %entry ], [ %result.1,\l... %mulMod.exit54 ]\l  ret i32 %common.ret.op\l}"];
	Node0x55d7eb7b9640 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e8765c70", fontname="Courier",label="{default.next:\l|  %modtmp = srem i32 %0, %2\l  %eqtmp4 = icmp eq i32 %modtmp, 0\l  br i1 %eqtmp4, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7b9640:s0 -> Node0x55d7eb7b8510;
	Node0x55d7eb7b9640:s1 -> Node0x55d7eb7b96d0;
	Node0x55d7eb7b96d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{loopbody:\l|  %base.057 = phi i32 [ %common.ret.op.i53, %mulMod.exit54 ], [ %modtmp,\l... %default.next ]\l  %exp.056 = phi i32 [ %divtmp34, %mulMod.exit54 ], [ %1, %default.next ]\l  %result.055 = phi i32 [ %result.1, %mulMod.exit54 ], [ 1, %default.next ]\l  %modtmp12 = and i32 %exp.056, 1\l  %eqtmp13.not = icmp eq i32 %modtmp12, 0\l  br i1 %eqtmp13.not, label %ifcont, label %then\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7b96d0:s0 -> Node0x55d7eb7ba230;
	Node0x55d7eb7b96d0:s1 -> Node0x55d7eb7ba310;
	Node0x55d7eb7ba310 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d8564670", fontname="Courier",label="{then:\l|  %eqtmp.i = icmp eq i32 %result.055, 0\l  %eqtmp3.i = icmp eq i32 %base.057, 0\l  %or.cond.i = or i1 %eqtmp.i, %eqtmp3.i\l  br i1 %or.cond.i, label %ifcont, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7ba310:s0 -> Node0x55d7eb7ba230;
	Node0x55d7eb7ba310:s1 -> Node0x55d7eb7ba390;
	Node0x55d7eb7ba390 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{loopbody.i:\l|  %.pn.i = phi i32 [ %addtmp18.i, %ifcont.i ], [ %result.055, %then ]\l  %b.037.i = phi i32 [ %divtmp34.i, %ifcont.i ], [ %base.057, %then ]\l  %result.036.i = phi i32 [ %result.1.i, %ifcont.i ], [ 0, %then ]\l  %a.038.i = srem i32 %.pn.i, %2\l  %modtmp10.i = and i32 %b.037.i, 1\l  %eqtmp11.not.i = icmp eq i32 %modtmp10.i, 0\l  br i1 %eqtmp11.not.i, label %ifcont.i, label %then.i\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7ba390:s0 -> Node0x55d7eb7bb080;
	Node0x55d7eb7ba390:s1 -> Node0x55d7eb7bbaf0;
	Node0x55d7eb7bbaf0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c5333470", fontname="Courier",label="{then.i:\l|  %addtmp.i = add i32 %a.038.i, %result.036.i\l  %modtmp15.i = srem i32 %addtmp.i, %2\l  br label %ifcont.i\l}"];
	Node0x55d7eb7bbaf0 -> Node0x55d7eb7bb080;
	Node0x55d7eb7bb080 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{ifcont.i:\l|  %result.1.i = phi i32 [ %modtmp15.i, %then.i ], [ %result.036.i,\l... %loopbody.i ]\l  %addtmp18.i = shl i32 %a.038.i, 1\l  %divtmp34.i = lshr i32 %b.037.i, 1\l  %gttmp.not.i = icmp eq i32 %divtmp34.i, 0\l  br i1 %gttmp.not.i, label %ifcont, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7bb080:s0 -> Node0x55d7eb7ba230;
	Node0x55d7eb7bb080:s1 -> Node0x55d7eb7ba390;
	Node0x55d7eb7ba230 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{ifcont:\l|  %result.1 = phi i32 [ %result.055, %loopbody ], [ 0, %then ], [\l... %result.1.i, %ifcont.i ]\l  %divtmp34 = lshr i32 %exp.056, 1\l  %eqtmp3.i36 = icmp eq i32 %base.057, 0\l  br i1 %eqtmp3.i36, label %mulMod.exit54, label %loopbody.i38\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7ba230:s0 -> Node0x55d7eb7b9840;
	Node0x55d7eb7ba230:s1 -> Node0x55d7eb7b9e00;
	Node0x55d7eb7b9e00 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i38:\l|  %.pn.i39 = phi i32 [ %addtmp18.i50, %ifcont.i48 ], [ %base.057, %ifcont ]\l  %b.037.i40 = phi i32 [ %divtmp34.i51, %ifcont.i48 ], [ %base.057, %ifcont ]\l  %result.036.i41 = phi i32 [ %result.1.i49, %ifcont.i48 ], [ 0, %ifcont ]\l  %a.038.i42 = srem i32 %.pn.i39, %2\l  %modtmp10.i43 = and i32 %b.037.i40, 1\l  %eqtmp11.not.i44 = icmp eq i32 %modtmp10.i43, 0\l  br i1 %eqtmp11.not.i44, label %ifcont.i48, label %then.i45\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7b9e00:s0 -> Node0x55d7eb7bb2b0;
	Node0x55d7eb7b9e00:s1 -> Node0x55d7eb7bc9a0;
	Node0x55d7eb7bc9a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then.i45:\l|  %addtmp.i46 = add i32 %a.038.i42, %result.036.i41\l  %modtmp15.i47 = srem i32 %addtmp.i46, %2\l  br label %ifcont.i48\l}"];
	Node0x55d7eb7bc9a0 -> Node0x55d7eb7bb2b0;
	Node0x55d7eb7bb2b0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont.i48:\l|  %result.1.i49 = phi i32 [ %modtmp15.i47, %then.i45 ], [ %result.036.i41,\l... %loopbody.i38 ]\l  %addtmp18.i50 = shl i32 %a.038.i42, 1\l  %divtmp34.i51 = lshr i32 %b.037.i40, 1\l  %gttmp.not.i52 = icmp eq i32 %divtmp34.i51, 0\l  br i1 %gttmp.not.i52, label %mulMod.exit54, label %loopbody.i38\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7bb2b0:s0 -> Node0x55d7eb7b9840;
	Node0x55d7eb7bb2b0:s1 -> Node0x55d7eb7b9e00;
	Node0x55d7eb7b9840 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{mulMod.exit54:\l|  %common.ret.op.i53 = phi i32 [ 0, %ifcont ], [ %result.1.i49, %ifcont.i48 ]\l  %gttmp.not = icmp eq i32 %divtmp34, 0\l  br i1 %gttmp.not, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x55d7eb7b9840:s0 -> Node0x55d7eb7b8510;
	Node0x55d7eb7b9840:s1 -> Node0x55d7eb7b96d0;
}
```

### Cyclomatic Complexity
Number of Nodes = 12 
Number of Edges = 21 
Cyclomatic Complexity = E - N + 2 = 21 - 12 + 2 = 11

## `mod_exp-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'modExp' function" {
	label="CFG for 'modExp' function";

	Node0x562cafc80c80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e5705870", fontname="Courier",label="{entry:\l|  %gttmp61 = icmp sgt i32 %1, 0\l  br i1 %gttmp61, label %loopbody.preheader, label %loopexit\l|{<s0>T|<s1>F}}"];
	Node0x562cafc80c80:s0 -> Node0x562cafc80950;
	Node0x562cafc80c80:s1 -> Node0x562cafc81a80;
	Node0x562cafc80950 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e97a5f70", fontname="Courier",label="{loopbody.preheader:\l|  %modtmp = srem i32 %0, %2\l  %lttmp = icmp slt i32 %modtmp, 0\l  %addtmp = select i1 %lttmp, i32 %2, i32 0\l  %spec.select = add i32 %addtmp, %modtmp\l  br label %loopbody\l}"];
	Node0x562cafc80950 -> Node0x562cafc80e20;
	Node0x562cafc80e20 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{loopbody:\l|  %base.164 = phi i32 [ %result.0.lcssa.i34, %mulMod.exit55 ], [\l... %spec.select, %loopbody.preheader ]\l  %exp.063 = phi i32 [ %divtmp3260, %mulMod.exit55 ], [ %1,\l... %loopbody.preheader ]\l  %result.062 = phi i32 [ %result.159, %mulMod.exit55 ], [ 1,\l... %loopbody.preheader ]\l  %modtmp8 = and i32 %exp.063, 1\l  %eqtmp.not = icmp eq i32 %modtmp8, 0\l  br i1 %eqtmp.not, label %ifcont11, label %then9\l|{<s0>T|<s1>F}}"];
	Node0x562cafc80e20:s0 -> Node0x562cafc826d0;
	Node0x562cafc80e20:s1 -> Node0x562cafc827c0;
	Node0x562cafc81a80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e5705870", fontname="Courier",label="{loopexit:\l|  %result.0.lcssa = phi i32 [ 1, %entry ], [ %result.159, %mulMod.exit55 ]\l  ret i32 %result.0.lcssa\l}"];
	Node0x562cafc827c0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{then9:\l|  %gttmp36.i = icmp sgt i32 %base.164, 0\l  br i1 %gttmp36.i, label %loopbody.preheader.i, label %mulMod.exit55\l|{<s0>T|<s1>F}}"];
	Node0x562cafc827c0:s0 -> Node0x562cafc82840;
	Node0x562cafc827c0:s1 -> Node0x562cafc81ec0;
	Node0x562cafc82840 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d8564670", fontname="Courier",label="{loopbody.preheader.i:\l|  %modtmp.i = srem i32 %result.062, %2\l  %lttmp.i = icmp slt i32 %modtmp.i, 0\l  %addtmp.i = select i1 %lttmp.i, i32 %2, i32 0\l  %spec.select.i = add i32 %addtmp.i, %modtmp.i\l  br label %loopbody.i\l}"];
	Node0x562cafc82840 -> Node0x562cafc83380;
	Node0x562cafc83380 [shape=record,color="#b70d28ff", style=filled, fillcolor="#bb1b2c70", fontname="Courier",label="{loopbody.i:\l|  %a.139.i = phi i32 [ %modtmp21.i, %ifcont11.i ], [ %spec.select.i,\l... %loopbody.preheader.i ]\l  %b.038.i = phi i32 [ %divtmp35.i, %ifcont11.i ], [ %base.164,\l... %loopbody.preheader.i ]\l  %result.037.i = phi i32 [ %result.1.i, %ifcont11.i ], [ 0,\l... %loopbody.preheader.i ]\l  %modtmp8.i = and i32 %b.038.i, 1\l  %eqtmp.not.i = icmp eq i32 %modtmp8.i, 0\l  br i1 %eqtmp.not.i, label %ifcont11.i, label %then9.i\l|{<s0>T|<s1>F}}"];
	Node0x562cafc83380:s0 -> Node0x562cafc83bf0;
	Node0x562cafc83380:s1 -> Node0x562cafc84290;
	Node0x562cafc84290 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{then9.i:\l|  %addtmp14.i = add i32 %result.037.i, %a.139.i\l  %modtmp16.i = srem i32 %addtmp14.i, %2\l  br label %ifcont11.i\l}"];
	Node0x562cafc84290 -> Node0x562cafc83bf0;
	Node0x562cafc83bf0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#bb1b2c70", fontname="Courier",label="{ifcont11.i:\l|  %result.1.i = phi i32 [ %modtmp16.i, %then9.i ], [ %result.037.i,\l... %loopbody.i ]\l  %addtmp19.i = shl i32 %a.139.i, 1\l  %modtmp21.i = srem i32 %addtmp19.i, %2\l  %divtmp35.i = lshr i32 %b.038.i, 1\l  %gttmp.not.i = icmp eq i32 %divtmp35.i, 0\l  br i1 %gttmp.not.i, label %ifcont11, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x562cafc83bf0:s0 -> Node0x562cafc826d0;
	Node0x562cafc83bf0:s1 -> Node0x562cafc83380;
	Node0x562cafc826d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{ifcont11:\l|  %result.1 = phi i32 [ %result.062, %loopbody ], [ %result.1.i, %ifcont11.i\l... ]\l  %gttmp36.i33 = icmp sgt i32 %base.164, 0\l  br i1 %gttmp36.i33, label %loopbody.i40, label %mulMod.exit55\l|{<s0>T|<s1>F}}"];
	Node0x562cafc826d0:s0 -> Node0x562cafc83af0;
	Node0x562cafc826d0:s1 -> Node0x562cafc81ec0;
	Node0x562cafc83af0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i40:\l|  %addtmp19.i51.pn = phi i32 [ %addtmp19.i51, %ifcont11.i49 ], [ %base.164,\l... %ifcont11 ]\l  %b.038.i42 = phi i32 [ %divtmp35.i53, %ifcont11.i49 ], [ %base.164,\l... %ifcont11 ]\l  %result.037.i43 = phi i32 [ %result.1.i50, %ifcont11.i49 ], [ 0, %ifcont11 ]\l  %a.139.i41 = srem i32 %addtmp19.i51.pn, %2\l  %modtmp8.i44 = and i32 %b.038.i42, 1\l  %eqtmp.not.i45 = icmp eq i32 %modtmp8.i44, 0\l  br i1 %eqtmp.not.i45, label %ifcont11.i49, label %then9.i46\l|{<s0>T|<s1>F}}"];
	Node0x562cafc83af0:s0 -> Node0x562cafc84b00;
	Node0x562cafc83af0:s1 -> Node0x562cafc858a0;
	Node0x562cafc858a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then9.i46:\l|  %addtmp14.i47 = add i32 %a.139.i41, %result.037.i43\l  %modtmp16.i48 = srem i32 %addtmp14.i47, %2\l  br label %ifcont11.i49\l}"];
	Node0x562cafc858a0 -> Node0x562cafc84b00;
	Node0x562cafc84b00 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont11.i49:\l|  %result.1.i50 = phi i32 [ %modtmp16.i48, %then9.i46 ], [ %result.037.i43,\l... %loopbody.i40 ]\l  %addtmp19.i51 = shl i32 %a.139.i41, 1\l  %divtmp35.i53 = lshr i32 %b.038.i42, 1\l  %gttmp.not.i54 = icmp eq i32 %divtmp35.i53, 0\l  br i1 %gttmp.not.i54, label %mulMod.exit55, label %loopbody.i40\l|{<s0>T|<s1>F}}"];
	Node0x562cafc84b00:s0 -> Node0x562cafc81ec0;
	Node0x562cafc84b00:s1 -> Node0x562cafc83af0;
	Node0x562cafc81ec0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d0473d70", fontname="Courier",label="{mulMod.exit55:\l|  %result.159 = phi i32 [ %result.1, %ifcont11 ], [ 0, %then9 ], [\l... %result.1, %ifcont11.i49 ]\l  %result.0.lcssa.i34 = phi i32 [ 0, %ifcont11 ], [ 0, %then9 ], [\l... %result.1.i50, %ifcont11.i49 ]\l  %divtmp3260 = lshr i32 %exp.063, 1\l  %gttmp.not = icmp eq i32 %divtmp3260, 0\l  br i1 %gttmp.not, label %loopexit, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x562cafc81ec0:s0 -> Node0x562cafc81a80;
	Node0x562cafc81ec0:s1 -> Node0x562cafc80e20;
}
```

### Cyclomatic Complexity
Number of Nodes = 12 
Number of Edges = 22 
Cyclomatic Complexity = E - N + 2 = 22 - 12 + 2 = 12
