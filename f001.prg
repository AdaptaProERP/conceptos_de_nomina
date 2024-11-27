FUNCTION F001(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
IF TURNO<>[03]
  nFactor1:=DIV(SALARIO,CNS(29))
  nFactor2:=DIV(SALARIO,30)
  nFactor3:=DIV(nFactor2,CNS(29))
  nResult:=IIF(TIPO_NOM=[S],nFactor1,nFactor3)
ELSE
  nFactor1:=DIV(SALARIO,CNS(35))
  nFactor2:=DIV(SALARIO,30)
  nFactor3:=DIV(nFactor2,CNS(35))
  nResult:=IIF(TIPO_NOM=[S],nFactor1,nFactor3)
ENDIF
RETURN nResult
// EOF

/*
Obtiene el valor de la hora de trabajo.
Divide el salario mensual entre 30 y luego entre las (n u 8) horas de la jornada indicada 
en la constante 29.

/*