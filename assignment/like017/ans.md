# 作业一：上下文无关文法二义性消除

## 1. 运算符 %% 与 * / 同优先级
```bnf
expr   -> expr + term 
        | expr - term 
        | term

term   -> term * factor 
        | term / factor 
        | term %% factor 
        | factor

factor -> ( expr ) 
        | number
```

## 2. 运算符 %% 是最高优先级
```bnf
expr    -> expr + term 
         | expr - term 
         | term

term    -> term * dist_op 
         | term / dist_op 
         | dist_op

dist_op -> dist_op %% factor 
         | factor

factor  -> ( expr ) 
         | number
```
