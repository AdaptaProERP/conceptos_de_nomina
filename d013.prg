FUNCTION D013(uPar1,uPar2,uPar3,uPar4,uPar5)
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
Se utiliza para deducirle en el recibo un monto.  El monto esta almacenado 
en "VARIAC".

/*