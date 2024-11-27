FUNCTION F086(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  LOCAL nMeses,nAnos,nDias
  nMeses  :=MESES(oNm:dHasta,FECHA_ING)
  nAnos   :=INT(DIV(nMeses,12))
  nDias   :=nAnos+CNS(057)
  nResult :=IIF(nDias>0,nDias,0)
RETURN nResult 
// EOF 
/*
Calcula DÑas adicionales.
1. Determina la cantidad de a_os.
2. Suma la cantidad de a_os + Constante 57, obtiene la cantidad de dias adicionales.
3. Devuelve el resultado.
El c~lculo est~ incluido en la concepto A082, por ello ya no es necesario

/*