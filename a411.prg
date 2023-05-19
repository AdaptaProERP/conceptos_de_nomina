FUNCTION A411(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,lAniver:=.F.,nBase:=0,nH411:=0,dDesde,dHasta
  LOCAL cPagos :="A073"

  // Solo Destino Contabilidad
  IF DESTINO_PR="B"
    RETURN 0
  ENDIF

  IF CONDICION=[A] .AND. oNm:cOtraNom=[DI]

    lVariac:=.T. // Indica si Requiere Valor en Variaci©n
    RETURN VARIAC

  ENDIF

  dDesde:=oNm:dDesde
  dHasta:=oNM:dHasta

  // SPI, requiere evaluar el anivesario del mes Anterior
  IF oDp:lAniverInt .AND. !FINMES() .AND. oNm:cTipoNom="Q"

     dHasta:=FCHINIMES(dHasta)-1
     dDesde:=FCHINIMES(dHasta)

  ELSE

    IF oNm:cTipoNom="Q"
       RETURN 0
    ENDIF

  ENDIF

  lAniver:=ANIVERSARIO(FECHA_ING,dDesde,dHasta)

  IF CONDICION=[A] .AND. ((oNm:cOtraNom$[IN,AL] .OR. (oNm:cOtraNom=[LI].AND.TABLALIQ())) .OR. ;
     (oDp:lAniverInt.AND.lAniver) .OR. oNm:cOtraNom="AN")

     cPagos  :=cPagos+IIF(oDp:lIndexaInt,",A411","") // Interes Indexado debe Bajar Capital
     lVariac :=oNm:cOtraNom="IN".OR.oNm:cOtraNom="AN"

     IF VARIAC=0 .AND. oNm:cOtraNom!="AN"

//      nResult :=INTERES("002","H400",cPagos,NIL,dHasta,NIL,.F.,,,,,,oDp:lIndexaInt,@nBase,oDp:dFchIniInt)
//      nResult :=INTERES(NIL,oDp:cConPres,cPagos,NIL,dHasta,nil,,,,,,,oDp:lIndexaInt,@nBase,oDp:dFchIniInt)
        nResult :=EJECUTAR("INTERESES",NIL,oDp:cConPres,cPagos,NIL,dHasta,nil,,,,,,,oDp:lIndexaInt,@nBase,oDp:dFchIniInt)

        IF oNm:lPrenomina
           VARMEMO:="Base de Cálculo "+ALLTRIM(TRANS(nBase,"9,999,999,999.99"))+" Conceptos: H400,"+cPagos
        ENDIF

        nH411:=ACUMC_FCH("N411") // Valor Cargado Inicialmente

        nResult:=nResult+nH411

        IF nH411>0
           VARMEMO:=VARMEMO+CRLF+"Intereses Iniciales "+TRANS(nH411,"999,999,999.99")
        ENDIF

     ELSE

        nResult :=VARIAC

     ENDIF

  ENDIF
RETURN nResult
// EOF
