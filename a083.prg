/*
FUNCTION A083(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0
  IF CONDICION=[A].AND.oNm:cOtraNom$[VI,VC].AND.TABLAVAC()
     nSalario:=MAX(FUNCION(30),FUNCION(3))
     VARIAC  :=TABDIAFER+TABDIADES
     nResult :=nSalario*VARIAC
  ENDIF
RETURN nResult
// EOF
*/


FUNCTION A083(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0,FerSab:=0,FerDom:=0,nFerSabDom:=0
  IF CONDICION=[A].AND.oNm:cOtraNom$[VI,VC].AND.TABLAVAC()
     nSalario:=FUNCION(3)  //MAX(FUNCION(30),FUNCION(3))
     FerSab:=FERIAD_SAB(TABDESDE,TABHASTA)
     FerDom:=FERIAD_DOM(TABDESDE,TABHASTA)
     nFerSabDom:=FerSab+FerDom
  //VARIAC  :=TABDIAFER+TABDIADES

     VARIAC  :=IIF(TABDIAFER<>DIAS_HAB(oNMTABVAC:TAB_DESDE,oNMTABVAC:TAB_FCHREI),TABDIADES,TABDIAFER+TABDIADES)
     nResult :=nSalario*VARIAC
  ENDIF
RETURN nResult
// EOF

