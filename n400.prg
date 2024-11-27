FUNCTION N400(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. oNm:cOtraNom="DI" .AND. ACUMC_FCH("H400")=0
    lVariac:=.T.
    nResult:=VARIAC
 ENDIF

RETURN nResult
// <EOF>
/*
Solicita el Monto total correspondiente de  "Antig�edad laboral" (sin descontar los anticipo
s) para el Art�culo 108; necesario para el proceso de calculo de intereses y pago de
 Antig�edad laboral a trav�s del proceso de n�mina "Liquidaci�n". Si el valor introducido
 en el formulario de variaciones corresponde  al neto o saldo del Art. 108, es decir
 (Antig�edad menos Anticipos) no introduzca ning�n valor en el concepto  "A411".

/*