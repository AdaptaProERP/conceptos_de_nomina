FUNCTION P006(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF C_P001>0
    VARIAC :=DIAS_HAB(oNm:dDesde,oNm:dHasta)
    nResult:=VARIAC*CNS(90)
 ENDIF

RETURN nResult
// <EOF>
/*


/*