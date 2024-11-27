FUNCTION F016(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF .T.
     nFactor1:=MESES(MAX(FECHA_ING,oNm:dDesde),oNm:dHasta+1)
     nFactor2:=INT(DIV(nFactor1,12)*(FUNCION(80)+FUNCION(84)))
     nFactor3:=DIAS_HAB(CNS(53),CNS(54))
     nResult:=nFactor3-nFactor2
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*