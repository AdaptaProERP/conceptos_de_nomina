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
 nD200    :=VARPRE("D200")                 // D�as Descontados por Inasistencia

 IF nD200=0
    nDiasIna:=ACUMV_FCH("D001",dDesde,dHasta) // D�as de Inasistencia
 ELSE
    nDiasIna:=nD200
 ENDIF

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
Mejora en concepto A200 Cesta ticket socialista

1. Valor diario del Cesta ticket:
  a. En el caso que sea calculado seg�n el valor de la divisa, requiere constante
     el valor del �cesta ticket� en divisa en la constante "300".
  b. Caso contrario ser� calculado en Bs seg�n el valor de la constante "90"

2. Cantidad de D�as:
   a. La cantidad de d�as corrientes desde el inicio hasta el final del mes
      pasado.
   b. Si el trabajador ingres� el mes de c�lculo, asume el d�a de ingreso
      hasta el final del mes para calcular la cantidad de d�as.
   c. Si el trabajador concluy� laboralmente el mes de c�lculo o mes pasado,
      la cantidad de d�as ser�n calculados desde el primero de mes hasta el d�a
      de su conclusi�n laboral.
   d. Si el trabajador no tiene historial del pago durante el periodo de pago
      activa la funcionalidad variaci�n para que el usuario introduzca la
      cantidad de d�as de pago que ser�n representado en la variable VARIAC
   e. Si la cantidad de d�as de variaci�n VARIAC es cero, ser� asumido la
      cantidad de d�as transcurridos en el periodo o mes pasado.

3. Deducci�n:

   a. Descuenta los d�as de inasistencia seg�n el hist�rico de variaciones del
   concepto D001 y ser� mostrado en el recibo de Ingreso mediante el concepto
   N020.
   b. Si desea separar en asignaci�n y deducci�n el cesta ticket deber�
   introducir la cantidad de d�as de inasistencia en el Concepto D200


Programa fuente:
https://github.com/AdaptaProERP/conceptos_de_nomina/blob/main/a200.prg

/*