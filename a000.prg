FUNCTION A000(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

IF TIPO_NOM="S"
  IF CONDICION=[A]
     nFactor1:= SALARIO
     lVariac:=.T.
     nResult:=VARIAC* nFactor1
  ELSE
      //
  ENDIF
ENDIF

IF TIPO_NOM="Q"
  IF CONDICION=[A]
     nFactor1:= SALARIO/30
     lVariac:=.T.
     nResult:=VARIAC* nFactor1
  ELSE
      //
  ENDIF
ENDIF
RETURN nResult
// EOF
