FUNCTION H203(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A].AND.oNm:cOtraNom=[TR].AND.MESES(FECHA_ING,"19/06/97")>=12         .AND. ACUMC_FCH("N200")=0
     nFactor1:=ACUMC_FCH("A071,D071",FECHA_ING,"19/06/97")
     lVariac:=.T.
     nResult:=IIF(VARIAC=0,nFactor1,VARIAC)*-1
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
