FUNCTION F419(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

// "Ningon Concepto lo Usa"

  IF CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ() .AND.                    INT(MESES(FECHA_ING-2,oNm:dHasta))>12.AND.                                    INT(MESES(FECHA_ING-2,oNm:dHasta))<16
     nFactor1:=ACUMC_FCH("H401,H415")
     nFactor2:=MAX(60,nFactor1)
     nFactor3:=MIN(nFactor2,60)-MIN(nFactor1,60)
     nResult:=nFactor3
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*
// Ningon Concepto lo Usa

/*