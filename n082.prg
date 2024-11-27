FUNCTION N082(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION=[A] .AND. oNm:cOtraNom=[DI]

   lVariac:=.T. // Indica si Requiere Valor en Variaci©n
   nResult:=VARIAC

 ENDIF

RETURN nResult
// EOF
/*
// Días pendientes para el Bono Vacacional
Solicita la cantidad de días de Bono Vacacional pendiente por cobrar que será pagado
 mediante el concepto "A084" cuando se procese el Bono Vacacional o Nómina
 Liquidación. Recuerde que el bono Vacacional se procesa con la nómina Corriente o 
cuando el trabajador toma vacaciones según la configuración definida en Aplicaciones ? 
Definiciones de Nómina ? Ficheros ? "Configurar Empresa".

/*