FUNCTION H350(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias,nMeses,nMtoAnt,nDiasAno:=CNS(52)
 LOCAL dFecha,dFchAnt,nSalarioU,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta


 IF (CONDICION="A" .AND. FINMES()) .OR. (ASIGNA>0 .AND. oDp:cOtraNom$"VC,VI")
   // Vacaciones
   IF oNm:cOtraNom$"VC,VI"

      IF !FchFinMes(TABHASTA)>FchFinMes(TABDESDE) // Regresa el Proximo Mes
         RETURN 0 // No calcula porque regresa el Mismo mes y al final del mes lo hace.
      ENDIF

   ENDIF

   // C~lculos
   lVariac  :=.F. // Indica que acepta Valor en Variaci©n
   dFecha   :=FCHINICIO                                    //TOD("01/01/"+STRZERO(YEAR(oNm:dHasta),4))   // 01/Enero
   dFecha   :=MAX(FECHA_ING,dFecha)                        // Fecha Mayor Vs Ingreso.
   dFchAnt  :=MAX(FchIniMes(dDesde)-1,dFecha)              // Mes pasado,>= Enero
   IF .F.
     // Determina el total de la Utilidad de los Meses transcurridos y
     // lo resta del Calculo Actual, asi se determina por descarte.
     nMtoAnt  :=ACUMC_FCH("H350",dFecha,dFchAnt)             // Utilidades Acum Mes/Ant
     nMeses   :=MESES(dFecha,dHasta)                        // Meses
   ELSE
     // Para todos los meses se aplica un solo mes independientemente del los
     // Acumulados anterioes
     nMeses   :=1      // Se Asume un mes para no Calcular todo el Periodo
   ENDIF

   IF MESES(FECHA_ING,oNm:dHasta)>=12
      nDiasAno:=CNS(52) // Beneficio SPI
   ENDIF

   VARIAC   :=nMeses*DIV(nDiasAno,12)                       // Alícuota en Días
   nSalarioU:=C_H349                                        // Promedio para Utilidades
   IF nSalarioU=0
      nSalarioU:=DIV(oNm:nPromedioC,oNm:nDias)
   ENDIF
   nResult:=VARIAC*nSalarioU                             // Salario para Utilidades
   nResult:=nResult-nMtoAnt                              // Deduce Utilidad Anterior
 ENDIF

RETURN nResult
// EOF
