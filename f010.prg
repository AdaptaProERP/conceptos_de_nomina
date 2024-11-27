FUNCTION F010(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  LOCAL nMeses,nSalario,nDiario, nDesde
  LOCAL nPromedio:=0
//  nMeses  :=MIN(CNS(63),MESES(MAX(FECHA_ING,IIF(oNm:cOtraNom=[LI],oDp:dFchIni,oNm:dDesde)),FCHFINMES(oDp:dFecha)))
//  nSalario:=DIV(SALARIOPRO(nMeses+1,FCHFINMES(FECHASIS)),30)
//  nResult :=MAX(nSalario,FUNCION(3))
  IF oDp:lConstruccion
     nDesde:=oNm:dHasta-28
     nPromedio:=ACUMC_FCH(oNm:aConceptosC,nDesde,oNm:dHasta)
     nSalario:=nPromedio/4
  ELSE
    nSalario:=PROMEDIO_C(FCHINICIO,oNm:dHasta)
    nSalario:=MAX(nSalario,FUNCION(3))
  ENDIF
RETURN nSalario
// EOF
/*
Salario Promedio, se emplea el C, utilizado para Utilidades.

/*