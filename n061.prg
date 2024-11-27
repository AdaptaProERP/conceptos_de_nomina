FUNCTION N061(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta,nDiasCal:=0
 LOCAL DD,DH
DD:=dDesde
DH:=dHasta
 IF CONDICION="A" .AND. FECHA_ING<=oNm:dHasta
   // C~lculos
   lVariac:=.T. // Indica si Requiere Valor en Variaci�n
   nDias  :=AUSENCIA("PSR",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // D�as de Inasistencia en el periodo
   IF nDias=0
     // Si no hay ausencias asume, las solicita en Variacion
     lVariac:=.T.
   ELSE
     VARIAC:=nDias
   ENDIF
 ENDIF

RETURN VARIAC
// <EOF>
/*
Est� relacionado con la tabla de ausencias, que a trav�s de la funci�n AUSENCIA("PSR") 
determina la cantidad de d�as  laborables no trabajados durante el periodo de pago que 
no ser� deducidos como inasistencia y tampoco ser� descontado en futuros pagos.  
Utilizado para Descontar Cesta Ticket

/*