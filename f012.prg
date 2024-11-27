FUNCTION F012(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,dFecha,nMeses:=0
  dFecha:=FCHANUAL(FECHA_ING,oNm:dHasta) // Determina Aniversario
  dFecha:=MAX(dFecha,FECHA_ING)
  ANTIGUEDAD(FECHA_ING,dFecha,0,@nMeses,0) // Determina
RETURN nMeses
// EOF
/*
Determina cuantos meses han transcurrido desde la fecha Aniversario laboral.
Necesaria para Calcular Vacaciones y Utilidades.

/*