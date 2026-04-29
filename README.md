# BlueprintScript

`BlueprintScript` is the programming language that I developed for my Bachelor's thesis of Technical Computer Science at the University of Twente. It is a strict subset of [Blueprint](https://github.com/twanman1412/blueprint), an object oriented programming language that uses strong design by contract principles. `BlueprintScript` is designed to be a pure mathematical subset of `Blueprint`, and is used for thesis to prove the soundness and eficacy of the blueprint system designed to be in `Blueprint`.

## Key Features

`BlueprintScript` is a simple imperative subset of `Blueprint` that includes the following features:

### Types

+ 'i32': 32-bit signed integer
+ 'bool': boolean
+ 'void': no value

### Functions

Functions in `BlueprintScript` are defined using the `function` keyword, followed by the function type, name, and parameters. For example:

```blueprintScript
function i32 add(i32 a, i32 b) {
    return a + b;
}
```

### Variables

Variables in `BlueprintScript` must be strictly function local, and are declared by their type followed by their name. For example:

```BlueprintScript
function void example() {
    # Assignment
    i32 x = 5;
    bool y = true;

    # Reassignment
    x = x + 1;
    y = false;
}
```

### Control Flow

`BlueprintScript` supports standard control flow constructs such as `if`, `else`, and `while`. For example:

```BlueprintScript
function void example() {
    i32 x = 5;
    if (x > 0) {
        x = x - 1;
    } else {
        x = x + 1;
    }
}
```

### Blueprints and Contracts

`BlueprintScript`'s most distinctive feature is the `blueprint` object and the contracts within them. A `blueprint` is a special type of object that contains information about the function, independent of the function's implementation. It is used to specify the preconditions, postconditions, and base cases of a function.

#### Preconditions

Preconditions are specified using the `requires` keyword, and are conditions that must be true before the function is executed.

#### Postconditions

Postconditions are specified using the `ensures` keyword, and are conditions that must be true after the function is executed.

#### Base Cases

Base cases are specified using the `default` keyword, and are a tuple of condition and value pairs that specify the base cases for the function.

An example of using a blueprint is as follows:

```BlueprintScript
blueprint fibonacci {
    input: n: i32;
    output: i32;
    default: n == 0 ==> 0;
    default: n == 1 ==> 1;
    requires: n >= 0;
    ensures: fibonacci >= 0;
}

public i32 fibonacci(i32 n) {
    return fibonacci(n - 1) + fibonacci(n - 2);
}
```

Here the `blueprint` `fibonacci` specifies the input and output types, the base cases for `n == 0` and `n == 1`, the precondition that `n` must be non-negative, and the postcondition that the result must be non-negative. The implementation of the `fibonacci` function then uses recursion to compute the Fibonacci number based on the blueprint's specifications.

#### Enforcement Modes

`BlueprintScript` can be compiled in two modes: `enforce` and `optimise`. In `enforce` mode, all preconditions, postconditions, and base cases are checked at runtime, and if any of them are violated, an error is raised. In `optimise` mode, these checks are omitted and the `blueprint` metadata is translated into LLVM metadata, which can be used for optimisations.
