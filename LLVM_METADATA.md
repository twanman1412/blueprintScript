# LLVM Metadata and Attributes plan

## General *(always emitted, language-level guarantees)*

| Metadata / Attribute | Justification |
|---|---|
| `noundef` on parameters | By-value passing, always defined |
| `noundef` on return values | By-value return, always defined |
| `nounwind` on all functions | Language has no exception mechanism |

---

## Optimise *(emitted when contracts or analysis provide proof)*

| Metadata / Attribute | Justification |
|---|---|
| `!range` on parameters | Proved by `requires` contract |
| `!range` on return values | Proved by `ensures` contract |
| `nsw` / `nuw` on instructions | Proved by range analysis over contract bounds |
| `willreturn` on functions | Proved by absence of `exit` in function body |

---
