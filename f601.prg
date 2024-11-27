FUNCTION F601(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDiario,dDesde:=FCHINIMES(oNm:dHasta),nDias:=0

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

     nDias  :=ACUMC_FCH("H345",dDesde,oNm:dHasta) // Días Trabajados en el Mes
     nResult:=30*FUNCION(352) // Determina los Días de Bono Vacacional
     VARIAC :=VARPRE("F352")
  ENDIF

RETURN nResult
// EOF
/*
Concepto para sumar el aporte de utilidad al salario para calcular el D028

/*