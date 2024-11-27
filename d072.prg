FUNCTION D072(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION=[A] .AND. ((oNm:cOtraNom=[VI] .AND. TABLAVAC()).OR.(oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.oNm:cOtraNom=[VC])
     nResult:=ACUMC_FCH("A045,A072,D072",FECHA_ING,TABDESDE)
  ENDIF
RETURN nResult
// EOF
/*


/*