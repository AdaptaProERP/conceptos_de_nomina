FUNCTION P205(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF C_P001>0
    VARIAC:=CNS(43)
    nResult:=PORCEN(C_P001,VARIAC)
 ENDIF

RETURN nResult
// <EOF>
/*


/*