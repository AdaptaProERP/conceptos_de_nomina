FUNCTION H014(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

// JN 28/01/2011
// Todos los Trabajadores Declaran Aunque no Pagan
// IF !EMPTY(ISR1+ISR2+ISR3+ISR4) .AND. !EMPTY(ISR_ASIG)

  nResult:=ISR_ASIG

RETURN nResult
// <EOF>
