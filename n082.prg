FUNCTION N082(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION=[A] .AND. oNm:cOtraNom=[DI]

   lVariac:=.T. // Indica si Requiere Valor en Variaci�n
   nResult:=VARIAC

 ENDIF

RETURN nResult
// EOF
/*
// D�as pendientes para el Bono Vacacional
Solicita la cantidad de d�as de Bono Vacacional pendiente por cobrar que ser� pagado
 mediante el concepto "A084" cuando se procese el Bono Vacacional o N�mina
 Liquidaci�n. Recuerde que el bono Vacacional se procesa con la n�mina Corriente o 
cuando el trabajador toma vacaciones seg�n la configuraci�n definida en Aplicaciones ? 
Definiciones de N�mina ? Ficheros ? "Configurar Empresa".

/*