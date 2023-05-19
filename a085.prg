FUNCTION A085(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0
  IF CONDICION=[A].AND.((oNm:cOtraNom=[VI].AND.TABLAVAC()).OR.;
     (oNm:cOtraNom=[LI].AND.TABLALIQ()).OR.oNm:cOtraNom=[VC])
     nSalario:=FUNCION(10) // MAX(FUNCION(30),FUNCION(3))
     IF oNm:cOtraNom=[VI]  // Vacaci©n Individual
       VARIAC:=TABDIAPEN   // DÑas Pendientes por Disfrutar
     ELSE
       // Si es liquidado recupera las vacaciones acumuladas
       VARIAC :=IIF(!VARIAC=0,VARIAC,FUNCION(85))
       lVariac:=.F.
     ENDIF
     nResult:=nSalario*VARIAC
  ENDIF
RETURN nResult
// EOF
