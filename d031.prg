FUNCTION D029(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,nDeuda:=0

 IF !oDp:lI_Prestm
    RETURN 0
 ENDIF

 IF C_D030<>0 .AND. CONDICION=[A].AND.ASIGNA>0.AND.(oNm:cTipoNom$[SQM].OR.(oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.oNm:cOtraNom=[BT])

    oDp:cMemo:=""
    nResult  :=EJECUTAR("NMINTPRESTM",CODIGO,NIL,0,0,NIL,oNm:dHasta)
    IF oNm:lPrenomina
       VARMEMO  :=oDp:cMemo
    ENDIF
  ENDIF

RETURN nResult
// EOF
/*
Descuenta en el recibo de pago de la n�mina ordinaria, el monto del porcentaje de inter�s 
aplicado al prestamo definido en el concepto "N001" 
La forma de c�lculo se realiza sobre el saldo del pr�stamo y d�as transcurridos..

Determina el monto de los intereses aplicados sobre el saldo de cada pr�stamo en forma
 individual, cabe destacar que la tasa de inter�s puede ser aplicada de dos maneras:
 La primera se refiere a una tasa general que depende valor registrado previamente el
 concepto N001 cuando fue otorgado el pr�stamo, la segunda manera depende las tasas
 de inter�s registrada en la tabla de tasas de inter�s para la columna "pr�stamos". Para el
 proceso de impresi�n de pren�mina, la variable "VARMEMO" ofrece en forma de texto el
 detalle del c�lculo de inter�s por cada pr�stamo, por d�as transcurridos y por cada 
cambio en las tasas de inter�s.

/*