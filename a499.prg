FUNCTION A499(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nResult1:=0,VARIAC2:=0,nResult2:=0

   VARIAC2 :=REPOSO(oNm:dDesde,oNm:dHasta)

  IF C_A001+C_A002+C_A003>0 .AND.oNm:cTipoNom$[Q]
    VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)
    IF VARIAC<4 // La empresa Asumen Hasta Tres Días
       nResult:=FUNCION(3)*VARIAC
    ENDIF
  ENDIF

 IF oNm:cTipoNom$[Q] .AND. VARIAC2>4 .AND. VARIAC2<16
    VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)
    //IF VARIAC>04 // La empresa Asumen Hasta Tres Días
       nResult1:=FUNCION(3)*VARIAC
    //ENDIF
  ENDIF

 IF oNm:cTipoNom$[Q] .AND. VARIAC2>15
    //VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)
    //IF VARIAC>04 // La empresa Asumen Hasta Tres Días
       nResult2:=(SALARIO/30)*15
    //ENDIF
  ENDIF


RETURN nResult+nResult1+nResult2
// EOF

//RETURN nResult
// <EOF>
