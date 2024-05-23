FUNCTION N012(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nTope:=0,nSalario:=0

 nTope   :=2*CNS(26) // Tope del Sueldo Mensual
 nSalario:=FUNCION(3)*30

 IF CONDICION$"AL"  .AND. oNm:cOtraNom="CT" .AND. nSalario<nTope .AND. FECHA_ING<=oNm:dHasta
    lVariac:=.T.
    RETURN VARIAC
 ENDIF

RETURN nResult
// EOF
