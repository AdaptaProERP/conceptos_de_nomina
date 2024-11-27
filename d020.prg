FUNCTION D020(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF (CONDICION=[A].AND.oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.(CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.(CONDICION=[A].AND.oNm:cTipoNom$[SQM]).OR.                        (CONDICION=[L].AND.FECHA_EGR>oNm:dDesde)
     lVariac:=.T.
     nResult:=VARIAC
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*
Es utilizado en las siguientes nominas:

Nomina semanal, quincenal y mensual: Deduce el porcentaje indicado en el campo
 "PENSION_UT" para Pensión sobre utilidades sobre el monto  de la utilidades calculadas
 por el concepto "A064" y el concepto "A054"
 
LI  "Liquidación": Deduce el porcentaje indicado en el campo "PENSION_UT" para 
Pensión sobre utilidades sobre el monto  de la utilidades para liquidación calculadas
 por el concepto "A064"

UT "Utilidades Diferidas": Deduce el porcentaje indicado en el campo "PENSION_UT" 
para Pensión sobre utilidadessobre el monto  de la utilidades obtenidas por el 
concepto "A064"

UT "Utilidades": Deduce el porcentaje indicado en el campo "PENSION_UT" para
 Pensión sobre utilidades sobre el monto  de la utilidades Calculadas por el 
concepto "A054"

/*