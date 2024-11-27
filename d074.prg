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
descontado cuando el trabajador cobró el monto de bono vacacional. Sólo se aplica 
si en la liquidación está incluido el pago del Bono Vacacional según el concepto: "A082"

/*