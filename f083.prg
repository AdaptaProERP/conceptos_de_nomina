FUNCTION F083(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF oNm:dHasta>CNS(55)
     nFactor1:=CREAVAR("FX",FCHANUAL(FECHA_ING,CNS(55)))
     nFactor2:=CREAVAR("FX",IIF(FX>CNS(55),FX,FCHANUAL(FECHA_ING,CTOD("01/05/92"))))
     nFactor3:=CREAVAR("FX",MAX(FX,FECHA_ING))
     nFactor4:=INT(DIV(MESES(FX,IIF(oNm:cOtraNom="VC",CNS(53),IIF(oNm:cOtraNom="LI",oNm:dHasta,TABDESDE))),12))
     nResult:=nFactor4+CNS(57)
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*