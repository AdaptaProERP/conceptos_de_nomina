FUNCTION D200(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult :=0,nDias,nDiario,nDiarioD,nDias:=0
 LOCAL dDesde:=oNm:dDesde
 LOCAL dHasta:=oNm:dHasta

 IF !oNm:cOtraNom="CT"
    RETURN 0
 ENDIF

 nDias:=ACUMV_FCH("D001",dDesde,dHasta) // Días de Inasistencia

 IF nDias=0
    lVARIAC:=.T.
    nDias:=VARIAC
 ENDIF

 nDiario :=CNS(300)*oNm:nDivisa            // Cesta en Divisas

 IF nDiario=0
   nDiario :=CNS(90)  // En Bs
 ENDIF

 VARIAC  :=nDias
 nResult :=nDias*nDiario

RETURN nResult
// EOF

// <EOF>
/*
Determina si el monto total de deducci©n supera al monto total de asignaci©n, evitando
que se genere un recibo con monto negativo. Obtiene la diferencia entre asignaciones y
deducciones que conformar~ una nueva deducci©n  con signo positivo que igualar~ el
total de  Asignaci©n con el total Deducci©n. El monto del concepto D999 ser~ deducido
en el siguiente proceso de n©mina corriente o liquidaci©n a trav's del concepto D075.

/*