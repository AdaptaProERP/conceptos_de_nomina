FUNCTION P001(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. oNm:cOtraNom="PA"
    VARIAC :=MESES(MAX(FCHINICIO,FECHA_ING),oNm:dHasta+1) // Cuantos Meses Transcurridos
    VARIAC :=MAX(VARIAC,12)
    nResult:=FUNCION(3)*30*VARIAC
 ENDIF

RETURN nResult
// <EOF>
/*


/*