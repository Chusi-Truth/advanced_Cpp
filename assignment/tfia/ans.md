定义 %% 为距离运算(a %% b=|a-b|)，根据讲义中的无二义上下文无关文法，尝试给出 %% 与 * / 同优先级的上下文无关文法，以及 %% 是最高优先级的上下文无关文法。

## %% 与 * / 同优先级的上下文无关文法：

``` bnf
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <fact>
          | <term> "/" <fact>
          | <term> "%%" <fact>
          | <fact>

<fact> ::= "(" <expr> ")"
          | number
          | identifier
```

## %% 是最高优先级的上下文无关文法

``` bnf
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <dist>
            | <term> "/" <dist>
            | <dist>

<dist> ::= <dist> "%%" <fact>
          | <fact>

<fact>   ::= "(" <expr> ")"
          | number
          | identifier
```