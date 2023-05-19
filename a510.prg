FUNCTION A503(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nResult1:=0,nDiasIna:=0,nDiasIna2:=0

   nDiasIna:=VARPRE("D001")

   nDiasIna2:=VARPRE("D002")


  IF CONDICION=[A] .AND. nDiasIna>1 .OR. nDiasIna2>1
     nFactor1:= C_A026*1.5
     lVariac:=.T.
     nResult:=VARIAC* nFactor1
  ELSE
      //
  ENDIF

  IF CONDICION=[A] .AND. nDiasIna<2 .AND. nDiasIna2<2
     nFactor2:= C_A026*1.5/2
     lVariac:=.T.
     nResult1:=VARIAC* nFactor2
  ELSE
      //
  ENDIF


RETURN nResult+nResult1
// EOF
