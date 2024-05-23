FUNCTION H008(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF CONDICION=[A] .AND. ASIGNA>0
    nResult:=IIF(TIPO_NOM="S",SALARIO,DIV(SALARIO,30))
  ENDIF
  IF oNm:cTipoNom="O" .AND. !(oNm:cTipoNom$"VC,VI")
    nResult:=0
  ENDIF

RETURN nResult
// EOF
