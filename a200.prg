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
 nDias   :=dHasta-dDesde                   // Cantidad de D�as Trasncurridos
 nDiario :=CNS(300)*oNm:nDivisa            // Cesta en Divisas
 nDiasIna:=ACUMV_FCH("D001",dDesde,dHasta) // D�as de Inasistencia

 nDiasT  :=ASIGN(dDesde,dHasta)            // Asignaciones del mes Pasado,
 // Si no hay hist�rico de nomina el mes pasado,inicia nomina el mes presente
 IF nDiasT=0
    lVariac:=.T.     // Solicita Variaci�n
    nDias  :=VARIAC  // D�as del mes, ser�n introducidor manualmente por variacines
 ELSE
    nDias  :=nDias-nDiasIna // Resta la inasistencia
    VARIAC :=nDias
 ENDIF

 // Si no tienen d�as, asume todos los d�as del mes Pasado
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
Obtiene  la Cantidad de d�as h�biles existentes del periodo, adiciona los 
d�as indicados en el concepto "N012" , resta los d�as registrados en el 
concepto "N013", las inasistencias del mes seg�n el concepto: "D001".

Los siguientes conceptos ya no se tomaran en cuenta segun Reposos Medicos
los d�as de inasistencia asumido por vacaciones en el concepto "N060" y los 
permisos remunerados en el concepto "N061". Cabe destacar que los valores 
obtenidos de los conceptos: D001, N060 y N061 corresponde a los registros
hist�ricos del proceso de n�minas corrientes: Semanal, Quincenal y Mensual.

De acuerdo con el art�culo 2, par�grafo segundo de la Ley de Alimentaci�n 
para los Trabajadores y Trabajadoras la empresa est� obligada a otorgar el 
beneficio a los trabajadores que devenguen un salario mensual que no exceda 
tres (03) salarios m�nimos decretados por el Ejecutivo Nacional. 

El art�culo 2, par�grafo tercero de la Ley de Alimentaci�n para los Trabajadores 
y Trabajadoras establece que el beneficio de alimentaci�n podr� ser concedido, 
concertada o voluntariamente, por los empleadores y empleadoras y podr� 
extenderse a los trabajadores que devenguen una remuneraci�n superior a los 
tres (3) salarios m�nimos.

La entrega del ticket o la recarga electr�nica, puede efectuarse durante 
todo el mes en curso y hasta los cinco (05) d�as siguientes al vencimiento 
del mes respectivo.

el Art�culo 6 de la Ley de Alimentaci�n indica, que se debe pagar igualmente 
al trabajador el beneficio de tickets o tarjetas electr�nicas de alimentaci�n, 
cuando la jornada de trabajo no sea cumplida por el trabajador por causas 
imputables al patrono, cuando el trabajador se encuentre en situaci�n de 
riesgo, incapacidad por enfermedad o accidente que no exceda los doce (12) 
meses, vacaciones, reposo prenatal y postnatal, y permiso por paternidad.

/*