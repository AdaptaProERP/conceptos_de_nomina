FUNCTION A500(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nResult1:=0,nResult2:=0,nResult3:=0,nResult5:=0,nResult6:=0

 IF C_A001+C_A002+C_A003>0 .AND.oNm:cTipoNom$[S]
    VARIAC:=REPOSO(oNm:dDesde,oNm:dHasta)
    IF VARIAC=1 // La empresa Asumen Hasta Tres Días
       nResult:=FUNCION(3)*VARIAC
    ENDIF
  ENDIF

 IF VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)=2
    nResult5:=SALARIO*2
 ENDIF

 IF VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)=3
     nResult6:=SALARIO*3
 ENDIF

 IF VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)=4
    nResult1:=SALARIO*4
 ENDIF

 IF VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)=5
     nResult2:=SALARIO*5
 ENDIF

 IF VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)>=6
    nResult3:=SALARIO*7
 ENDIF


RETURN nResult+nResult1+nResult2+nResult3+nResult5+nResult6
// EOF

//RETURN nResult
// <EOF>
