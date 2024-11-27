FUNCTION F105(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  nFactor1:=IIF(TIPO_NOM=[S],SALARIO*360/52,DIV(SALARIO*12,52))
  nFactor2:=DIV(CNS(21)*CNS(26)*12,52)
  nFactor3:=MIN(nFactor1,nFactor2)
  nResult:=nFactor3
RETURN nResult
// EOF
/*
//Cambio el nombre de Paro Forzoso a Regimen Prestacional de Empleo segun Ley
vigente(2005)

/*