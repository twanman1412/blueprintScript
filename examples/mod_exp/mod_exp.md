# Modular Exponentiation Example

### CFG (.dot)
```dot
digraph "CFG for modExp" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;

	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(exp \>= 0);\lassert(mod \> 1);\lresult = 1;\lbase = base % mod;\lbr (base \< 0)\l|{<s0>T|<s1>F}}"];
    entry:s0 -> if_then1;
    entry:s1 -> if_end1;

	if_then1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.then1\l|base = base + mod;\l}"];
	if_then1 -> if_end1;

    if_end1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end1}"];
    if_end1 -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (exp \> 0)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|br (exp % 2 == 1)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> if_then;
	while_body:s1 -> if_end;

	if_then [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.then\l|result = mulMod(result, base, mod);\l}"];
	if_then -> if_end;

	if_end [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end\l|exp = exp / 2;\lbase = mulMod(base, base, mod);\l}"];
	if_end -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return result;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 9
Number of Edges = 12 
Cyclomatic Complexity = E - N + 2 = 12 - 9 + 2 = 5

### CFG (.dot)
```dot
digraph "CFG for modExp" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(exp \>= 0);\lassert(mod \> 1);\lresult = 1;\lbase = base % mod;\lbr (base \< 0)\l|{<s0>T|<s1>F}}"];
	entry:s0 -> if_then1;
	entry:s1 -> if_end1;

	if_then1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.then1\l|base = base + mod;\l}"];
	if_then1 -> if_end1;

	if_end1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end1}"];
	if_end1 -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (exp \> 0)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|br (exp % 2 == 1)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> if_then2;
	while_body:s1 -> if_end2;

	if_then2 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.then2\l|result = mulMod(result, base, mod);\lassert(result \>= 0);\l}"];
	if_then2 -> if_end2;

	if_end2 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end2\l|exp = exp / 2;\lbase = mulMod(base, base, mod);\lassert(base \>= 0);\l}"];
	if_end2 -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|assert(result \>= 0);\lassert(result \< mod);\lreturn result;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 8
Number of Edges = 10
Cyclomatic Complexity = E - N + 2 = 10 - 8 + 2 = 4

## `mod_exp.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x5571d16e3290 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{loopbody.i38.2.i.preheader:\l|  br label %loopbody.i.3.i\l}"];
	Node0x5571d16e3290 -> Node0x5571d16e3350;
	Node0x5571d16e3350 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i.3.i:\l|  %a.038.in.i.3.i = phi i32 [ %addtmp18.i.3.i, %ifcont.i.3.i ], [ 4,\l... %loopbody.i38.2.i.preheader ]\l  %b.037.i.3.i = phi i32 [ %divtmp34.i.3.i, %ifcont.i.3.i ], [ 256,\l... %loopbody.i38.2.i.preheader ]\l  %result.036.i.3.i = phi i32 [ %result.1.i.3.i, %ifcont.i.3.i ], [ 0,\l... %loopbody.i38.2.i.preheader ]\l  %a.038.i.3.i = srem i32 %a.038.in.i.3.i, 1000\l  %modtmp10.i.3.i = and i32 %b.037.i.3.i, 1\l  %eqtmp11.not.i.3.i = icmp eq i32 %modtmp10.i.3.i, 0\l  br i1 %eqtmp11.not.i.3.i, label %ifcont.i.3.i, label %then.i.3.i\l|{<s0>T|<s1>F}}"];
	Node0x5571d16e3350:s0 -> Node0x5571d16e5300;
	Node0x5571d16e3350:s1 -> Node0x5571d16e6880;
	Node0x5571d16e6880 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then.i.3.i:\l|  %addtmp.i.3.i = add nsw i32 %result.036.i.3.i, %a.038.i.3.i\l  %modtmp15.i.3.i = srem i32 %addtmp.i.3.i, 1000\l  br label %ifcont.i.3.i\l}"];
	Node0x5571d16e6880 -> Node0x5571d16e5300;
	Node0x5571d16e5300 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont.i.3.i:\l|  %result.1.i.3.i = phi i32 [ %modtmp15.i.3.i, %then.i.3.i ], [\l... %result.036.i.3.i, %loopbody.i.3.i ]\l  %addtmp18.i.3.i = shl nsw i32 %a.038.i.3.i, 1\l  %divtmp34.i.3.i = lshr i32 %b.037.i.3.i, 1\l  %gttmp.not.i.3.i = icmp eq i32 %divtmp34.i.3.i, 0\l  br i1 %gttmp.not.i.3.i, label %modExp.exit, label %loopbody.i.3.i\l|{<s0>T|<s1>F}}"];
	Node0x5571d16e5300:s0 -> Node0x5571d16e5b80;
	Node0x5571d16e5300:s1 -> Node0x5571d16e3350;
	Node0x5571d16e5b80 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{modExp.exit:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 %result.1.i.3.i)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 5
Number of Edges = 6
Cyclomatic Complexity = E - N + 2 = 6 - 5 + 2 = 3

## `mod_exp-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x562ffa941320 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{loopbody.i39.2.i.preheader:\l|  br label %loopbody.i.3.i\l}"];
	Node0x562ffa941320 -> Node0x562ffa9413e0;
	Node0x562ffa9413e0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i.3.i:\l|  %a.139.i.3.i = phi i32 [ %modtmp21.i.3.i, %ifcont11.i.3.i ], [ 4,\l... %loopbody.i39.2.i.preheader ]\l  %b.038.i.3.i = phi i32 [ %divtmp35.i.3.i, %ifcont11.i.3.i ], [ 256,\l... %loopbody.i39.2.i.preheader ]\l  %result.037.i.3.i = phi i32 [ %result.1.i.3.i, %ifcont11.i.3.i ], [ 0,\l... %loopbody.i39.2.i.preheader ]\l  %modtmp8.i.3.i = and i32 %b.038.i.3.i, 1\l  %eqtmp.not.i.3.i = icmp eq i32 %modtmp8.i.3.i, 0\l  br i1 %eqtmp.not.i.3.i, label %ifcont11.i.3.i, label %then9.i.3.i\l|{<s0>T|<s1>F}}"];
	Node0x562ffa9413e0:s0 -> Node0x562ffa943370;
	Node0x562ffa9413e0:s1 -> Node0x562ffa944860;
	Node0x562ffa944860 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{then9.i.3.i:\l|  %addtmp14.i.3.i = add nsw i32 %result.037.i.3.i, %a.139.i.3.i\l  %modtmp16.i.3.i = srem i32 %addtmp14.i.3.i, 1000\l  br label %ifcont11.i.3.i\l}"];
	Node0x562ffa944860 -> Node0x562ffa943370;
	Node0x562ffa943370 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont11.i.3.i:\l|  %result.1.i.3.i = phi i32 [ %modtmp16.i.3.i, %then9.i.3.i ], [\l... %result.037.i.3.i, %loopbody.i.3.i ]\l  %addtmp19.i.3.i = shl nsw i32 %a.139.i.3.i, 1\l  %modtmp21.i.3.i = srem i32 %addtmp19.i.3.i, 1000\l  %divtmp35.i.3.i = lshr i32 %b.038.i.3.i, 1\l  %gttmp.not.i.3.i = icmp eq i32 %divtmp35.i.3.i, 0\l  br i1 %gttmp.not.i.3.i, label %modExp.exit, label %loopbody.i.3.i\l|{<s0>T|<s1>F}}"];
	Node0x562ffa943370:s0 -> Node0x562ffa943bf0;
	Node0x562ffa943370:s1 -> Node0x562ffa9413e0;
	Node0x562ffa943bf0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{modExp.exit:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 %result.1.i.3.i)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 5
Number of Edges = 6
Cyclomatic Complexity = E - N + 2 = 6 - 5 + 2 = 3
