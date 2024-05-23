FUNCTION N062(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF C_A001+C_A002+C_A003>0
    VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)
    IF VARIAC<=3 // La empresa Asumen Hasta Tres Días
       nResult:=FUNCION(3)*VARIAC
    ENDIF
  ENDIF

RETURN nResult
// EOF

RETURN nResult
// <EOF>
