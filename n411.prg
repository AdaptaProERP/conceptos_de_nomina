FUNCTION N411(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION=[A] .AND. oNm:cOtraNom=[DI] .AND. DESTINO_PR!="B"

    IF oNm:lActualiza .AND. (EMPTY(oDp:dFchIniInt) .OR. oDp:dFchIniInt<oNm:dHasta)
       UPDATE_DS() // Actualiza DataSet
    ENDIF

    // C~lculos
    lVariac:=.T. // Indica si Requiere Valor en Variaci©n
    nResult:=VARIAC

 ENDIF

RETURN nResult

/*
// Actualiza el DataSet
*/
FUNCTION UPDATE_DS()
   LOCAL oData

   oData:=DATASET("NOMINA","ALL")
   oData:Set("dFchIniInt",oNm:dDesde)
   oDp:dFchIniInt:=oNm:dDesde
   oData:End()

RETURN .T.
// <EOF>
