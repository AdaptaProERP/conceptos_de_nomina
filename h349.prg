FUNCTION H349(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,dDesde:=FCHINIMES(oNm:dDesde),nDias:=0,nSalario:=0
 LOCAL dHasta:=oNm:dHasta

 IF oDp:cTipoNom="O" .AND. !oDp:cOtraNom$"VI,VC"
    RETURN 0
 ENDIF

 IF (CONDICION="A" .AND. FINMES() .AND. ASIGNA>0) .OR. (ASIGNA>0 .AND. oDp:cOtraNom$"VC,VI")
    // Vacaciones
    IF oNm:cOtraNom$"VC,VI"
      IF !FchFinMes(TABHASTA)>FchFinMes(TABDESDE) // Regresa el Proximo Mes
         RETURN 0 // No calcula porque regresa el Mismo mes y al final del mes lo hace.
      ENDIF
    ENDIF

    // Acumulado de Pagos Anteriores
    //nSalario:=PROMEDIO_C(FCHINICIO,dHasta)            // Salario Promedio del A_o
    nResult:=ACUMC_FCH(oNm:aConceptosC,dDesde,oNm:dHastaAnt) // Devengado para Utilidades
    nDias  :=ACUMC_FCH("H345",dDesde,oNm:dHasta)          // DÑas Trabajados

    IF oNm:lPrenomina // Debe Sumar los Valores no Acumulados
       nDias  :=nDias+oNm:nDias
       nResult:=nResult+oNm:nPromedioC
    ENDIF

    IF oNm:lActualiza // Debe Sumar los Valores no Acumulados
       nDias  :=nDias+oNm:nDias
       nResult:=nResult+oNm:nPromedioC
    ENDIF

    VARIAC :=nDias
    nResult:=DIV(nResult,nDias)

    IF nSalario>0 // Promedio del A_o
       nResult:=DIV(nResult+nSalario,2) // Debe ser Promediado
    ENDIF

    nResult:=MAX(nResult,FUNCION(3)) // No puede ser inferior que el salario diario
    GRABARSALARIO("C",nResult)

  ENDIF

RETURN nResult
// <EOF>
