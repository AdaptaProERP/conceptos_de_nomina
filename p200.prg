FUNCTION P200(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. C_P001>0
    VARIAC:=CNS(40)
    nResult:=PORCEN(52*FUNCION(5),CNS(040))
 ENDIF

RETURN nResult
// <EOF>
