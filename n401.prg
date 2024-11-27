FUNCTION N401(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. oNm:cOtraNom="DI" .AND. ACUMC_FCH("H400")=0
    lVariac:=.T.
    nResult:=VARIAC
 ENDIF

RETURN nResult
// <EOF>
/*
: Solicita la cantidad de d�as de Antig�edad laboral que representa el monto introducido
 en el concepto N400. Necesario para determinar la cantidad de d�as correspondiente al
 Art�culo 108. Cabe destacar que los valores introducidos en los conceptos N400 y N401
conforman el valor del concepto H400 donde N400 representa al monto y N401
 representa los d�as que son necesarios para el concepto "A413 Antig�edad laboral 
abonados mensualmente" utilizados por el proceso de n�mina "Liquidaci�n"

/*