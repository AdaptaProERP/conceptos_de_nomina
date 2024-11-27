FUNCTION D070(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF C_A001+C_A002+C_A003>0.AND.(CONDICION=[A].AND.!oNm:cOtraNom$[AN,LI,VI,VC,PR,UT]).OR. (CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ())
     nResult:=ACUMC_FCH("A070,D070")
  ENDIF
RETURN nResult
// EOF
/*
No requiere el campo ANTICIPADO,
Ahora emplea la diferencia entre lo anticipado y lo recuperado.
Nómina "DI"
Solicita el monto por concepto de Salario Anticipado que será descontado  a través del
concepto "D070" en el inmediato pago corriente: Semanal, Quincenal o Mensual.

/*