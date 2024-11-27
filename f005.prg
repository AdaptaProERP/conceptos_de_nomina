FUNCTION F005(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nSemana:=0,nTope:=0

  nSemana:=IIF(TIPO_NOM=[S],SALARIO*360/52,DIV(SALARIO*12,52))
  nTope  :=DIV(CNS(20)*CNS(26)*12,52)
  nSemana:=MIN(nSemana,nTope)

RETURN nSemana
// EOF
/*
Determina la Cotizaci©n Semanal del Seguro Social
Calcula el Tope y obtiene el menor

/*