FUNCTION F004(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF .T.
     nResult:=IIF(TIPO_NOM=[S],SALARIO*7,DIV(SALARIO*12,52))
  ELSE 
      //
  ENDIF 
RETURN nResult 
// EOF 
/*


/*