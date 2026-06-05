# Prime Test Example

## `prime_test.bps`

### CFG (.dot)
```dot
digraph "CFG for isPrime" {
    blueprint [label="blueprint"];
    if_n_le_1 [label="if (n <= 1)"];
    if_n_le_3 [label="if (n <= 3)"];
    if_n_mod_2 [label="if (n % 2 == 0)"];
    while_loop [label="while (i <= n / i)"];
    if_n_mod_i [label="if (n % i == 0)"];
    exit [label="exit"];

    blueprint -> if_n_le_1 [label="otherwise"];
    blueprint -> exit [label="base case"];
    if_n_le_1 -> exit [label="true"];
    if_n_le_1 -> if_n_le_3 [label="false"];
    if_n_le_3 -> exit [label="true"];
    if_n_le_3 -> if_n_mod_2 [label="false"];
    if_n_mod_2 -> exit [label="true"];
    if_n_mod_2 -> while_loop [label="false"];
    while_loop -> if_n_mod_i [label="true"];
    while_loop -> exit [label="false"];
    if_n_mod_i -> exit [label="true"];
    if_n_mod_i -> while_loop [label="false"];
}
```

### Cyclomatic Complexity
Number of Nodes = 7
Number of Edges = 12
Cyclomatic Complexity = E - N + 2 = 12 - 7 + 2 = 7

## `prime_test-defensive.bps`

### CFG (.dot)
```dot
digraph "CFG for isPrime" {
    entry [label="entry"];
    if_n_le_1 [label="if (n <= 1)"];
    if_n_le_3 [label="if (n <= 3)"];
    if_n_mod_2 [label="if (n % 2 == 0)"];
    while_loop [label="while (i <= n / i)"];
    if_n_mod_i [label="if (n % i == 0)"];
    exit [label="exit"];

    entry -> if_n_le_1;
    if_n_le_1 -> exit [label="true"];
    if_n_le_1 -> if_n_le_3 [label="false"];
    if_n_le_3 -> exit [label="true"];
    if_n_le_3 -> if_n_mod_2 [label="false"];
    if_n_mod_2 -> exit [label="true"];
    if_n_mod_2 -> while_loop [label="false"];
    while_loop -> if_n_mod_i [label="true"];
    while_loop -> exit [label="false"];
    if_n_mod_i -> exit [label="true"];
    if_n_mod_i -> while_loop [label="false"];
}
```

### Cyclomatic Complexity
Number of Nodes = 7
Number of Edges = 11
Cyclomatic Complexity = E - N + 2 = 11 - 7 + 2 = 6

## `prime_test.ll`

### CFG (.dot)
```dot
digraph "CFG for 'isPrime' function" {
	label="CFG for 'isPrime' function";

	Node0x5625ad029090 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %letmp = icmp samesign ult i32 %0, 2\l  br i1 %letmp, label %common.ret, label %default.next\l|{<s0>T|<s1>F}}"];
	Node0x5625ad029090:s0 -> Node0x5625ad0291d0;
	Node0x5625ad029090:s1 -> Node0x5625ad029900;
	Node0x5625ad0291d0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i1 [ false, %ifcont11 ], [ false, %entry ], [ true,\l... %default.next ], [ true, %loopcond.preheader ], [ %eqtmp24.not.not, %loopbody\l... ], [ %eqtmp24.not.not, %loopcond ]\l  ret i1 %common.ret.op\l}"];
	Node0x5625ad029900 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{default.next:\l|  %1 = icmp samesign ult i32 %0, 4\l  br i1 %1, label %common.ret, label %ifcont11\l|{<s0>T|<s1>F}}"];
	Node0x5625ad029900:s0 -> Node0x5625ad0291d0;
	Node0x5625ad029900:s1 -> Node0x5625ad0298a0;
	Node0x5625ad0298a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c5333470", fontname="Courier",label="{ifcont11:\l|  %modtmp = and i32 %0, 1\l  %eqtmp13 = icmp eq i32 %modtmp, 0\l  br i1 %eqtmp13, label %common.ret, label %loopcond.preheader\l|{<s0>T|<s1>F}}"];
	Node0x5625ad0298a0:s0 -> Node0x5625ad0291d0;
	Node0x5625ad0298a0:s1 -> Node0x5625ad02a3e0;
	Node0x5625ad02a3e0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#cc403a70", fontname="Courier",label="{loopcond.preheader:\l|  %letmp20.not39 = icmp samesign ult i32 %0, 9\l  br i1 %letmp20.not39, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x5625ad02a3e0:s0 -> Node0x5625ad0291d0;
	Node0x5625ad02a3e0:s1 -> Node0x5625ad02a580;
	Node0x5625ad02a6a0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopcond:\l|  %addtmp = add i32 %i.040, 2\l  %divtmp = sdiv i32 %0, %addtmp\l  %letmp20.not = icmp sgt i32 %addtmp, %divtmp\l  br i1 %letmp20.not, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x5625ad02a6a0:s0 -> Node0x5625ad0291d0;
	Node0x5625ad02a6a0:s1 -> Node0x5625ad02a580;
	Node0x5625ad02a580 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody:\l|  %i.040 = phi i32 [ %addtmp, %loopcond ], [ 3, %loopcond.preheader ]\l  %modtmp23 = srem i32 %0, %i.040\l  %eqtmp24.not.not = icmp ne i32 %modtmp23, 0\l  br i1 %eqtmp24.not.not, label %loopcond, label %common.ret\l|{<s0>T|<s1>F}}"];
	Node0x5625ad02a580:s0 -> Node0x5625ad02a6a0;
	Node0x5625ad02a580:s1 -> Node0x5625ad0291d0;
}
```

### Cyclomatic Complexity
Number of Nodes = 7
Number of Edges = 12
Cyclomatic Complexity = E - N + 2 = 12 - 7 + 2 = 7

## `prime_test-defensive.ll`

### CFG (.dot)
```dot
digraph "CFG for 'isPrime' function" {
	label="CFG for 'isPrime' function";

	Node0x564dec6d2070 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{entry:\l|  %letmp = icmp slt i32 %0, 2\l  br i1 %letmp, label %common.ret, label %ifcont\l|{<s0>T|<s1>F}}"];
	Node0x564dec6d2070:s0 -> Node0x564dec6d21b0;
	Node0x564dec6d2070:s1 -> Node0x564dec6d28e0;
	Node0x564dec6d21b0 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{common.ret:\l|  %common.ret.op = phi i1 [ false, %ifcont6 ], [ false, %entry ], [ true,\l... %ifcont ], [ true, %loopcond.preheader ], [ %eqtmp18.not.not, %loopbody ], [\l... %eqtmp18.not.not, %loopcond ]\l  ret i1 %common.ret.op\l}"];
	Node0x564dec6d28e0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#be242e70", fontname="Courier",label="{ifcont:\l|  %letmp3 = icmp samesign ult i32 %0, 4\l  br i1 %letmp3, label %common.ret, label %ifcont6\l|{<s0>T|<s1>F}}"];
	Node0x564dec6d28e0:s0 -> Node0x564dec6d21b0;
	Node0x564dec6d28e0:s1 -> Node0x564dec6d2880;
	Node0x564dec6d2880 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#c5333470", fontname="Courier",label="{ifcont6:\l|  %modtmp = and i32 %0, 1\l  %eqtmp = icmp eq i32 %modtmp, 0\l  br i1 %eqtmp, label %common.ret, label %loopcond.preheader\l|{<s0>T|<s1>F}}"];
	Node0x564dec6d2880:s0 -> Node0x564dec6d21b0;
	Node0x564dec6d2880:s1 -> Node0x564dec6d33a0;
	Node0x564dec6d33a0 [shape=record,color="#3d50c3ff", style=filled, fillcolor="#cc403a70", fontname="Courier",label="{loopcond.preheader:\l|  %letmp14.not31 = icmp samesign ult i32 %0, 9\l  br i1 %letmp14.not31, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x564dec6d33a0:s0 -> Node0x564dec6d21b0;
	Node0x564dec6d33a0:s1 -> Node0x564dec6d3540;
	Node0x564dec6d3660 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopcond:\l|  %addtmp = add i32 %i.032, 2\l  %divtmp = sdiv i32 %0, %addtmp\l  %letmp14.not = icmp sgt i32 %addtmp, %divtmp\l  br i1 %letmp14.not, label %common.ret, label %loopbody\l|{<s0>T|<s1>F}}"];
	Node0x564dec6d3660:s0 -> Node0x564dec6d21b0;
	Node0x564dec6d3660:s1 -> Node0x564dec6d3540;
	Node0x564dec6d3540 [shape=record,color="#b70d28ff", style=filled, fillcolor="#b70d2870", fontname="Courier",label="{loopbody:\l|  %i.032 = phi i32 [ %addtmp, %loopcond ], [ 3, %loopcond.preheader ]\l  %modtmp17 = srem i32 %0, %i.032\l  %eqtmp18.not.not = icmp ne i32 %modtmp17, 0\l  br i1 %eqtmp18.not.not, label %loopcond, label %common.ret\l|{<s0>T|<s1>F}}"];
	Node0x564dec6d3540:s0 -> Node0x564dec6d3660;
	Node0x564dec6d3540:s1 -> Node0x564dec6d21b0;
}
```

### Cyclomatic Complexity
Number of Nodes = 7
Number of Edges = 12
Cyclomatic Complexity = E - N + 2 = 12 - 7 + 2 = 7
