FUNCTION H006(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,aDias:={5,15,30,0},nAt:=AT(TIPO_NOM,"SQMO"),dDesde,dHasta
  IF ASIGNA>0
    dDesde:=oNm:dDesde
    dHasta:=oNm:dHasta
    DIAS_TRAB(aDias[nAt],NIL,@dDesde,@dHasta)
    nResult:=DIAS_HAB(dDesde,dHasta)
    VARIAC :=HORAS_TRAB(NIL,dDesde,dHasta) // Cantidad de Horas Trabajadas
  ENDIF
RETURN nResult
// EOF
