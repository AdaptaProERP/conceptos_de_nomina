FUNCTION D999(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. DEDUCC>ASIGNA

    nResult:=(INT(DEDUCC*100)-INT(ASIGNA*100))*-1
    nResult:=DIV(nResult,100)

 ENDIF

RETURN nResult
// <EOF>
/*
Determina si el monto total de deducci©n supera al monto total de asignaci©n, evitando
que se genere un recibo con monto negativo. Obtiene la diferencia entre asignaciones y
deducciones que conformar~ una nueva deducci©n  con signo positivo que igualar~ el
total de  Asignaci©n con el total Deducci©n. El monto del concepto D999 ser~ deducido
en el siguiente proceso de n©mina corriente o liquidaci©n a trav's del concepto D075.

/*