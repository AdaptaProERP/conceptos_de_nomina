FUNCTION P203(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

  IF !C_P200==0
     VARIAC:=CNS(42)
     nResult:=PORCEN(C_P001,CNS(42))
  ENDIF

RETURN nResult
// <EOF>
/*
//Cambio de Ley de Politica Habitacional a Ley de Vivienda y Hábitat segun ley 2005

/*