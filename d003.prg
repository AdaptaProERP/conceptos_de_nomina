FUNCTION D003(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

IF TIPO_NOM="S"
  IF CONDICION=[A]
     nFactor1:= SALARIO/480
     lVariac:=.T.
     nResult:=VARIAC* nFactor1
  ELSE
      //
  ENDIF
ENDIF

IF TIPO_NOM="Q"
  IF CONDICION=[A]
     nFactor1:= SALARIO/14400
     lVariac:=.T.
     nResult:=VARIAC* nFactor1
  ELSE
      //
  ENDIF
ENDIF
RETURN nResult
// EOF
/*
REGISTRA LOS RETARDOS EN MINUTOS. 

CALCULA EL SALARIO EN MINUTOS Y LO MULTIPLICA POR LA VARIACION.

EDGAR PERDOMO

/*