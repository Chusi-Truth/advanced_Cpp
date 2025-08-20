# 问题1：消去上下文无关文法的二义性

## 1. %% 与 * / 同优先级的文法

文法如下：

Expr   → Expr + Term | Expr - Term | Term
Term   → Term * Factor | Term / Factor | Term %% Factor | Factor
Factor → ( Expr ) | number

---

## 2. %% 优先级最高的文法

文法如下：

Expr   → Expr + Term | Expr - Term | Term
Term   → Term * Mod | Term / Mod | Mod
Mod    → Mod %% Factor | Factor
Factor → ( Expr ) | number

---
