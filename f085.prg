FUNCTION F085(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  nResult:=ACUMV_FCH("N085,D023")
  nResult:=nResult-ACUMV_FCH("A085")
RETURN nResult
// EOF
/*
Estaba empleada por A085
Suministra al formulario de Vacaciones los d—as que debe recuperar y acumulados 
anteriormente.

/*