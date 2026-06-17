# Prime Test Example

### CFG (.dot)
```dot
digraph "CFG for isPrime" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;

	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\lbr (n \<= 1)\l|{<s0>T|<s1>F}}"];
	entry:s0 -> ret;
	entry:s1 -> if_end1;

	if_end1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end1\l|br (n \<= 3)\l|{<s0>T|<s1>F}}"];
	if_end1:s0 -> ret;
	if_end1:s1 -> if_end2;

	if_end2 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end2\l|br (n % 2 == 0)\l|{<s0>T|<s1>F}}"];
	if_end2:s0 -> ret;
	if_end2:s1 -> if_end3;

	if_end3 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end3\l|i = 3;\l}"];
	if_end3 -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (i \<= n / i)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|br (n % i == 0)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> ret;
	while_body:s1 -> if_end4;

	if_end4 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end4\l|i = i + 2;\l}"];
	if_end4 -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return ...;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 9
Number of Edges = 14
Cyclomatic Complexity = E - N + 2 = 14 - 9 + 2 = 7

### CFG (.dot)
```dot
digraph "CFG for isPrime" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(n \>= 0);\lbr (n \<= 1)\l|{<s0>T|<s1>F}}"];
	entry:s0 -> ret;
	entry:s1 -> if_end1;

	if_end1 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end1\l|br (n \<= 3)\l|{<s0>T|<s1>F}}"];
	if_end1:s0 -> ret;
	if_end1:s1 -> if_end2;

	if_end2 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end2\l|br (n % 2 == 0)\l|{<s0>T|<s1>F}}"];
	if_end2:s0 -> ret;
	if_end2:s1 -> if_end3;

	if_end3 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end3\l|i = 3;\l}"];
	if_end3 -> while_cond;

	while_cond [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.cond\l|br (i \<= n / i)\l|{<s0>T|<s1>F}}"];
	while_cond:s0 -> while_body;
	while_cond:s1 -> ret;

	while_body [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{while.body\l|br (n % i == 0)\l|{<s0>T|<s1>F}}"];
	while_body:s0 -> ret;
	while_body:s1 -> if_end4;

	if_end4 [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{if.end4\l|i = i + 2;\l}"];
	if_end4 -> while_cond;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return ...;\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 8
Number of Edges = 12
Cyclomatic Complexity = E - N + 2 = 12 - 8 + 2 = 6

## `prime_test.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x55905909fd40 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 1)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1

## `prime_test-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x56396f6bbdb0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 1)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1
