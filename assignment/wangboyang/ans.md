# 作业

%% 为距离运算(a %% b=|a-b|)

## 1. %% 与 * / 同优先级的上下文无关文法
```
<expr> ::= <expr> "+" <term>
         | <expr> "-" <term>
         | <term>
<term> ::= <term> "*" <factor>
         | <term> "/" <factor>
         | <term> "%%" <factor>
         | <factor>
<factor> ::= "(" <expr> ")"
         | number
```

## 2. %% 是最高优先级的上下文无关文法
```
<expr> ::= <expr> "+" <term>
         | <expr> "-" <term>
         | <term>
<term> ::= <term> "*" <factor>
         | <term> "/" <factor>
         | <factor>
<factor> ::= <factor> "%%" <element>
         | <element>
<element> ::= "(" <expr> ")"
         | number
```
