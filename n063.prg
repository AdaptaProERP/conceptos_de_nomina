FUNCTION N063(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A"
   // C~lculos
   lVariac:=.F. // Indica si Requiere Valor en Variaci�n
   nResult:=VARIAC
 ENDIF

RETURN nResult
// <EOF>
/*
Se genera en forma autom�tica desde el Concepto "D010 Reposo M�dico" cuando la
cantidad de d�as de reposo es mayor que "3" y el trabajador posee en su registro  el
porcentaje que asume por reposo en el campo "POR_REPOSO". Este concepto tiene
como finalidad realizar registro contable y su valor ser� deducido en la liquidaci�n de 
prestaciones sociales a trav�s del Concepto "D410 Reposo Pagado por la Empresa"

/*