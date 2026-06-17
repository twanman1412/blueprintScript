# Integer Square Root Example

### CFG (.dot)
```dot
digraph "CFG for intSqrt" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;

	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\llow = 0;\lhigh = n;\lresult = 0;\l}"];
	entry -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (low \<= high)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|mid = low + (high - low) / 2;\lbr (mid == 0)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> if_then;
	while_body:s1 -> if_else_cond;

	if_then [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.then\l|result = 0;\llow = 1;\l}"];
	if_then -> if_end;

	if_else_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.else.cond\l|br (mid \<= n / mid)\l|{<s0>T|<s1>F}}"];
	if_else_cond:s0 -> else_if_then;
	if_else_cond:s1 -> else_else;

	else_if_then [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{else.if.then\l|result = mid;\llow = mid + 1;\l}"];
	else_if_then -> if_end;

	else_else [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{else.else\l|high = mid - 1;\l}"];
	else_else -> if_end;

	if_end [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end}"];
	if_end -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return result;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 10
Number of Edges = 13
Cyclomatic Complexity = E - N + 2 = 13 - 10 + 2 = 5

### CFG (.dot)
```dot
digraph "CFG for intSqrt" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\llow = 0;\lhigh = n;\lresult = 0;\l}"];
	entry -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (low \<= high)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|mid = low + (high - low) / 2;\lbr (mid == 0)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> if_then;
	while_body:s1 -> if_else_cond;

	if_then [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.then\l|result = 0;\llow = 1;\l}"];
	if_then -> if_end;

	if_else_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.else.cond\l|br (mid \<= n / mid)\l|{<s0>T|<s1>F}}"];
	if_else_cond:s0 -> else_if_then;
	if_else_cond:s1 -> else_else;

	else_if_then [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{else.if.then\l|result = mid;\llow = mid + 1;\l}"];
	else_if_then -> if_end;

	else_else [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{else.else\l|high = mid - 1;\l}"];
	else_else -> if_end;

	if_end [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end}"];
	if_end -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return result;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 9
Number of Edges = 11
Cyclomatic Complexity = E - N + 2 = 11 - 9 + 2 = 4

## `int_sqrt.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x55582635c380 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{entry:\l|  br label %loopbody.i\l}"];
	Node0x55582635c380 -> Node0x55582635c440;
	Node0x55582635c440 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i:\l|  %result.037.i = phi i32 [ 0, %entry ], [ %result.1.i, %ifcont.i ]\l  %low.036.i = phi i32 [ 0, %entry ], [ %low.1.i, %ifcont.i ]\l  %high.035.i = phi i32 [ 70, %entry ], [ %high.1.i, %ifcont.i ]\l  %subtmp.i = sub nsw i32 %high.035.i, %low.036.i\l  %divtmp34.i = lshr i32 %subtmp.i, 1\l  %addtmp.i = add nuw nsw i32 %divtmp34.i, %low.036.i\l  %eqtmp9.i = icmp eq i32 %addtmp.i, 0\l  br i1 %eqtmp9.i, label %ifcont.i, label %else.i\l|{<s0>T|<s1>F}}"];
	Node0x55582635c440:s0 -> Node0x55582635e7f0;
	Node0x55582635c440:s1 -> Node0x55582635f860;
	Node0x55582635f860 [shape=record,color="#b70d28ff", style=filled, fillcolor="#bb1b2c70", fontname="Courier",label="{else.i:\l|  %divtmp13.i = udiv i32 70, %addtmp.i\l  %letmp14.not.i = icmp sgt i32 %addtmp.i, %divtmp13.i\l  br i1 %letmp14.not.i, label %else16.i, label %then15.i\l|{<s0>T|<s1>F}}"];
	Node0x55582635f860:s0 -> Node0x55582635f8e0;
	Node0x55582635f860:s1 -> Node0x55582635fae0;
	Node0x55582635e7f0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont.i:\l|  %high.1.i = phi i32 [ %subtmp22.i, %else16.i ], [ %high.035.i, %then15.i\l... ], [ %high.035.i, %loopbody.i ]\l  %low.1.i = phi i32 [ %low.036.i, %else16.i ], [ %addtmp20.i, %then15.i ], [\l... 1, %loopbody.i ]\l  %result.1.i = phi i32 [ %result.037.i, %else16.i ], [ %addtmp.i, %then15.i\l... ], [ 0, %loopbody.i ]\l  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i\l  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55582635e7f0:s0 -> Node0x55582635e280;
	Node0x55582635e7f0:s1 -> Node0x55582635c440;
	Node0x55582635fae0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{then15.i:\l|  %addtmp20.i = add nuw nsw i32 %addtmp.i, 1\l  br label %ifcont.i\l}"];
	Node0x55582635fae0 -> Node0x55582635e7f0;
	Node0x55582635f8e0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{else16.i:\l|  %subtmp22.i = add nsw i32 %addtmp.i, -1\l  br label %ifcont.i\l}"];
	Node0x55582635f8e0 -> Node0x55582635e7f0;
	Node0x55582635e280 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{intSqrt.exit:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 %result.1.i)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes =  7
Number of Edges = 9
Cyclomatic Complexity = E - N + 2 = 9 - 7 + 2 = 4

## `int_sqrt-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x55f0cca0a3f0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{entry:\l|  br label %loopbody.i\l}"];
	Node0x55f0cca0a3f0 -> Node0x55f0cca0a4b0;
	Node0x55f0cca0a4b0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i:\l|  %result.034.i = phi i32 [ 0, %entry ], [ %result.1.i, %ifcont.i ]\l  %low.033.i = phi i32 [ 0, %entry ], [ %low.1.i, %ifcont.i ]\l  %high.032.i = phi i32 [ 70, %entry ], [ %high.1.i, %ifcont.i ]\l  %subtmp.i = sub nsw i32 %high.032.i, %low.033.i\l  %divtmp31.i = lshr i32 %subtmp.i, 1\l  %addtmp.i = add nuw nsw i32 %divtmp31.i, %low.033.i\l  %eqtmp.i = icmp eq i32 %addtmp.i, 0\l  br i1 %eqtmp.i, label %ifcont.i, label %else.i\l|{<s0>T|<s1>F}}"];
	Node0x55f0cca0a4b0:s0 -> Node0x55f0cca0c840;
	Node0x55f0cca0a4b0:s1 -> Node0x55f0cca0d8a0;
	Node0x55f0cca0d8a0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#bb1b2c70", fontname="Courier",label="{else.i:\l|  %divtmp11.i = udiv i32 70, %addtmp.i\l  %letmp12.not.i = icmp sgt i32 %addtmp.i, %divtmp11.i\l  br i1 %letmp12.not.i, label %else14.i, label %then13.i\l|{<s0>T|<s1>F}}"];
	Node0x55f0cca0d8a0:s0 -> Node0x55f0cca0d920;
	Node0x55f0cca0d8a0:s1 -> Node0x55f0cca0db20;
	Node0x55f0cca0c840 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{ifcont.i:\l|  %high.1.i = phi i32 [ %subtmp20.i, %else14.i ], [ %high.032.i, %then13.i\l... ], [ %high.032.i, %loopbody.i ]\l  %low.1.i = phi i32 [ %low.033.i, %else14.i ], [ %addtmp18.i, %then13.i ], [\l... 1, %loopbody.i ]\l  %result.1.i = phi i32 [ %result.034.i, %else14.i ], [ %addtmp.i, %then13.i\l... ], [ 0, %loopbody.i ]\l  %letmp.not.i = icmp sgt i32 %low.1.i, %high.1.i\l  br i1 %letmp.not.i, label %intSqrt.exit, label %loopbody.i\l|{<s0>T|<s1>F}}"];
	Node0x55f0cca0c840:s0 -> Node0x55f0cca0c2d0;
	Node0x55f0cca0c840:s1 -> Node0x55f0cca0a4b0;
	Node0x55f0cca0db20 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{then13.i:\l|  %addtmp18.i = add nuw nsw i32 %addtmp.i, 1\l  br label %ifcont.i\l}"];
	Node0x55f0cca0db20 -> Node0x55f0cca0c840;
	Node0x55f0cca0d920 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c32e3170", fontname="Courier",label="{else14.i:\l|  %subtmp20.i = add nsw i32 %addtmp.i, -1\l  br label %ifcont.i\l}"];
	Node0x55f0cca0d920 -> Node0x55f0cca0c840;
	Node0x55f0cca0c2d0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier",label="{intSqrt.exit:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 %result.1.i)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes =  7
Number of Edges = 9
Cyclomatic Complexity = E - N + 2 = 9 - 7 + 2 = 4
