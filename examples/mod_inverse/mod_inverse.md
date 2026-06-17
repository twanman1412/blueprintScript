# Modular Inverse Example

### CFG (.dot)
```dot
digraph "CFG for modInverse" {
	blueprint [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{blueprint\l|check ensures contracts\lcheck default contracts\l|{<s0>Contract Applied|<s1>No Contract Applied}}"];
	blueprint:s0 -> ret;
	blueprint:s1 -> entry;

	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(mod \> 1);\l}"];
	entry -> ret;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return modExp(a, mod - 2, mod);\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 3
Number of Edges = 3
Cyclomatic Complexity = E - N + 2 = 3 - 3 + 2 = 2

### CFG (.dot)
```dot
digraph "CFG for modInverse" {
	entry [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{entry\l|assert(mod \> 1);\l}"];
	entry -> ret;

	ret [shape=record, color="#3d50c3ff", style=filled, fillcolor="#d6524470", fontname="Courier", label="{return\l|return modExp(a, mod - 2, mod);\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 2
Number of Edges = 1
Cyclomatic Complexity = E - N + 2 = 1 - 2 + 2 = 1

## `mod_inverse.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x5609ae21cd50 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i.3.i.i.preheader:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 4)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1

## `mod_inverse-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'main' function" {
	label="CFG for 'main' function";

	Node0x55a235d92db0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody.i.3.i.i.preheader:\l|  %0 = tail call i32 (ptr, ...) @printf(ptr nonnull dereferenceable(1) @fmt,\l... i32 4)\l  ret i32 0\l}"];
}
```

### Cyclomatic Complexity
Number of Nodes = 1
Number of Edges = 0
Cyclomatic Complexity = E - N + 2 = 0 - 1 + 2 = 1
