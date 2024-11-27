FUNCTION D023(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario
  IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()))
     nSalario:=FUNCION(10) // Sueldo para Vacaciones
     VARIAC  :=TABDIAACU  // VARIAC
     nResult:=nSalario*VARIAC
  ENDIF
RETURN nResult
// EOF
/*
Deduce los días y pagos que el trabajador deseas acumular para futuras vacaciones.
Asume el valor de la tabla de Vacaciones, campo "TABDIAACU"

/*