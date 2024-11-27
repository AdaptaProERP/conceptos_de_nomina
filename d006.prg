FUNCTION D006(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF C_A054+C_A064+C_A060>0
     VARIAC :=CNS(45)
     nResult:=PORCEN(C_A054+C_A064+C_A060,CNS(45))
  ENDIF
RETURN nResult
// EOF
/*
Aplica el % porcentaje indicado en la constante "42" sobre el monto calculado para 
Utilidades según el concepto "A054" o "A064" en las nóminas: Liquidación, Utilidades
 y Utilidades Diferidas.

/*