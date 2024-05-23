FUNCTION N400(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. oNm:cOtraNom="DI" .AND. ACUMC_FCH("H400")=0
    lVariac:=.T.
    nResult:=VARIAC
 ENDIF

RETURN nResult
// <EOF>
