FUNCTION F007(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A].AND.oNm:cOtraNom$[LI,AL,TR]
     nFactor1:=MESES(FECHA_ING,IIF(oNm:cOtraNom=[TR],"18/06/97",oNm:dHasta))
     nFactor2:=IIF(nFactor1>6,ROUND(DIV(nFactor1,12),0)*CNS(61),IIF(nFactor1>2,CNS(62),0))
     nResult:=nFactor2
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*