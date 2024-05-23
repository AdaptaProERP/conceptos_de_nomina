FUNCTION A064(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSueldo
  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ()
     VARIAC :=FUNCION(60) // Dias de Utilizades
     nSueldo:=FUNCION(3)  // Salario
     nResult:=VARIAC*nSueldo
     nFactor4:=ACUMC_FCH("A054",IIF(oNm:cOtraNom=[LI],FCHINICIO,oNm:dDesde)+1,FECHASIS)
 //    nResult:=nFactor3
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
