FUNCTION D075(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
  LOCAL nResult:=0

  IF CONDICION=[A].AND.ASIGNA>0.AND.(oNm:cTipoNom$[SQM].OR.(oNm:cOtraNom=[LI].AND.TABLALIQ()))
    nResult:=ACUMC_FCH("D075,D999")
  ENDIF

RETURN nResult
// <EOF>
/*
Obtiene el monto de deducciones diferidas generadas en n�mina anteriores identificadas
a trav�s del concepto "D999" que se aplic� cuando el monto de las deducciones super� 
al monto de las asignaciones. Este concepto tambi�n se aplica en N�mina "Liquidaci�n".

/*