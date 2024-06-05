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
 nD200    :=VARPRE("D200")                 // Días Descontados por Inasistencia

 IF nD200=0
    nDiasIna:=ACUMV_FCH("D001",dDesde,dHasta) // Días de Inasistencia
 ELSE
    nDiasIna:=nD200
 ENDIF

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
Mejora en concepto A200 Cesta ticket socialista

1. Valor diario del Cesta ticket:
  a. En el caso que sea calculado según el valor de la divisa, requiere constante
     el valor del “cesta ticket” en divisa en la constante "300".
  b. Caso contrario será calculado en Bs según el valor de la constante "90"

2. Cantidad de Días:
   a. La cantidad de días corrientes desde el inicio hasta el final del mes
      pasado.
   b. Si el trabajador ingresó el mes de cálculo, asume el día de ingreso
      hasta el final del mes para calcular la cantidad de días.
   c. Si el trabajador concluyó laboralmente el mes de cálculo o mes pasado,
      la cantidad de días serán calculados desde el primero de mes hasta el día
      de su conclusión laboral.
   d. Si el trabajador no tiene historial del pago durante el periodo de pago
      activa la funcionalidad variación para que el usuario introduzca la
      cantidad de días de pago que serán representado en la variable VARIAC
   e. Si la cantidad de días de variación VARIAC es cero, será asumido la
      cantidad de días transcurridos en el periodo o mes pasado.

3. Deducción:

   a. Descuenta los días de inasistencia según el histórico de variaciones del
   concepto D001 y será mostrado en el recibo de Ingreso mediante el concepto
   N020.
   b. Si desea separar en asignación y deducción el cesta ticket deberá
   introducir la cantidad de días de inasistencia en el Concepto D200


Programa fuente:
https://github.com/AdaptaProERP/conceptos_de_nomina/blob/main/a200.prg

/*