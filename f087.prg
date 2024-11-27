FUNCTION F087(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0
 LOCAL dDesde,dHasta

 dDesde :=MAX(FECHA_FIN,FECHA_ING) // Fecha de las Vacaciones Pasadas o Ingreso
 dHasta :=oDp:dFecha                // Fecha del Sistema
 nResult:=ACUMC_FCH("N060",dDesde,dHasta)

RETURN nResult
// <EOF>

/*
Determina los dias de vacaciones otorgados a trav's de permisos remunerados

/*