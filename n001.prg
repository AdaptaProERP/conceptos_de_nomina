FUNCTION N001(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF !oDp:lI_Prestm
     RETURN 0
  ENDIF

  IF CONDICION=[A] .AND. oNm:cOtraNom=[PR] .AND. oDp:lI_Prestm
     lVariac:=.T.
  ENDIF
RETURN VARIAC
// EOF
/*
Almacena el porcentaje de tasa de inter�s anual que ser� aplicado sobre el saldo del 
pr�stamo cada vez que se deduce mediante el concepto "D029". La forma de c�lculo se 
realiza sobre el saldo del pr�stamo y d�as transcurridos.

/*