FUNCTION A200(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult :=0,nDias,nDiario,nDiarioD,nDias:=0,nDiasT:=0
 LOCAL nDiasIna:=0
 LOCAL dDesde:=oNm:dDesde
 LOCAL dHasta:=oNm:dHasta

 IF !oNm:cOtraNom="CT"
    RETURN 0
 ENDIF

 // Egresado
 IF !EMPTY(FECHA_EGR)

    IF FECHA_EGR<oNm:dDesde // Esta Liquidado y Fuera del Mes de pago
       RETURN 0
    ENDIF

    dHasta :=MIN(oNm:dHasta,FECHA_EGR)
    dHasta :=MAX(oNm:dHasta,oNm:dDesde)

 ENDIF

 dDesde  :=MAX(oNm:dDesde,FECHA_ING)       // Fecha de Ingreso
 nDias   :=dHasta-dDesde                   // Cantidad de Días Trasncurridos
 nDiario :=CNS(300)*oNm:nDivisa            // Cesta en Divisas
 nDiasIna:=ACUMV_FCH("D001",dDesde,dHasta) // Días de Inasistencia

 nDiasT  :=ASIGN(dDesde,dHasta)            // Asignaciones del mes Pasado,
 // Si no hay histórico de nomina el mes pasado,inicia nomina el mes presente
 IF nDiasT=0
    lVariac:=.T.     // Solicita Variación
    nDias  :=VARIAC  // Días del mes, serán introducidor manualmente por variacines
 ELSE
    nDias  :=nDias-nDiasIna // Resta la inasistencia
    VARIAC :=nDias
 ENDIF

 // Si no tienen días, asume todos los días del mes Pasado
 IF VARIAC=0
    nDias:=dHasta-dDesde
 ENDIF

 IF nDiario=0
   nDiario :=CNS(90)  // En Bs
 ENDIF

 VARIAC  :=nDias
 nResult :=nDias*nDiario

RETURN nResult
// EOF
/*
Obtiene  la Cantidad de días hábiles existentes del periodo, adiciona los 
días indicados en el concepto "N012" , resta los días registrados en el 
concepto "N013", las inasistencias del mes según el concepto: "D001".

Los siguientes conceptos ya no se tomaran en cuenta segun Reposos Medicos
los días de inasistencia asumido por vacaciones en el concepto "N060" y los 
permisos remunerados en el concepto "N061". Cabe destacar que los valores 
obtenidos de los conceptos: D001, N060 y N061 corresponde a los registros
históricos del proceso de nóminas corrientes: Semanal, Quincenal y Mensual.

De acuerdo con el artículo 2, parágrafo segundo de la Ley de Alimentación 
para los Trabajadores y Trabajadoras la empresa está obligada a otorgar el 
beneficio a los trabajadores que devenguen un salario mensual que no exceda 
tres (03) salarios mínimos decretados por el Ejecutivo Nacional. 

El artículo 2, parágrafo tercero de la Ley de Alimentación para los Trabajadores 
y Trabajadoras establece que el beneficio de alimentación podrá ser concedido, 
concertada o voluntariamente, por los empleadores y empleadoras y podrá 
extenderse a los trabajadores que devenguen una remuneración superior a los 
tres (3) salarios mínimos.

La entrega del ticket o la recarga electrónica, puede efectuarse durante 
todo el mes en curso y hasta los cinco (05) días siguientes al vencimiento 
del mes respectivo.

el Artículo 6 de la Ley de Alimentación indica, que se debe pagar igualmente 
al trabajador el beneficio de tickets o tarjetas electrónicas de alimentación, 
cuando la jornada de trabajo no sea cumplida por el trabajador por causas 
imputables al patrono, cuando el trabajador se encuentre en situación de 
riesgo, incapacidad por enfermedad o accidente que no exceda los doce (12) 
meses, vacaciones, reposo prenatal y postnatal, y permiso por paternidad.

/*