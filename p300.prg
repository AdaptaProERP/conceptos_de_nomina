FUNCTION P300(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF C_P001>0
    VARIAC:=oDp:nDebBanc
    nResult:=PORCEN(C_P,VARIAC)
 ENDIF

RETURN nResult
// <EOF>
/*


/*