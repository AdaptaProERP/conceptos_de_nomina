FUNCTION F014(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF .T.
     nFactor1:=INT(DIV(MESES(MAX(FECHA_ING,CNS(55)),oNm:dHasta),12))-1
     nResult:=IIF(nFactor1>CNS(59),CNS(59),nFactor1)
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*