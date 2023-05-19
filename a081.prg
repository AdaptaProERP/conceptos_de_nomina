FUNCTION A081(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,nSalario:=0
LOCAL nResult:=0,nAnos,nSalario,nDias,dDesde,nMeses,nMesesT:=0
lAniver:=ANIVERSARIO(FECHA_ING,oNm:dDesde,oNm:dHasta)
dDesde  :=MAX(CNS(55),FECHA_ING) // Fecha de Ingreso o Vigencia de Ley
ANTIGUEDAD(dDesde,oNm:dHasta,@nAnos,@nMeses,0) // Determina la Cantidad de Aos y Meses
//IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.(oNm:cOtraNom=[VC]))
IF CONDICION=[A].AND.oNm:cOtraNom=[VI]
     TABLAVAC()
     nSalario :=FUNCION(3)
    IF nAnos>=1
        nDias:=nAnos
     ELSE
        nDias:=0
     ENDIF
     VARIAC :=NDIAS   //TABDIAADI+1
     nResult:=VARIAC*nSalario
ENDIF
RETURN nResult
// EOF




/*
FUNCTION A081(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0
  IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.(oNm:cOtraNom=[VC]))
     TABLAVAC()
     nSalario :=FUNCION(10)
     VARIAC   :=TABDIAADI
     nResult  :=VARIAC*nSalario
  ENDIF
RETURN nResult
// EOF

*/
