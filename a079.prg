FUNCTION A079(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF CONDICION=[A].AND.oNm:cOtraNom=[VI].AND.TABLAVAC()
     nFactor1:=FUNCION(80)+FUNCION(84)+FUNCION(85)-VARPRE("D023")
     nFactor3:=GRATABVAC("TAB_DIAS",nFactor1)
     nFactor4:=GRATABVAC("TAB_HASTA",FCHHABIL(TABDESDE,nFactor1))
     nResult:=0
  ENDIF

RETURN nResult
// EOF
