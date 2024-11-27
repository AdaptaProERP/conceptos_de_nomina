FUNCTION D012(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nReposo:=0,nDiasCal:=0,nDiario

  IF C_A001+C_A002+C_A003+C_A004+C_A008+C_A010+C_A043+C_A080>0

     nReposo:=REPOSO(oNm:dDesde,oNm:dHasta,@nDiasCal)

     // Todo el Periodo de Pago est~ de Reposo
     IF nReposo>=nDiasCal .AND. nDiasCal>=oNm:nDias
        RETURN 0
     ENDIF

     VARIAC :=CAJA_AHORR
     lVariac:=.F.
     nResult:=PORCEN(C_A001+C_A002+C_A003+C_A004+C_A008+C_A010+C_A043+C_A080,VARIAC)

     IF CAJA_AHORR>100 // Asigna el Monto Absoluto, para Fondo de Ahorro
        nDiario:=DIV(CAJA_AHORR,30)
        VARIAC :=oNm:nDias

        IF VARIAC>=oNm:nDias .AND. nDiasCal>0
           VARIAC:=MIN(nDiasCal,oNm:nDias)
        ENDIF

        nResult:=VARIAC*nDiario

     ENDIF

  ENDIF

RETURN nResult
// EOF
/*
Si el trabajador esta de reposo en el periodo,  el resultado es cero. El porcentaje  de 
descuento están almacenadas en "VARIAC", tomado del campo "CAJA_AHORR" de la 
tabla del trabajador, multiplica por la  sumatoria del sueldo más
 vacaciones

/*