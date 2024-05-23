FUNCTION N061(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta,nDiasCal:=0
 LOCAL DD,DH
DD:=dDesde
DH:=dHasta
 IF CONDICION="A" .AND. FECHA_ING<=oNm:dHasta
   // C~lculos
   lVariac:=.T. // Indica si Requiere Valor en Variaci©n
   nDias  :=AUSENCIA("PSR",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // DÑas de Inasistencia en el periodo
   IF nDias=0
     // Si no hay ausencias asume, las solicita en Variacion
     lVariac:=.T.
   ELSE
     VARIAC:=nDias
   ENDIF
 ENDIF

RETURN VARIAC
// <EOF>
