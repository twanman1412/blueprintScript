# Naive Discrete Logarithm Example

## `naive_dlog.bps`

### CFG (.dot)
```dot
digraph "CFG for discreteLog" {
    entry [label="entry"];
    blueprint [label="blueprint"];
    while_loop [label="while (x < mod)"];
    if_value [label="if (value == target)"];
    exit [label="exit"];

    entry -> blueprint;
    blueprint -> while_loop [label="otherwise"];
    blueprint -> exit [label="base case"];
    while_loop -> if_value [label="true"];
    while_loop -> exit [label="false"];
    if_value -> exit [label="true"];
    if_value -> while_loop [label="false"];
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 4

## `naive_dlog-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for discreteLog" {
    entry [label="entry"];
    while_loop [label="while (x < mod)"];
    if_value [label="if (value == target)"];
    exit [label="exit"];

    entry -> while_loop;
    while_loop -> if_value [label="true"];
    while_loop -> exit [label="false"];
    if_value -> exit [label="true"];
    if_value -> while_loop [label="false"];
}
```

### Cyclomatic Complexity
Cyclomatic Complexity = 3

## `naive_dlog.ll`

### CFG (.dot)
```dot
digraph "CFG for 'discreteLog' function" {
	label="CFG for 'discreteLog' function";

	Node0x55d34362b730 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#de614d70", fontname="Courier",label="{entry:\l|  %eqtmp = icmp eq i32 %1, 1\l  br i1 %eqtmp, label %common.ret, label %loopcond.preheader\l|{<s0>T|<s1>F}}"];
	Node0x55d34362b730:s0 -> Node0x55d34362ce10;
	Node0x55d34362b730:s1 -> Node0x55d34362f940;
	Node0x55d34362f940 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{loopcond.preheader:\l|  %eqtmp3.i = icmp eq i32 %0, 0\l  br i1 %eqtmp3.i, label %loopbody.us.peel.next, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x55d34362f940:s0 -> Node0x55d34362f9d0;
	Node0x55d34362f940:s1 -> Node0x55d34362be30;
	Node0x55d34362f9d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e97a5f70", fontname="Courier",label="{loopbody.us.peel.next:\l|  %eqtmp6.us = icmp eq i32 %1, 0\l  br label %loopbody.us\l}"];
	Node0x55d34362f9d0 -> Node0x55d34362bdd0;
	Node0x55d34362bdd0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{loopbody.us:\l|  %x.019.us = phi i32 [ %addtmp.us, %ifcont.us ], [ 1,\l... %loopbody.us.peel.next ]\l  br i1 %eqtmp6.us, label %common.ret, label %ifcont.us\l|{<s0>T|<s1>F}}"];
	Node0x55d34362bdd0:s0 -> Node0x55d34362ce10;
	Node0x55d34362bdd0:s1 -> Node0x55d34362c190;
	Node0x55d34362c190 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{ifcont.us:\l|  %addtmp.us = add nuw nsw i32 %x.019.us, 1\l  %lttmp.us = icmp samesign ult i32 %addtmp.us, %2\l  br i1 %lttmp.us, label %loopbody.us, label %common.ret, !llvm.loop !0\l|{<s0>T|<s1>F}}"];
	Node0x55d34362c190:s0 -> Node0x55d34362bdd0;
	Node0x55d34362c190:s1 -> Node0x55d34362ce10;
	Node0x55d34362ce10 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#de614d70", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i32 [ 0, %entry ], [ %x.019.us, %loopbody.us ], [ -1,\l... %ifcont.us ], [ %x.019, %loopbody ], [ -1, %mulMod.exit ]\l  ret i32 %common.ret.op\l}"];
	Node0x55d34362be30 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{loopbody:\l|  %x.019 = phi i32 [ %addtmp, %mulMod.exit ], [ 0, %loopcond.preheader ]\l  %value.018 = phi i32 [ %common.ret.op.i, %mulMod.exit ], [ 1,\l... %loopcond.preheader ]\l  %eqtmp6 = icmp eq i32 %value.018, %1\l  br i1 %eqtmp6, label %common.ret, label %ifcont\l|{<s0>T|<s1>F}}"];
	Node0x55d34362be30:s0 -> Node0x55d34362ce10;
	Node0x55d34362be30:s1 -> Node0x55d3436646c0;
	Node0x55d3436646c0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{ifcont:\l|  %eqtmp.i = icmp eq i32 %value.018, 0\l  br i1 %eqtmp.i, label %mulMod.exit, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55d3436646c0:s0 -> Node0x55d34362c090;
	Node0x55d3436646c0:s1 -> Node0x55d343664740;
	Node0x55d343664740 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i:\l|  %value.0.pn = phi i32 [ %addtmp25.i, %ifcont17.i ], [ %value.018, %ifcont ]\l  %b.046.i = phi i32 [ %divtmp44.i, %ifcont17.i ], [ %0, %ifcont ]\l  %result.045.i = phi i32 [ %result.1.i, %ifcont17.i ], [ 0, %ifcont ]\l  %a.147.i = srem i32 %value.0.pn, %2\l  %modtmp13.i = and i32 %b.046.i, 1\l  %eqtmp14.not.i = icmp eq i32 %modtmp13.i, 0\l  br i1 %eqtmp14.not.i, label %ifcont17.i, label %then15.i\l|{<s0>T|<s1>F}}"];
	Node0x55d343664740:s0 -> Node0x55d343664a70;
	Node0x55d343664740:s1 -> Node0x55d3436651d0;
	Node0x55d3436651d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then15.i:\l|  %addtmp20.i = add i32 %a.147.i, %result.045.i\l  %modtmp22.i = srem i32 %addtmp20.i, %2\l  br label %ifcont17.i\l}"];
	Node0x55d3436651d0 -> Node0x55d343664a70;
	Node0x55d343664a70 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont17.i:\l|  %result.1.i = phi i32 [ %modtmp22.i, %then15.i ], [ %result.045.i,\l... %loopbody.i ]\l  %addtmp25.i = shl i32 %a.147.i, 1\l  %divtmp44.i = lshr i32 %b.046.i, 1\l  %gttmp.not.i = icmp eq i32 %divtmp44.i, 0\l  br i1 %gttmp.not.i, label %mulMod.exit, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55d343664a70:s0 -> Node0x55d34362c090;
	Node0x55d343664a70:s1 -> Node0x55d343664740;
	Node0x55d34362c090 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d24b4070", fontname="Courier",label="{mulMod.exit:\l|  %common.ret.op.i = phi i32 [ 0, %ifcont ], [ %result.1.i, %ifcont17.i ]\l  %addtmp = add nuw nsw i32 %x.019, 1\l  %lttmp = icmp samesign ult i32 %addtmp, %2\l  br i1 %lttmp, label %loopbody, label %common.ret\l|{<s0>T|<s1>F}}"];
	Node0x55d34362c090:s0 -> Node0x55d34362be30;
	Node0x55d34362c090:s1 -> Node0x55d34362ce10;
}
```

### Cyclomatic Complexity
Number of Nodes = 12
Number of Edges = 20
Cyclomatic Complexity = E - N + 2 = 20 - 12 + 2 = 10

## `naive_dlog-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'discreteLog' function" {
	label="CFG for 'discreteLog' function";

	Node0x558c089ce4e0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{entry:\l|  %lttmp14 = icmp sgt i32 %2, 0\l  br i1 %lttmp14, label %loopbody.lr.ph, label %common.ret\l|{<s0>T|<s1>F}}"];
	Node0x558c089ce4e0:s0 -> Node0x558c089ce180;
	Node0x558c089ce4e0:s1 -> Node0x558c089d03d0;
	Node0x558c089ce180 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e5705870", fontname="Courier",label="{loopbody.lr.ph:\l|  %gttmp36.i = icmp sgt i32 %0, 0\l  br i1 %gttmp36.i, label %loopbody.us, label %loopbody.preheader\l|{<s0>T|<s1>F}}"];
	Node0x558c089ce180:s0 -> Node0x558c089d1150;
	Node0x558c089ce180:s1 -> Node0x558c089d3a40;
	Node0x558c089d3a40 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#ec7f6370", fontname="Courier",label="{loopbody.preheader:\l|  %eqtmp.peel = icmp eq i32 %1, 1\l  br i1 %eqtmp.peel, label %common.ret, label %ifcont.peel\l|{<s0>T|<s1>F}}"];
	Node0x558c089d3a40:s0 -> Node0x558c089d03d0;
	Node0x558c089d3a40:s1 -> Node0x558c089d3ad0;
	Node0x558c089d3ad0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#ef886b70", fontname="Courier",label="{ifcont.peel:\l|  %lttmp.peel.not = icmp eq i32 %2, 1\l  br i1 %lttmp.peel.not, label %common.ret, label %loopbody.peel.next\l|{<s0>T|<s1>F}}"];
	Node0x558c089d3ad0:s0 -> Node0x558c089d03d0;
	Node0x558c089d3ad0:s1 -> Node0x558c089cee20;
	Node0x558c089cee20 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#f08b6e70", fontname="Courier",label="{loopbody.peel.next:\l|  %eqtmp = icmp eq i32 %1, 0\l  br label %loopbody\l}"];
	Node0x558c089cee20 -> Node0x558c089cf020;
	Node0x558c089d1150 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{loopbody.us:\l|  %x.016.us = phi i32 [ %addtmp.us, %mulMod.exit.loopexit.us ], [ 0,\l... %loopbody.lr.ph ]\l  %value.015.us = phi i32 [ %result.1.i.us, %mulMod.exit.loopexit.us ], [ 1,\l... %loopbody.lr.ph ]\l  %eqtmp.us = icmp eq i32 %value.015.us, %1\l  br i1 %eqtmp.us, label %common.ret, label %ifcont.us\l|{<s0>T|<s1>F}}"];
	Node0x558c089d1150:s0 -> Node0x558c089d03d0;
	Node0x558c089d1150:s1 -> Node0x558c089d3e40;
	Node0x558c089d3e40 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{ifcont.us:\l|  %modtmp.i.us = srem i32 %value.015.us, %2\l  %lttmp.i.us = icmp slt i32 %modtmp.i.us, 0\l  %addtmp.i.us = select i1 %lttmp.i.us, i32 %2, i32 0\l  %spec.select.i.us = add i32 %addtmp.i.us, %modtmp.i.us\l  br label %loopbody.i.us\l}"];
	Node0x558c089d3e40 -> Node0x558c089d3ed0;
	Node0x558c089d3ed0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i.us:\l|  %a.139.i.us = phi i32 [ %modtmp21.i.us, %ifcont11.i.us ], [\l... %spec.select.i.us, %ifcont.us ]\l  %b.038.i.us = phi i32 [ %divtmp35.i.us, %ifcont11.i.us ], [ %0, %ifcont.us ]\l  %result.037.i.us = phi i32 [ %result.1.i.us, %ifcont11.i.us ], [ 0,\l... %ifcont.us ]\l  %modtmp8.i.us = and i32 %b.038.i.us, 1\l  %eqtmp.not.i.us = icmp eq i32 %modtmp8.i.us, 0\l  br i1 %eqtmp.not.i.us, label %ifcont11.i.us, label %then9.i.us\l|{<s0>T|<s1>F}}"];
	Node0x558c089d3ed0:s0 -> Node0x558c089d4460;
	Node0x558c089d3ed0:s1 -> Node0x558c08a07e10;
	Node0x558c08a07e10 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then9.i.us:\l|  %addtmp14.i.us = add i32 %result.037.i.us, %a.139.i.us\l  %modtmp16.i.us = srem i32 %addtmp14.i.us, %2\l  br label %ifcont11.i.us\l}"];
	Node0x558c08a07e10 -> Node0x558c089d4460;
	Node0x558c089d4460 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont11.i.us:\l|  %result.1.i.us = phi i32 [ %modtmp16.i.us, %then9.i.us ], [\l... %result.037.i.us, %loopbody.i.us ]\l  %addtmp19.i.us = shl i32 %a.139.i.us, 1\l  %modtmp21.i.us = srem i32 %addtmp19.i.us, %2\l  %divtmp35.i.us = lshr i32 %b.038.i.us, 1\l  %gttmp.not.i.us = icmp eq i32 %divtmp35.i.us, 0\l  br i1 %gttmp.not.i.us, label %mulMod.exit.loopexit.us, label %loopbody.i.us\l|{<s0>T|<s1>F}}"];
	Node0x558c089d4460:s0 -> Node0x558c089cf320;
	Node0x558c089d4460:s1 -> Node0x558c089d3ed0;
	Node0x558c089cf320 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{mulMod.exit.loopexit.us:\l|  %addtmp.us = add nuw nsw i32 %x.016.us, 1\l  %lttmp.us = icmp slt i32 %addtmp.us, %2\l  br i1 %lttmp.us, label %loopbody.us, label %common.ret\l|{<s0>T|<s1>F}}"];
	Node0x558c089cf320:s0 -> Node0x558c089d1150;
	Node0x558c089cf320:s1 -> Node0x558c089d03d0;
	Node0x558c089cf020 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{loopbody:\l|  %x.016 = phi i32 [ %addtmp, %ifcont ], [ 1, %loopbody.peel.next ]\l  br i1 %eqtmp, label %common.ret, label %ifcont\l|{<s0>T|<s1>F}}"];
	Node0x558c089cf020:s0 -> Node0x558c089d03d0;
	Node0x558c089cf020:s1 -> Node0x558c089d39b0;
	Node0x558c089d03d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i32 [ -1, %ifcont.peel ], [ -1, %entry ], [\l... %x.016.us, %loopbody.us ], [ 0, %loopbody.preheader ], [ -1,\l... %mulMod.exit.loopexit.us ], [ -1, %ifcont ], [ %x.016, %loopbody ]\l  ret i32 %common.ret.op\l}"];
	Node0x558c089d39b0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#e36c5570", fontname="Courier",label="{ifcont:\l|  %addtmp = add nuw nsw i32 %x.016, 1\l  %lttmp = icmp slt i32 %addtmp, %2\l  br i1 %lttmp, label %loopbody, label %common.ret, !llvm.loop !0\l|{<s0>T|<s1>F}}"];
	Node0x558c089d39b0:s0 -> Node0x558c089cf020;
	Node0x558c089d39b0:s1 -> Node0x558c089d03d0;
}
```

### Cyclomatic Complexity
Number of Nodes = 14
Number of Edges = 22
Cyclomatic Complexity = E - N + 2 = 22 - 14 + 2 = 10
