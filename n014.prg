FUNCTION N014(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nTope:=0,nSalario:=0, nA004

 nTope   :=2*CNS(26) // Tope del Sueldo Mensual
 nSalario:=FUNCION(3)*30

//nA004  :=ACUMV_FCH("A004",oNm:dDesde,oNm:dHasta) // Valor Horas Extra

//nResult := (nA004/8)*cns(90)

IF  (CONDICION=[A] .OR. CONDICION=[V]) .AND. CONDICION$"AL"  .AND. oNm:cOtraNom="CT"  .AND. FECHA_ING<oNm:dHasta
    lVariac:=.T.
    RETURN VARIAC
ENDIF

RETURN nResult
// EOF
/*
Solicita la cantidad de días que por cualquier motivo serán deducidos en el cálculo de 
Cesta Ticket realizado por el Concepto "A200".

/*