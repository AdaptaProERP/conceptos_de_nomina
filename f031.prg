FUNCTION F031(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF .T.
     nFactor1:=CREAVAR("dFECHAN2",FCHINIMES(oNm:dHasta)-1)
     nFactor2:=CREAVAR("dFECHAN1",CTOD(LEFT(DTOC(dFECHAN2+1),6)+STRZERO(YEAR(dFECHAN2)-1,4)))
     nFactor3:=DIV(DIV(ASIGN_NORM(dFECHAN1,dFECHAN2),12),30)
     nResult:=nFactor3
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*