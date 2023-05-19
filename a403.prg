FUNCTION A403(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A].AND.DESTINO_PR=[C].AND.oNm:cOtraNom=[PT]                          .AND. ACUMC_FCH("A402")>0
     nFactor1:=ACUMC_FCH("N200")
     nFactor2:=FUNCION(418)
     nFactor3:=ACUMC_FCH("A401,A402,A402,A403",FECHA_ING,oNm:dHasta-1)
     lVariac:=.T.
     nResult:=VARIAC
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
