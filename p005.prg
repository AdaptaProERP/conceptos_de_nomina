FUNCTION P005(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nBase:=0,aData,nDias,I,nSaldo:=0,nInteres:=0,nTotInt:=0
 LOCAL nMeses:=0,nSalario:=0,nCapital:=0,nAnos:=0,aData:={}

 IF C_P004>0 // .AND. DESTINO_PR<>"B"

    VARIAC  :=CNS(96)
    nMeses  :=MESES(FECHA_ING,oDp:dFchFin)
    nSalario:=DIV(C_P004,VARPRE("P004"))

    IF nMeses>=12
       nAnos :=INT(DIV(nMeses,12))
       nMeses:=12
    ELSE
       nMeses:=nMeses-3
    ENDIF

    IF .F. // !oDp:lIndexaInt // Interes Simple
       nResult:=PORCEN(C_P004,VARIAC)
       nResult:=DIV(nResult,12)*11 // Siempre son 11 Meses
       RETURN nResult
    ENDIF

    nDias :=VARPRE("P004")
    aData :={}

    FOR I=1 TO nMeses

       nDias   :=5

       IF nAnos>1 .AND. I=MONTH(FECHA_ING)
          nDias:=nDias+(nAnos-1)*2
       ENDIF

       nSaldo  :=nDias*nSalario            // 5 DÑas por Mes
       nInteres:=PORCEN(nCapital,CNS(96))  // % Mensual
       nInteres:=DIV(nInteres,12)          // Interes Mensual, 1 mes transcurrido
       nInteres:=nInteres*I
       AADD(aData,{I,nDias,nCapital,nInteres})
       nCapital:=nCapital+nSaldo+nInteres

    NEXT I

    nResult:=nInteres
//  ViewArray(aData)

 ENDIF

RETURN nResult
// <EOF>
/*


/*