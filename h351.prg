FUNCTION H351(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF oDp:cTipoNom="O" .AND. !oDp:cOtraNom$"VI,VC"
    RETURN 0
 ENDIF

 IF (CONDICION="A" .AND. FINMES()) .OR. (ASIGNA>0 .AND. oDp:cOtraNom$"VC,VI")
   // Vacaciones
   IF oNm:cOtraNom$"VC,VI"

      IF !FchFinMes(TABHASTA)>FchFinMes(TABDESDE) // Regresa el Proximo Mes
         RETURN 0 // No calcula porque regresa el Mismo mes y al final del mes lo hace.
      ENDIF

   ENDIF

   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   VARIAC :=DIV(CNS(50)+FUNCION(84),12) // Alicuota Mensual + DÑas Adicionales
   nResult:=FUNCION(3)*VARIAC

 ENDIF

RETURN nResult
// <EOF>
