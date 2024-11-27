FUNCTION D015(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION="A" .AND. ASIGNA>0
   // C~lculos
   lVariac:=.F. // Indica si Requiere Valor en Variaci©n

   nResult:=HcmFamCapital(oNm:dDesde,FchFinMes(oNm:dHasta),@VARMEMO)

 ELSE
   // Otros Calculos
 ENDIF

RETURN nResult
// <EOF>
/*
D015 H.C.M. Familiar (Capital): Obtiene la información necesaria del 
formulario "Otras Opciones", que se encuentra en la tabla del trabajador,  para ello 
se utiliza la función HcmFamCapital(oNm:dDesde,FchFinMes).

/*