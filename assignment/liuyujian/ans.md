# 同优先级的上下文无关文法
<expr> ::= <expr> "%%" <term>
        | <expr> "*" <term>
        | <expr> "/" <term>
        | <term>

<term> ::= <term> "%%" <factor>
        | <term> "*" <factor>
        | <term> "/" <factor>
        | <factor>

<factor> ::= "(" <expr> ")"
          | number
          | identifier

# 最高优先级的上下文无关文法
<expr> ::= <expr> "*" <term>
        | <expr> "/" <term>
        | <term>

<term> ::= "(" <factor> ")"
        | <factor>

<factor> ::= <expr> "%%" <expr>
          | "(" <expr> ")"
          | number
          | identifier
