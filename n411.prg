FUNCTION N411(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION=[A] .AND. oNm:cOtraNom=[DI] .AND. DESTINO_PR!="B"

    IF oNm:lActualiza .AND. (EMPTY(oDp:dFchIniInt) .OR. oDp:dFchIniInt<oNm:dHasta)
       UPDATE_DS() // Actualiza DataSet
    ENDIF

    // C~lculos
    lVariac:=.T. // Indica si Requiere Valor en Variaci©n
    nResult:=VARIAC

 ENDIF

RETURN nResult

/*
// Actualiza el DataSet
*/
FUNCTION UPDATE_DS()
   LOCAL oData

   oData:=DATASET("NOMINA","ALL")
   oData:Set("dFchIniInt",oNm:dDesde)
   oDp:dFchIniInt:=oNm:dDesde
   oData:End()

RETURN .T.
// <EOF>
/*
Nómina: Datos Iniciales
Recibe los Intereses ya Calculados antes del Registro del Trabajador.

Acepta el monto total de los intereses calculados a la fecha, independiente que estén
cancelados. Es necesario indicar en la configuración de la empresa la fecha de inicio
para el cálculo de Intereses, debido a que estos ya fueron calculados por el usuario,
logrando así que el sistema sólo calcule los intereses de los valores registrados para
 el concepto "H400" a partir de esta fecha.  El pago de Intereses quedará compuesto
 por dos elementos, el primero se refiere a los intereses introducidos por el usuario en 
forma directa en "N411" y el segundo segmento se refiere a los intereses calculados 
por el sistema  en "A411" a partir de la fecha indicada en configuración de la empresa.

/*