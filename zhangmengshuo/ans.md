%% 与 * / 同优先级
~~~
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

%% 最高优先级
~~~
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <factor>
          | <term> "/" <factor>
          | <mod>

<mod>    ::= <term> "%%" <factor>
          | <factor>

<factor> ::= "(" <expr> ")"
          | number
~~~