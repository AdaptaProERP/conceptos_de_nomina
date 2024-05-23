FUNCTION N060(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias:=0,nDiasCal:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta

 IF CONDICION="A" .AND. (TIP_NOM$"SQM" .OR. oNm:cOtraNom=[DI])
   // Calculos
   lVariac:=.T. // Indica si Requiere Valor en Variaci©n
   nDias  :=AUSENCIA("PXV",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // Dias de Inasistencia en el periodo
   IF nDias=0
     // Si no hay ausencias asume, las solicita en Variacion
     lVariac:=.T.
   ELSE
     VARIAC:=nDias
   ENDIF
ENDIF

RETURN VARIAC
// <EOF>
