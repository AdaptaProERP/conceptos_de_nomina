FUNCTION N152(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nMax:=0,dDesde,dHasta,nAnos:=6
 LOCAL bEdad,nAntes:=0,nActual:=0

 IF CONDICION="A" .AND. oNm:cOtraNom="GR"
    bEdad:={|nAnos,nMeses,nDias|nAnos<6}
    VARMEMO:=""
    // Valor Minimo Actual
    dDesde :=FchIniMes(FchIniMes(oNm:dDesde)-1)
    dHasta :=FchFinMes(dDesde)
    // Valor Minimo Anterior
    nMax   :=ACUMF1_FCH("N155",dDesde,dHasta)
    nAntes :=GuardCuotas(dDesde,dHasta,@VARMEMO,nMax,bEdad)
    IF nAntes>0
      // Valor Minimo Actual
      nMax    :=PORCEN(CNS(26),CNS(94))   // % Tope(94) sobre el Salario MÑnimo
      nActual :=GuardCuotas(dDesde,dHasta,@VARMEMO,nMax,bEdad)
      nResult :=nActual-nAntes
    ENDIF
 ENDIF

RETURN nResult
// <EOF>
/*


/*