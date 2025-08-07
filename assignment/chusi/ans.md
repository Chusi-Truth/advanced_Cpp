# 消去上下文无关文法的二义性
## 1.%% 与 */ 同优先级的上下文无关文法
```bnf
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <factor>
          | <term> "/" <factor>
          | <term> "%%" <factor>   /* 距离运算符与乘除同级 */
          | <factor>

<factor> ::= "(" <expr> ")"
          | number
          | identifier
```

## 2.%% 是最高优先级的上下文无关文法
```bnf
<expr>      ::= <expr> "+" <term>
             | <expr> "-" <term>
             | <term>

<term>      ::= <term> "*" <distance>
             | <term> "/" <distance>
             | <distance>              /* 乘除运算符层 */

<distance>  ::= <distance> "%%" <factor>
             | <factor>               /* 距离运算符最高优先级 */

<factor>    ::= "(" <expr> ")"
             | number
             | identifier
```