FUNCTION A084(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nSalario:=0

 IF CONDICION="A" .AND. (oNm:cOtraNom=[LI].AND.TABLALIQ() .OR. C_A082>0)
   // C~lculos
   nSalario:=MAX(FUNCION(3),FUNCION(10))
   lVariac :=.T. // Indica si Requiere Valor en Variaci©n
   VARIAC  :=IIF(VARIAC=0,ACUMC_FCH("N082")-ACUMV_FCH("A084"),VARIAC)
 ENDIF

RETURN nResult
// <EOF>
