FUNCTION H200(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF CONDICION=[A].AND.oNm:cOtraNom=[TR].AND.MESES(FECHA_ING,CTOD("19/06/97"))>=12   .AND. ACUMC_FCH("N200")=0
     nFactor1:=MIN(MAX(SALARIO("31/12/96"),SALARIO("31/12/96",.F.)),300000)
     nFactor2:=IIF(nFactor1=0,FUNCION(2),nFactor1)
     nFactor3:=MIN(INT(DIV(MESES(FECHA_ING,CTOD("31/12/96")),12)),10)
     nResult:=IIF(nFactor2*nFactor3>45000,nFactor2*nFactor3,45000)
  ENDIF

RETURN nResult
// EOF
