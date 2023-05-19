FUNCTION A011(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nResult1:=0

 IF C_A001+C_A002+C_A003>0
   IF TIPO_NOM="S"
     VARIAC:=PERMISO(oNm:dDesde,oNm:dHasta)
     nResult:=SALARIO*VARIAC
   ENDIF
 ENDIF

 IF C_A001+C_A002+C_A003>0
   IF TIPO_NOM="Q"
     VARIAC:=PERMISO(oNm:dDesde,oNm:dHasta)
     nResult1:=(SALARIO/30)*VARIAC
   ENDIF
 ENDIF

RETURN nResult+nResult1
// EOF



