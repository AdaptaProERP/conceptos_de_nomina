FUNCTION H005(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF C_D028=0
     nResult:=PORCEN(DIV(ABS(C_D028)*100,CNS(03)),CNS(42))
  ENDIF
RETURN nResult
// EOF
