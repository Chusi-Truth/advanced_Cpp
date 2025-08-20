#### 消去上下文无关文法的二义性

##### 1 `%%` 与 `*/`同优先级

```
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <factor>
          | <term> "/" <factor>
          | <term> "%%" <factor>
          | <factor>

<factor> ::= "(" <expr> ")"
          | number
```

##### 2 `%%`是最高优先级

```
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <distance>
          | <term> "/" <distance>
          | <distance>

<distance> ::= <distance> "%%" <factor>
            | <factor>

<factor> ::= "(" <expr> ")"
          | number
```