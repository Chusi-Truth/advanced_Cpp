- **如果 `%%` 和 `*`、`/` 同优先级**：  
  
  ```bash
  Expr ::= Expr "+" Term | Expr "-" Term | Term
  Term ::= Term "*" Factor | Term "/" Factor | Term "%%" Factor | Factor
  Factor ::= "(" Expr ")" | number
  ```
  
- **如果 `%%` 优先级最高**： 
  
  ```bash
  Expr ::= Expr "+" Term | Expr "-" Term | Term
  Term ::= Term "*" Factor | Term "/" Factor | Factor
  Factor ::= Factor "%%" Atom | Atom
  Atom ::= "(" Expr ")" | number
  ```
  
  

