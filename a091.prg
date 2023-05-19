FUNCTION A091(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nTope:=0,nSalario:=0, nA004

 nTope   :=2*CNS(26) // Tope del Sueldo Mensual
 nSalario:=FUNCION(3)*30

//nA004  :=ACUMV_FCH("A004",oNm:dDesde,oNm:dHasta) // Valor Horas Extra

//nResult := (nA004/8)*cns(90)

IF  (CONDICION=[A] .OR. CONDICION=[V]) .AND. CONDICION$"AL"  .AND. oNm:cOtraNom="CT"  .AND. FECHA_ING<oNm:dHasta
    lVariac:=.T.
    RETURN VARIAC*cns(90)
ENDIF

RETURN nResult
// EOF
