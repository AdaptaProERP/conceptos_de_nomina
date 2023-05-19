FUNCTION A073(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,dDesde:=oNm:dDesde,nMeses:=0,nPorcen:=0,nAnticip:=0

  IF CONDICION=[A] .AND. oNm:cOtraNom=[AL]
     // Pago Autom~tico de Antiguedad

     dDesde   :=FECHA_ING
     VARIAC   :=ACUMV_FCH("H400",dDesde,oNm:dHasta)
     VARIAC   :=VARIAC-ACUMV_FCH("A073",dDesde,oNm:dHasta) // Días

     // dDesde   :=MAX(dDesde,oNm:dDesde)
     nMeses   :=MESES(dDesde,oNm:dHasta+1)

     nPorcen  :=CNS(92)
     nPorcen  :=IIF( EMPTY(nPorcen) , 100, nPorcen)

     VARMEMO  :="Periodo:"+DTOC(dDesde)+"-"+DTOC(oNm:dHasta)+CRLF+;
                "Antigüedad:"+LSTR(nMeses)+" Meses "+CRLF+;
                "Días Abonados:"+LSTR(VARIAC)+";"+CRLF+;
                "Porcentaje Solicitado:"+LSTR(nPorcen)+"%"

     // Porcentaje Máximo que se puede Anticipar

     // Hasta un Porcentaje de las Prestaciones
     nResult  :=ACUMC_FCH("H400",dDesde,oNm:dHasta)
     nAnticip :=ACUMC_FCH("A073",dDesde,oNm:dHasta)

     VARMEMO  +=CRLF+"Art. 108 a la Fecha:"+ALLTRIM(TRAN(nResult,"999,999,999,999.99"))
     // Resta los Anticipos
     nResult  :=PORCEN( nResult , nPorcen)
     nResult  :=MAX(nResult - nAnticip , 0 ) // No puede ser Negativo

     IF !EMPTY(nAnticip)
        VARMEMO  +=CRLF+"Art. 108 Anticipado:"+ALLTRIM(TRAN(nAnticip,"999,999,999,999.99"))
     ENDIF

     RETURN nResult

  ENDIF

  IF CONDICION=[A] .AND. oNm:cOtraNom$[AN,AL,DI]
     lVariac:=.T.
     nResult:=VARIAC
  ENDIF

RETURN nResult
// EOF
