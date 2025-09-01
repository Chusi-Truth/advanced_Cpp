%% 与 * / 同优先级：
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

%% 是最高优先级:
~~~
<expr>   ::= <expr> "+" <term>
          | <expr> "-" <term>
          | <term>

<term>   ::= <term> "*" <top>
          | <term> "/" <top>
          | <top>

<top>    ::= <top> "%%" <factor> 
          | <factor>

<factor> ::= "(" <expr> ")"
          | number
~~~