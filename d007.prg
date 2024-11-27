FUNCTION D007(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nDiasIna:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta,nDiasCal:=0

 IF CONDICION=[A]
     nDiasIna:=AUSENCIA("PSR",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // Dias de Inasistencia en el periodo
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
// <EOF>
/*
Esta relacionado con los registros de ausencias, que a trav's de la funci©n
AUSENCIA("PNR") determina la cantidad de dÑas laborables no trabajados durante el 
periodo de pago. Los dÑas solicitados est~n configurados  para el tipo de ausencia:
"PRN  de Permisos no Remunerados" vinculado a dÑas laborales. En caso que la cantidad 
de dÑas calendario o corrientes representados por "@nDiasCal" sean igual o superior a la 
periodo de pago indicado por "oNm:nDias", asumir~  la inasistencia segon la cantidad de
periodo de pago equilibrando la inasistencia con el monto correspondiente al Salario.


/*