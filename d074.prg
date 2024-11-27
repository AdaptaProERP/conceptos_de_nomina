FUNCTION D073(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF CONDICION=[A] .AND. (oNm:cOtraNom=[LI].AND.TABLALIQ() .OR.;
                          C_A082>0)
     nResult:=ACUMC_FCH("A074,D074")
  ENDIF

RETURN nResult
// Eof
/*
Deduce el monto correspondiente a Bono Vacacional que ha sido adelantado y no 
descontado cuando el trabajador cobr� el monto de bono vacacional. S�lo se aplica 
si en la liquidaci�n est� incluido el pago del Bono Vacacional seg�n el concepto: "A082"

/*