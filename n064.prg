FUNCTION N064(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nSalario:=0,nAnticipo:=0

 IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ() .AND. oDp:lUtilDif

   // C~lculos
   nSalario:=PROMEDIO_C(FCHINICIO,oNm:dHasta)
   nSalario:=MAX(nSalario,FUNCION(3))

   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   nResult:=VARIAC*nSalario

   nAnticipo:=ACUMC_FCH("A071") // Anticipos
   IF nAnticipo<>0
     VAROBSERV:="Anticipado: "+ALLTRIM(TRAN(nAnticipo,"999,999,999.99"))
   ENDIF

   nResult:=nResult-nAnticipo

 ENDIF

RETURN nResult
// <EOF>
