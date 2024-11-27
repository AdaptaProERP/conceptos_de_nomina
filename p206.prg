FUNCTION P206(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nMeses:=0

 IF C_P001>0
    nMeses  :=MESES(MAX(FCHINICIO,FECHA_ING),oNm:dHasta+1) // Cuantos Meses Transcurridos
    VARIAC  :=MAX(nMeses,12)
    nResult :=VARIAC*CNS(97)
 ENDIF

RETURN nResult
// <EOF>
/*


/*