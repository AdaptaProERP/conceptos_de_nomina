FUNCTION D073(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF CONDICION=[A].AND. oNm:cOtraNom=[LI].AND.TABLALIQ()
     nResult:=ACUMC_FCH("A073,D073")
  ENDIF

RETURN nResult
// EOF
/*
Se aplica cuando el trabajador finalice la relaci�n laboral y se utiliza como contrapeso
del concepto A412.
N�mina "DI"
Solicita el monto correspondiente al total de adelantos para "Antig�edad laboral" que ser�n
descontado mediante el concepto "D073" cuando se procese la n�mina de "Liquidaci�n".
El Anticipo afectar� el c�lculo de intereses sobre prestaciones realizado por el concepto 
"A411".

/*