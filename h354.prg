FUNCTION H354(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDias,dDesde:=FCHINIMES(oNm:dDesde),nDifH:=0
 LOCAL dHasta:=oNm:dHasta

 // jn
 dDesde:=FCHINIMES(IF(oDp:cTipFecha="D",oNm:dDesde,oNm:dHasta))
 dHasta:=FCHFINMES(dDesde)

 IF oDp:cTipoNom="O" .AND. !oDp:cOtraNom$"VI,VC"
    RETURN 0
 ENDIF

 IF (ASIGNA>0 .AND. FINMES()) .OR. (ASIGNA>0 .AND. oDp:cOtraNom$"VI,VC")
    // Vacaciones
    IF oNm:cOtraNom$"VC,VI"

       IF !FchFinMes(TABHASTA)>FchFinMes(TABDESDE) // Regresa el Proximo Mes
          RETURN 0 // No calcula porque regresa el Mismo mes y al final del mes lo hace.
       ENDIF
//       dDesde:=FCHINIMES(TABDESDE)
//       dHasta:=FCHFINMES(TABDESDE)
    ENDIF

    //nResult:=ACUMC_FCH(oNm:aConceptosB,dDesde,dHasta) // Devengado para Integral
      nResult:=ACUMC_FCH(oNm:aConceptosB,dDesde,dHasta)   // oNm:dHastaAnt) // Devengado para Integral

    nDias  :=ACUMC_FCH("H345",dDesde,dHasta)          // Días Trabajados


    IF oNm:lPrenomina //.OR. nDias=0 .OR. oNm:nDias=nDias // Debe Sumar los Valores no Acumulados
       IF nDias=0 // .OR. oNm:nDias=nDias // no hubo Valores Anteriores, debe promediar los apartados
             nResult:=0
             nDifH  :=oNm:nPromedioB-oNm:nBaseB
             nDifH  :=DIV(nDifH,30)*oNm:nDias
          //   oNm:nPromedioB:=oNm:nBaseB+nDifH
       ENDIF
//     MensajeErr(oNm:nPromedioB,nResult)
       nDias  :=nDias  +oNm:nDias
       nResult:=nResult+oNm:nPromedioB
    ENDIF

    IF oNm:lActualiza
       nDias  :=nDias  +oNm:nDias
       nResult:=nResult+oNm:nPromedioB
    ENDIF

    VARIAC :=nDias
    nResult:=DIV(nResult,nDias)

//  MensajeErr(nResult,"nResult")

    nResult:=MAX(nResult,FUNCION(3))      // No puede ser inferior que el salario diario
//  nResult:=nResult-PORCEN(nResult,PORATIPICO)
    GRABARSALARIO("B",nResult,oNm:dHasta) // Solo Graba si Actualiza

  ENDIF

RETURN nResult
// <EOF>
