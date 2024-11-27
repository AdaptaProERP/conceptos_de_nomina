FUNCTION D033(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,lTodo

  IF CONDICION=[A].AND.ASIGNA>0.AND.(oNm:cTipoNom$[SQM].OR.(oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.oNm:cOtraNom=[BT])

       VARMEMO:=""
       lTodo  :=oNm:cOtraNom=[LI] // Liquidaci©n Paga Todos
       lVariac:=.T.               // Acepta Variaci©n
       nResult:=LEEPRESTAMO(VARIAC,@VARMEMO,lTodo,oDp:lI_Prestm,NIL,"A031 Préstamo Otros")

  ENDIF
RETURN nResult
// EOF
/*
Se incorpora en el recibo de pago del proceso de n©mina Semanal, Quincenal, 
mensual, otra o liquidaci©n descontando la cuota del prestamo especificada en el 
concepto "N000".

Contiene la suma de todas las cuotas de deducci©n de pr'stamos empleando la funci©n:
LEEPRESTAMO() que se encarga de leer cada registro desde la tabla de pr'stamos para
detectar el saldo y cuota de deducci©n de cada uno de ellos, adem~s; ubica las 
definiciones de cada pr'stamo en la tabla de fechas de descuentos para aplicar la cuota 
correspondiente.

/*