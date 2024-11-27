FUNCTION F017(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF .T.
     nFactor1:=FUNCION(16)
     nFactor2:=IIF(nFactor1<0,nFactor1*-1,0)
     nFactor3:=CREAVAR("FCHX",FCHHABIL(CNS(54),nFactor2))
     nFactor4:=DIAS_HAB(CNS(54),FCHX)
     nResult:=IIF(nFactor1<0,nFactor4,0)
  ENDIF
RETURN nResult
// EOF
/*
Solo es utilizada por A043

/*