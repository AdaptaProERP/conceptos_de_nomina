FUNCTION H016(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A"
   // C~lculos
   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   nResult:=HcmInteres(oNm:dDesde,FchFinMes(oNm:dHasta),@VARMEMO)
 ENDIF

RETURN nResult
// <EOF>
