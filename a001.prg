FUNCTION A001(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,v,P,o

IF C_A000<1
   IF VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)<=5
    IF CONDICION$[AL]
        P:= oTrabajador:TIPO_NOM
       lVariac  :=.F.                  // Solicita Variaci÷n
       VARIAC   :=DIAS_TRAB(5)
       v:=VARIAC
       oNm:nDias:=VARIAC               // Dias Trabajados
 //      SALARIO  :=SALARIO-PORCEN(SALARIO,PORATIPICO) // Resta Salario At­pico
       nResult  :=VARIAC*SALARIO
       nResult  :=nResult-PORCEN(nResult,PORATIPICO) // Resta Salario At­pico

    ENDIF
   ENDIF
ENDIF

RETURN nResult
// EOF
