FUNCTION P208(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF C_P001>0
   VARIAC :=CNS(98)
   nResult:=PORCEN(C_P006,VARIAC)
 ENDIF

RETURN nResult
// <EOF>
/*


/*