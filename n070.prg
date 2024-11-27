FUNCTION N070(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDiario:=DIV(CAJ_APORTE,30)

 IF C_D012<>0 // El trabajador Aporta

   IF CAJ_APORTE>100 // Absoluto se maneja diario, SPI
     VARIAC :=VARPRE("D012")
     nResult:=VARIAC*nDiario
     IF VARIAC=0
       nResult:=CAJ_APORTE
     ENDIF
   ELSE
     // Relativo
     VARIAC :=CAJ_APORTE
     lVariac:=.F.
     nResult:=PORCEN(C_A001+C_A002+C_A003+C_A004+C_A008+C_A010+C_A043+C_A080,VARIAC)
   ENDIF
 ENDIF

 RETURN nResult

 IF CONDICION="A" .OR. (oNm:cOtraNom$"VI,VC" .AND. CAJ_APORTE>100)

   // C~lculos

   IF !C_D012==0 // Cuando el Aporte es Absoluto

      VARIAC :=VARPRE("D012")
      nResult:=VARIAC*nDiario

   ENDIF

 ENDIF

RETURN nResult
// <EOF>
/*


/*