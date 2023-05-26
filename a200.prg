FUNCTION A200(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
  LOCAL nResult:=0
  LOCAL nDiario:=0
  LOCAL nDiasT :=0 // Dias trabajados en Caso de Vacaciones/Liquidación
  LOCAL nD001  :=0
  LOCAL nD010  :=0 // Reposo
  LOCAL nN061  :=0 // Permiso no Remunerado
  LOCAL nN062  :=0 // Reposo Medico
  LOCAL nCestaT:=0 // Monto del Cesta Ticket

  IF !(CONDICION$"AL" .AND. (oNm:cOtraNom="CT" .OR. oNm:cOtraNom="LI" .OR. oNm:cOtraNom="VI"))
     RETURN 0
  ENDIF

  // Esta Liquidado y Fuera del Mes de pago
  IF !Empty(FECHA_EGR) .AND. FECHA_EGR<oNm:dDesde
     RETURN 0
  ENDIF

  // Valor Diario
  nCestaT    :=MAX(CNS(90),1000)
  nDiario    :=ROUND(nCestaT/30,2)

  IF oDp:lPlanifica
     VARIAC :=30
     nResult:=nCestaT
     RETURN nResult
  ENDIF

  // Liquidación
  IF oNm:cOtraNom=[LI].AND.TABLALIQ()
    VARIAC :=MIN(DAY(LIQFCHEGR),30) // no puede pasar 30 días
    VAROBSERV:="Fecha de Egreso"+DTOC(LIQFCHEGR)
    nResult:=nDiario*VARIAC
    RETURN nResult
  ENDIF

  // Vacaciones Individuales
  IF oNm:cOtraNom=[VI] .AND. TABLAVAC()
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

  // Pago Mensual
  lVariac  :=.F. // Indica si Requiere Valor en Variaci©n
  nD001    :=ACUMV_FCH("D001",oNm:dDesde,oNm:dHasta) // Inasistencia y Permisos no Remuneados
  nD010    :=ACUMV_FCH("D010",oNm:dDesde,oNm:dHasta) // Repososo
  nN061    :=ACUMV_FCH("N061",oNm:dDesde,oNm:dHasta) // Permiso no Remunerado
  VARIAC   :=MIN(FECHA_ING-oNm:dHasta,30)            // Tomando la Fecha de Ingreso, si ingresó el 10 de mayo, será 20 dias
  VAROBSERV:="Valor Diario: "+LSTR(nDiario)

  // Mensual Menos Dias de Inasistencia
  IF nD001>0
     VARIAC  :=VARIAC-  nD001
     VARMEMO+="Días de Inasistencia "+LSTR(nD001)
  ENDIF

  IF nD001>0
     VARMEMO+=CRLF+"Menos "+LSTR(nD001)+" dia(a) Ausencia Injustificada"
  ENDIF

  // Reposo Medico no es Deducido
  IF nD010>0
     VARMEMO+=CRLF+"Incluye "+LSTR(nD010)+" dias(s) Reposo Médico"
  ENDIF

  // Reposo Medico no es Deducido
  IF nN062>0
    VARMEMO+=CRLF+"Incluye "+LSTR(nN062)+" dia(s) Reposo Médico Asumido por el Patrono"
  ENDIF

  IF VARIAC=30
    // Cobro Completo
    nResult:=nCestaT
  ELSE
    nResult:=nCestaT-(nDiario*nD001)
  ENDIF

RETURN nResult
