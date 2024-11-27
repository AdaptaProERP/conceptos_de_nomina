FUNCTION D014(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nTasa:=0

  IF ISR_ASIG>0 .AND. !EMPTY(ISR1+ISR2+ISR3+ISR4)
     nTasa   :=ISR1
     nTasa   :=IIF(MONTH(oNm:dHasta)>3.AND.MONTH(oNm:dHasta)<07,ISR2,nTasa)
     nTasa   :=IIF(MONTH(oNm:dHasta)>6.AND.MONTH(oNm:dHasta)<10,ISR3,nTasa)
     nTasa   :=IIF(MONTH(oNm:dHasta)>9,ISR4,nTasa)
     VARIAC  :=nTasa
     lVariac:=.F.
     nResult:=PORCEN(ISR_ASIG,nTasa)
  ENDIF

RETURN nResult
// EOF
/*
Aplica el Porcentaje correspondiente al Ultimo trimestre sobre los montos de conceptos 
sujetos retención de Impuesto sobre la Renta., dicho porcentaje es tomado de los 
campos de la tabla del trabajador ISR1, ISR2 y ISR3 en función del trimestre que se
 encuentre respectivamente.

/*