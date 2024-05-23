FUNCTION N025(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nSalario:=0
  LOCAL dDesde,dHasta,dIni:=0

  dIni:=FCHINICIO
  dIni:=oNm:dDesde
//dHasta:=FCHINIMES(oNm:dDesde)-1 ***oRIGINAL***
  dHasta:=FCHFINMES(oNm:dDesde)-30
  dDesde:=FCHINIMES(dHasta)
//  nSalario:=PROMEDIO_C(FCHINICIO,dHasta) ***oRIGINAL***
    nSalario:=PROMEDIO_C(dDesde,dHasta)
//  dDesde:=FCHINIMES(oNm:dHasta)-1
//  dHasta:=FCHINIMES(dDesde)-1
//  nResult:=ASIGN_PRES(dDesde,dHasta)
RETURN nSalario
// EOF
