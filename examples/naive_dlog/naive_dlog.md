# Naive Discrete Logarithm Example

### CFG (.dot)
```dot
digraph "CFG for discreteLog" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;

	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(mod \> 1);\lvalue = 1;\lx = 0;\l}"];
	entry -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (x \< mod)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|br (value == target)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> ret;
	while_body:s1 -> if_end;

	if_end [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end\l|value = mulMod(value, base, mod);\lx = x + 1;\l}"];
	if_end -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return ...;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 6
Number of Edges = 8
Cyclomatic Complexity = E - N + 2 = 8 - 6 + 2 = 4

### CFG (.dot)
```dot
digraph "CFG for discreteLog" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(mod \> 1);\lassert(base \>= 0);\lassert(target \>= 0);\lvalue = 1;\lx = 0;\l}"];
	entry -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (x \< mod)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|br (value == target)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> ret;
	while_body:s1 -> if_end;

	if_end [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end\l|value = mulMod(value, base, mod);\lx = x + 1;\l}"];
	if_end -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return ...;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 5
Number of Edges = 6
Cyclomatic Complexity = E - N + 2 = 6 - 5 + 2 = 3

## `naive_dlog.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x564e11794d40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 4)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1

## `naive_dlog-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x55bd8886adb0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 4)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1
