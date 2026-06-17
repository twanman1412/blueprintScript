# Square Test Example

### CFG (.dot)
```dot
digraph "CFG for isSquare" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;

	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\lodd = 1;\l}"];
	entry -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (n \> 0)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|n = n - odd;\lodd = odd + 2;\l}"];
	while_body -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return n == 0;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 5
Number of Edges = 6
Cyclomatic Complexity = E - N + 2 = 6 - 5 + 2 = 3

### CFG (.dot)
```dot
digraph "CFG for isSquare" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\lodd = 1;\l}"];
	entry -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (n \> 0)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|n = n - odd;\lodd = odd + 2;\l}"];
	while_body -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return n == 0;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 4
Number of Edges = 4
Cyclomatic Complexity = E - N + 2 = 4 - 4 + 2 = 2

## `square_test.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x55562815fd40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 1)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1

## `square_test-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x558f9e64bd90 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 1)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1
