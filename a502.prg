FUNCTION A502(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nResult2:=0

IF C_A024>0
  IF CONDICION=[A]
     nFactor1:= C_A024*1.5
     lVariac:=.T.
     nResult:=VARIAC* nFactor1
  ELSE
      //
  ENDIF
ENDIF

IF C_A024=0
  IF CONDICION=[A]
     nFactor1:= SALARIO*1.5
     lVariac:=.T.
     nResult2:=VARIAC* nFactor1
  ELSE
      //
  ENDIF
ENDIF

RETURN nResult+nResult2
// EOF
