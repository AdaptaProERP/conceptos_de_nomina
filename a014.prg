FUNCTION A014(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDiasIna:=0,nDiasCal:=0


  nDiasIna:=VARPRE("D001")+VARPRE("D008")+VARPRE("D007")+VARPRE("D010")+VARPRE("D011")

   VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta,@nDiasCal)


  IF CONDICION=[A].AND.nDiasIna=0.AND.VARIAC<2 .AND. C_A000<1 .AND. C_A011<1
     nResult:=CNS(51)
  ENDIF

RETURN nResult
// EOF
