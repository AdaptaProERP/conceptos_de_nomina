FUNCTION F011(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A]
     nFactor1:=CREAVAR("FCHPRIMERO",MAX(oNm:dDesde-1,FECHA_ING))
     nFactor2:=MESES(FCHPRIMERO,oNm:dHasta)
     nFactor3:=MIN(nFactor2,12)
     nResult:=MIN(nFactor2,12)
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*