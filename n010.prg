FUNCTION N010(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. oNm:cOtraNom=[AS]
   // C~lculos
   lVariac :=.T.      // Indica si Requiere Valor en Variaci¸n
   nFactor1:=SALARIO  // Salario AnteriorAsi es Grabado en NMOBSERV
   nResult:=GRABARCAM("SALARIO",SALARIO+VARIAC,VARIAC)
 ENDIF

RETURN nResult
// EOF
