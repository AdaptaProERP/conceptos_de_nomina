FUNCTION D024(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias,nSalario

 IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.;
     (oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.oNm:cOtraNom=[VC])

   nSalario:=FUNCION(3)

   IF oNm:cOtraNom=[LI] // Liquidacion, debe Recuperar los Dias
      VARIAC:=ACUMC_FCH("N060")-ACUMV_FCH("D024")
   ELSE
       // En Vacaciones lo lee de la Tabla
      nDias:=TABDIADIS
   ENDIF

   VARIAC:=nDias
   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   nResult:=nDias*nSalario

 ENDIF

RETURN nResult
// <EOF>
/*
Deduce del pago y tiempo de disfrute la cantidad de día de vacaciones ya disfrutados y
 previamente registrados a través del concepto "N060" o introducidos directamente por
 el usuario a través del formulario de vacaciones.

**Si el patrono decide cargar dias pendientes de vacaciones con el salario que le corres-
pondia en dicha fecha utilizen la formula posterior activando el concepto N067 en el 
cual van a colocar el Monto total (BsF) correspondiente a las vacaciones. Tambien podria
utrilizarse para Carga de Datos Iniciales.
Deduce del pago y tiempo de disfrute la cantidad de día de vacaciones ya disfrutados y
 previamente registrados a través del concepto "N060" o introducidos directamente por
 el usuario a través del formulario de vacaciones. Ademas en Monto en bolivares lo trae 
del concepto N067 previamente registrados
 
FUNCTION D024(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias,nSalario,nTotMtoBs:=0

 IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.;
     (oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.oNm:cOtraNom=[VC])

   // El monto total de Dias es tomado del concepto N067
   nTotMtoBs:=ACUMC_FCH("N067")

   //nSalario:=FUNCION(3)

   IF oNm:cOtraNom=[LI] // Liquidacion, debe Recuperar los Dias
      VARIAC:=ACUMC_FCH("N060")-ACUMV_FCH("D024")
   ELSE
       // En Vacaciones lo lee de la Tabla
      nDias:=TABDIADIS
   ENDIF

   VARIAC:=nDias
   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   // Nuevo calculo trae el monto total almacenado en N067 y los dias de N060
   nResult:=nTotMtoBs
   //nResult:=nDias*nSalario

 ENDIF

RETURN nResult
// <EOF>

/*