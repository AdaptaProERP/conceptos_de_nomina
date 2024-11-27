FUNCTION F010(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  LOCAL nMeses,nSalario,


  IF oDp:lConstruccion
     VARIAC:=EJECUTAR("NMBUSCATABANT",FECHA_ING , oNm:dHasta, 2) // Dias de antigüedad
     nSalario:=DIV(FUNCION(10)*VARIAC,30) // El promedio por los dias de antig. entre 30
     nResult:=nSalario+FUNCION(10)
  ENDIF

RETURN nResult
// EOF
/*
Salario Promedio, se emplea el C, utilizado para Utilidades.

/*