FUNCTION N064(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nSalario:=0,nAnticipo:=0

 IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ() .AND. oDp:lUtilDif

   // C~lculos
   nSalario:=PROMEDIO_C(FCHINICIO,oNm:dHasta)
   nSalario:=MAX(nSalario,FUNCION(3))

   lVariac:=.F. // Indica si Requiere Valor en Variaci�n
   nResult:=VARIAC*nSalario

   nAnticipo:=ACUMC_FCH("A071") // Anticipos
   IF nAnticipo<>0
     VAROBSERV:="Anticipado: "+ALLTRIM(TRAN(nAnticipo,"999,999,999.99"))
   ENDIF

   nResult:=nResult-nAnticipo

 ENDIF

RETURN nResult
// <EOF>
/*
S�lo se aplica para configuraci�n de utilidades "Diferidas" seg�n "Configurar Empresa". 
Es creado desde el concepto "A064" cuando el patrono realiza el pago de utilidades 
cuando finalice el cierre del ejercicio o cuado lo desee. Recibe el monto de Variaci�n
desde la funci�n "CREAVARCON" que contiene el monto de variaci�n o d�as de utilidades
calculados desde "A064" que se aplica con salario "C" y determina el monto de las
utilidades diferidas menos los anticipos de utilidades y que posteriormente ser� 
cancelada a trav�s del concepto "A064" en la n�mina "UD Utilidades Diferidas".

/*