FUNCTION D001(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDiasIna:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta,nDiasCal:=0
  IF CONDICION=[A]
     nDiasIna:=AUSENCIA("INA",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // DÑas de Inasistencia en el periodo
     IF nDiasIna=0
       // Si no hay ausencias asume, las solicita en Variacion
       lVariac:=.T.
     ELSE
       VARIAC:=nDiasIna
       IF nDiasCal>=oNm:nDias // La Inasistencia es mayor o Igual que la Semana de Pago
          VARIAC:=nDiasCal
       ENDIF
     ENDIF
     nResult:=VARIAC*FUNCION(3)
  ENDIF
RETURN nResult
// EOF
/*
Registra las inasisntencias por reposo.

La idea es no registrarlas en inasisntencias normales, para no afectar
los dias de descansos. 

por: edgar perdomo

/*