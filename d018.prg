FUNCTION D018(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nHoraIna:=0,nFactor1:=0

  IF CONDICION=[A] .AND. TIPO_NOM="S"
     nFactor1:= SALARIO/8
     lVariac:=.T.
     nResult:=VARIAC*nFactor1
  ENDIF

  IF CONDICION=[A] .AND. TIPO_NOM="Q"
     nFactor1:= (SALARIO/30)/8
     lVariac:=.T.
     nResult:=VARIAC*nFactor1
  ENDIF

RETURN nResult
// EOF

/*
CALCULA LAS DEDUCCIONES POR INASISTENCIA POR HORA. 

POR
EDGAR PERDOMO

/*