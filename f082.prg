FUNCTION F082(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF .T.
     nFactor1:=CREAVAR("FX",FCHANUAL(FECHA_ING,CNS(55)))
     nFactor2:=CREAVAR("FX",IIF(FX>CNS(55),FX,FCHANUAL(FECHA_ING,CTOD("01/05/92"))))
     nFactor3:=INT(DIV(MESES(FECHA_ING,IIF(oNm:cOtraNom=[VC],CNS(53),oNm:dHasta)),12))
     nResult:=IIF(nFactor3>15,15,IIF(nFactor3<7.AND.FCHSISTE>CNS(55),7,nFactor3))
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*