# 作业第一题

## 同优先级

~~~bash
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <factor>
          | <term> "/" <factor>
          | <term> "%%" <factor>
          | <factor>
<factor> ::= "(" <expr> ")"
          | number
~~~

## 最高优先级

~~~bash
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <factor>
          | <term> "/" <factor>
          | <factor>
          
<factor> ::= <factor> "%%" <primary>
          | <primary>
          
<primary> ::= "(" <expr> ")"
          | number
~~~

