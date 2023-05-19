FUNCTION A006(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A]
     lVariac:=.T.
     nResult:=VARIAC*(FUNCION(1)+PORCEN(FUNCION(1),CNS(15)))
     //nResult:=nResult-PORCEN(nResult,PORATIPICO) // Menos Salario At­pico
  ENDIF
RETURN nResult
// EOF
