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
Descuenta en el recibo de pago de la nómina ordinaria, el monto del porcentaje de interés 
aplicado al prestamo definido en el concepto "N001" 
La forma de cálculo se realiza sobre el saldo del préstamo y días transcurridos..

Determina el monto de los intereses aplicados sobre el saldo de cada préstamo en forma
 individual, cabe destacar que la tasa de interés puede ser aplicada de dos maneras:
 La primera se refiere a una tasa general que depende valor registrado previamente el
 concepto N001 cuando fue otorgado el préstamo, la segunda manera depende las tasas
 de interés registrada en la tabla de tasas de interés para la columna "préstamos". Para el
 proceso de impresión de prenómina, la variable "VARMEMO" ofrece en forma de texto el
 detalle del cálculo de interés por cada préstamo, por días transcurridos y por cada 
cambio en las tasas de interés.

/*