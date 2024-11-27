FUNCTION N020(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nTope:=0,nSalario:=0, nDaus

 nTope   :=2*CNS(26) // Tope del Sueldo Mensual
 nSalario:=FUNCION(3)*30

nDaus  :=ACUMV_FCH("D001",oNm:dDesde,oNm:dHasta) // Valor Ausencias

nResult := nDaus*cns(90)

// IF CONDICION$"AL"  .AND. oNm:cOtraNom="CT" .AND. nSalario<nTope .AND. FECHA_ING<=oNm:dHasta
//    lVariac:=.T.
//    RETURN VARIAC
// ENDIF

RETURN nResult
// EOF
/*
Solicita la cantidad de días que por cualquier motivo serán deducidos en el cálculo de 
Cesta Ticket realizado por el Concepto "A200".

/*