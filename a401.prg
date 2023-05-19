FUNCTION A401(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A] .AND. oNm:cOtraNom=[PT] .AND. ACUMC_FCH("A401")=0 .AND.           ACUMC_FCH("N200")>0
     nFactor1:=ACUMC_FCH("N200")
     nFactor2:=0
     nFactor3:=CREAVAR("VARIAC",IIF(VARIAC=0,12.5,VARIAC))
     lVariac:=.T.
     nResult:=PORCEN(nFactor1+nFactor2,VARIAC)
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
