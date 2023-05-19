FUNCTION A200(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0
 LOCAL nDiario:=0
 LOCAL nDiasT :=0 // Dias trabajados en Caso de Vacaciones/Liquidación
 LOCAL nD001  :=0
 LOCAL nN061  :=0

 IF !(CONDICION$"AL" .AND. (oNm:cOtraNom="CT" .OR. oNm:cOtraNom="LI" .OR. oNm:cOtraNom="VI"))
    RETURN 0
 ENDIF

 // Valor Diario
 nDiario    :=ROUND(CNS(90)/30,2)

 // Liquidación
 IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ()
    VARIAC :=MIN(DAY(LIQFCHEGR),30) // no puede pasar 30 días
    VAROBSERV:="Fecha de Egreso"+DTOC(LIQFCHEGR)
    nResult:=nDiario*VARIAC
    RETURN nResult
 ENDIF

 // Vacaciones Individuales
 IF CONDICION=[A] .AND. oNm:cOtraNom=[VI] .AND. TABLAVAC()
    VARIAC   :=TABHASTA-TABDESDE  // Días de Vacaciones
    VAROBSERV:="Periodo "+DTOC(TABDESDE)+"-"+DTOC(TABHASTA)
    nResult:=nDiario*VARIAC
    RETURN nResult
 ENDIF

 // Retorno de Vacaciones
 IF MONTH(FECHA_FIN)=MONTH(oNm:dHasta) .AND. YEAR(FECHA_FIN)=YEAR(oNm:dHasta)
    VARIAC   :=30-DAY(FECHA_FIN)
    nResult  :=nDiario*VARIAC
    VAROBSERV:="Retorno Vacaciones "+DTOC(FECHA_FIN)
    RETURN nResult
 ENDIF

 IF (CONDICION$"AL"  .AND. oNm:cOtraNom="CT"  .AND. FECHA_ING<oNm:dHasta) .OR. CONDICION=[V]

    dHasta:=oNm:dHasta

    IF !EMPTY(FECHA_EGR)

      dHasta :=MIN(oNm:dHasta,FECHA_EGR)
      dHasta :=MAX(oNm:dHasta,oNm:dDesde)

      IF FECHA_EGR<oNm:dDesde // Esta Liquidado y Fuera del Mes de pago
         RETURN 0
      ENDIF

   ENDIF

   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   nD001  :=ACUMV_FCH("D001,D010",oNm:dDesde,oNm:dHasta) // Inasistencia y Permisos no Remuneados
   nN061  :=ACUMV_FCH("N061"     ,oNm:dDesde,oNm:dHasta) // Permiso no Remunerado
   VARIAC :=MIN(FECHA_ING-oNm:dHasta,30) // Tomando la Fecha de Ingreso, si ingresó el 10 de mayo, será 20 dias

   VAROBSERV:="Valor Diario: "+LSTR(nDiario)
   // Mensual Menos Dias de Inasistencia
   IF nD001>0
      VARIAC  :=VARIAC-  nD001
      VARMEMO+="Días de Inasistencia "+LSTR(nD001)
   ENDIF

   IF nD001>0
      VARMEMO+=CRLF+"Ausencia Injustificada          "+STR(REDONDEA(nD001))+"  "+STR(redondea(CNS(90)))
   ENDIF


//   IF nN061>0
//      VARMEMO+=CRLF+"Menos Permiso Remunerado "+STR(nN061,3,0)+" Días"
//   ENDIF

    IF nN062>0
       VARMEMO+=CRLF+"Menos Reposo Médico Asumido por la Empresa (N062) "+STR(nN062,3,0)+" Días"
    ENDIF

    IF VARIAC=30
       // Cobro Completo
       nResult:=CNS(90)
    ELSE
       nResult:=CNS(90)-(nDiario*nD001)
    ENDIF

  ENDIF

RETURN nResult
// EOF
