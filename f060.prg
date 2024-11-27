FUNCTION F060(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nMeses
  nMeses :=MESES(MAX(FCHINICIO,FECHA_ING),oNm:dHasta+1)
  nResult:=DIV(nMeses,12)*CNS(052)
RETURN nResult
// EOF
/*


/*