FUNCTION N062(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF C_A001+C_A002+C_A003>0
    VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta)
    IF VARIAC<=3 // La empresa Asumen Hasta Tres DÌas
       nResult:=FUNCION(3)*VARIAC
    ENDIF
  ENDIF

RETURN nResult
// EOF

RETURN nResult
// <EOF>
/*
Obtiene los d—as de Reposo segon la funci©n: REPOSO(oNm:dDesde,oNm:dHasta)
 previamente registrados en la tabla de Ausencia. Determina la cantidad de d—as laborables
 que el seguro social otorg© al trabajador por reposo m'dico. En caso que la cantidad de 
d—as de reposo es menor  o igual que 3 se genera el valor y registro del concepto N062
 que ser~ utilizado por la n©mina Cesta Ticket que obtiene la cantidad de d—as trabajados 
segon el Concepto "A200".

/*