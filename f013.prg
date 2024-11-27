FUNCTION F013(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A] .AND.oNm:cOtraNom=[VC]
     nFactor1:=DIV(MESES(FECHA_ING,CNS(55)),12)
     nFactor2:=IIF(nFactor1<0,0,nFactor1)
     nFactor3:=IIF(nFactor2<7.AND.nFactor2>0,7-1,nFactor2)
     nFactor4:=IIF(nFactor3>=15,15,nFactor3)
     nResult:=INT(nFactor4)
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*