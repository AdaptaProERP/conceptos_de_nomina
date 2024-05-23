FUNCTION N001(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF !oDp:lI_Prestm
     RETURN 0
  ENDIF

  IF CONDICION=[A] .AND. oNm:cOtraNom=[PR] .AND. oDp:lI_Prestm
     lVariac:=.T.
  ENDIF
RETURN VARIAC
// EOF
