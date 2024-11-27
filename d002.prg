FUNCTION D002(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDiasIna:=0,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta,nDiasCal:=0
  IF CONDICION=[A]
     nDiasIna:=AUSENCIA("INA",@dDesde,@dHasta,@nDiasCal,@VAROBSERV) // D�as de Inasistencia en el periodo
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
Esta vinculado directamente con la tabla de ausencias, que a trav�s de la funci�n
 AUSENCIA("INA") determina la cantidad de d�as laborables no trabajados durante el 
periodo de pago. Los d�as solicitados est�n configurados  para el tipo de ausencia:
"INA de Inasistencia" que s�lo vincula d�as laborales. En caso que los d�as calendario 
o corrientes representados por "@nDiasCal" sean igual o superior a la periodo de pago
representado por "oNm:nDias", asumir�  la inasistencia seg�n la cantidad de periodo
de pago equilibrando la inasistencia con el monto correspondiente al Salario.

MODIFICADO POR EDGAR:

  SE COLOCO INASISTENCIA 1 PARA EFECTOS DE LA NOMINA QUINCENAL, SEM 1 Y SEM 2 EN 
  INASISTENCIA 2 D002

/*