FUNCTION F003(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  // Salario Tabulado segon Cargo
  // nResult:=IIF(TIPO_NOM=[S],oNMCARGOS:CAR_SUELDO,DIV(oNMCARGOS:CAR_SUELDO,30))
 IF oDp:lConstruccion
    nResult:=DIV(SALARIO,7)
 ELSE
  nResult:=IIF(TIPO_NOM=[S],SALARIO,DIV(SALARIO,30))

  IF oNm:cOtraNom$[UT,VC,VI]
     nResult  :=nResult-PORCEN(nResult,PORATIPICO) // Resta Salario At­pico
  ENDIF
 ENDIF
RETURN nResult
// EOF
/*


/*