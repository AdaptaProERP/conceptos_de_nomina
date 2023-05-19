FUNCTION A081(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,nSalario:=0
LOCAL nResult:=0,nAnos,nSalario,nDias,dDesde,nMeses,nMesesT:=0
lAniver:=ANIVERSARIO(FECHA_ING,oNm:dDesde,oNm:dHasta)
dDesde  :=MAX(CNS(55),FECHA_ING) // Fecha de Ingreso o Vigencia de Ley
ANTIGUEDAD(dDesde,oNm:dHasta,@nAnos,@nMeses,0) // Determina la Cantidad de Aos y Meses
IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.(oNm:cOtraNom=[VC]))
     TABLAVAC()
     nSalario :=FUNCION(3)
     IF nAnos>=1
        nDias:=nAnos+CNS(057)  //-1
        //nDias:=MIN(30,nDias)
     ELSE
        nMeses  := INT(MIN(DIV(oNm:dHasta-FECHA_ING,30),12))
        nDias:=(CNS(057)/12)*nMeses
     ENDIF
 VARIAC :=NDIAS   //TABDIAADI+1
 nResult:=VARIAC*nSalario
ENDIF
RETURN nResult
// EOF

