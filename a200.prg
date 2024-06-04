FUNCTION A200(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult :=0,nDias,nDiario,nDiarioD
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

 IF nDiario=0
   nDiario :=CNS(90)  // En Bs
 ENDIF

 nVariac :=nDias
 nResult :=nDias*nDiario

RETURN nResult
// EOF
