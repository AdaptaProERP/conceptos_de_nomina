FUNCTION H201(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A] .AND. oNm:cOtraNom=[TR] .AND. MESES(FECHA_ING,"19/06/97")>=12     .AND. ACUMC_FCH("N200")=0
     nFactor1:=DIV(MAX(SALARIO("19/06/97"),SALARIO("19/06/97",.F.)),30)+DIV(C_A054,FUNCION(11)*30)
     nFactor2:=IIF(SALR_JUN96=0,nFactor1,SALR_JUN96)*30
     nFactor3:=DIV(FUNCION(07),30)
     nResult:=nFactor2*nFactor3
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
