FUNCTION N150(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nMax:=0,dDesde,dHasta,bEdad

 IF CONDICION="A" .AND. oNm:cOtraNom="GR"
    VARMEMO:=""
    bEdad:={|nAnos,nMeses,nDias|nAnos<6}
    nMax   :=PORCEN(CNS(26),CNS(94)) // % Tope(94) sobre el Salario Mínimo
    FACTOR1:=nMax                    // Necesario para Determinar RetroActivos
    dDesde :=FchIniMes(oNm:dDesde)
    dHasta :=FchFinMes(oNm:dHasta)
    nResult:=GuardIns(dDesde,dHasta,@VARMEMO,nMax,bEdad)
 ENDIF

RETURN nResult
// <EOF>
