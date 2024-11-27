FUNCTION D017(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A"
   // C~lculos
   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   nResult:=HcmTrabInteres(oNm:dDesde,FchFinMes(oNm:dHasta),@VARMEMO,.F.)
 ENDIF

RETURN nResult
// <EOF>
/*


/*