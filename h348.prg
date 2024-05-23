FUNCTION H348(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,dDesde:=FCHINIMES(oNm:dDesde),nDias:=0

 IF ASIGNA>0 .AND. FINMES()
    // Acumulado de Pagos Anteriores
                                            //Modificado TJ
    nResult:=ACUMC_FCH(oNm:aConceptosD,dDesde,oNm:dHastaAnt) // Devengado para Utilidades
    //nResult:=ACUMC_FCH(oNm:aConceptosD,dDesde,oNm:dHasta) // Devengado para Utilidades
    nDias  :=ACUMC_FCH("H345",dDesde,oNm:dHasta)          // DÑas Trabajados

    IF oNm:lPrenomina // Debe Sumar los Valores no Acumulados
       nDias  :=nDias+oNm:nDias
       nResult:=nResult+oNm:nPromedioD
    ENDIF

    IF oNm:lActualiza // Debe Sumar los Valores no Acumulados
       nDias  :=nDias+oNm:nDias
       nResult:=nResult+oNm:nPromedioD
    ENDIF

    VARIAC :=nDias
    nResult:=DIV(nResult,nDias)
    nResult:=MAX(nResult,FUNCION(3)) // No puede ser inferior que el salario diario
    GRABARSALARIO("D",nResult)
  ENDIF


RETURN nResult
// <EOF>
