FUNCTION N011(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0
 LOCAL nUtilid:=0
 LOCAL nVacaci:=0,n219:=0,n223:=0,nAnos:=0,nMeses:=0,cMemo:="",nDias:=0,nDiario,cAnt:=""

 IF oNm:cOtraNom!="IA"
     RETURN 0
 ENDIF

 nDias  :=IIF(TIPO_NOM="S",52*7,30*12)
 nDiario:=FUNCION(3)
 cAnt   :=ANTIGUEDAD(FECHA_ING,oDp:dFchFin,@nAnos,@nMeses)

 nResult:=nDias*nDiario
 cMemo  :="Antig_edad :"+cAnt+ " Desde "+DTOC(FECHA_ING)+" Al "+DTOC(oDp:dFchFin)+CRLF+;
          "Concepto        Días         Diario            Monto"+CRLF+;
          "-------------- ----- -------------- ----------------"+CRLF

 cMemo  :=cMemo+;
          "Sueldo        :"+STR(nDias,3)+" "+TRAN(nDiario,"999,999,999.99")+" "+;
          TRAN(nResult,"999,999,999,999.99")

 nDias  :=CNS(52)
 nUtilid:=nDias*nDiario
 cMemo  :=cMemo+CRLF+;
          "Utilidades    :"+STR(nDias,3)+" "+TRAN(nDiario,"999,999,999.99")+" "+;
          TRAN(nUtilid,"999,999,999,999.99")

 nDias  :=CNS(50)
 nVacaci:=nDias*nDiario
 cMemo  :=cMemo+CRLF+;
          "Vacaciones    :"+STR(nDias,3)+" "+TRAN(nDiario,"999,999,999.99")+" "+;
          TRAN(nVacaci,"999,999,999,999.99")


 IF nAnos>0
    nDias  :=MIN(nAnos-1,15)
    n219   :=nDias*nDiario
    cMemo  :=cMemo+CRLF+;
            "Art. 219      :"+STR(nDias,3)+" "+TRAN(nDiario,"999,999,999.99")+" "+;
            TRAN(n219,"999,999,999,999.99")

    nDias:=MIN(7+(nAnos-1),21)
    n223 :=nDias*nDiario

    cMemo  :=cMemo+CRLF+;
            "Art. 223      :"+STR(nDias,3)+" "+TRAN(nDiario,"999,999,999.99")+" "+;
            TRAN(n223,"999,999,999,999.99")

 ENDIF

 oDp:cMemo:=cMemo

RETURN nResult+nUtilid+nVacaci+n219+n223
// <EOF>
