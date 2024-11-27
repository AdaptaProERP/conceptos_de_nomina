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
/*
Almacena los dias de inasistencia Remunerada a cambio de vacaciones.
Algunas empresas otorgan los dias "Puentes" como vacaciones adelantadas tanto en 
pago como disfrute. El valor de este concepto sera tomando en cuenta para 
determinar el periodo de vacaciones. 
El concepto F087, determina el acumulado de dias.

**Si el patrono decide cargar dias pendientes de vacaciones con el salario que le corres-
pondia en dicha fecha utilizen la formula posterior activando el concepto N067 en el 
cual van a colocar el Monto total (BsF) correspondiente a las vacaciones. Tambien podria
utrilizarse para Carga de Datos Iniciales.
Almacena los dias de inasistencia Remunerada a cambio de vacaciones.
Algunas empresas otorgan los dias "Puentes" como vacaciones adelantadas tanto en 
pago como disfrute. El valor de este concepto sera tomando en cuenta para 
determinar el periodo de vacaciones. 
El concepto F087, determina el acumulado de dias.

FUNCTION N060(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias:=0,nDiasCal:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta

 IF CONDICION="A" .AND. (TIP_NOM$"SQM" .OR. oNm:cOtraNom=[DI])
   // C~lculos
   lVariac:=.T. // Indica si Requiere Valor en Variaci©n
   nDias  :=AUSENCIA("PXV",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // DÑas de Inasistencia en el periodo
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