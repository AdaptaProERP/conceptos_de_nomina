FUNCTION A031(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nCuota,cNumero:="",nTasa:=0

  IF CONDICION=[A].AND.(oNm:cOtraNom=[PR].OR.oNm:cOtraNom=[DI])

     lVariac:=.T.
     nCuota :=VARPRE("N031")
     nTasa  :=VARPRE("N001")
     nResult:=CREATABPRES(VARIAC,nCuota,nTasa,@cNumero,"A031 Pr�stamo Otros")

     IF !EMPTY(cNumero)
       VAROBSERV:="Pr�stamo: "+cNumero+" Tasa: "+ALLTRIM(STR(nTasa))+"%"
     ENDIF

  ENDIF

RETURN nResult
// EOF
