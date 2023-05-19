FUNCTION A412(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF DESTINO_PR=[C].AND.CONDICION=[A].AND.(oNm:cOtraNom=[LI].AND.TABLALIQ())               .AND.FECHA_ING<oNm:dHasta
     nFactor1:=ACUMC_FCH("H400,A415")
     nFactor2:=FUNCION(3)+DIV(CNS(52)*(FUNCION(3)+FUNCION(400)),360)+FUNCION(400)
     nFactor3:=MAX(MAX(FUNCION(18),nFactor1)-nFactor1,0)
     nResult:=nFactor3*nFactor2
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
