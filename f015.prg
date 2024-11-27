FUNCTION F015(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A] .AND.oNm:cOtraNom=[VC]
     nFactor1:=INT(DIV(MESES(MAX(FECHA_ING,CNS(55)),oNm:dHasta),12))
     nFactor2:=IIF(FECHA_ING>CNS(55),CNS(57)-1,0)
     nResult:=nFactor1+nFactor2
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*