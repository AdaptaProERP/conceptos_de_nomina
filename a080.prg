FUNCTION A080(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0

  IF CONDICION=[A] .AND. oNm:cOtraNom=[VI] .AND. TABLAVAC()
     VAROBSERV:="Antiguedad: "+ANTIGUEDAD(FECHA_ING)
     VARMEMO  :="Reintegro:"+ALLTRIM(CSEMANA(TABFCHREI))+"/"+DTOC(TABFCHREI)+CRLF+;
                "Periodo: "+DTOC(TABDESDE)+" HASTA "+DTOC(TABHASTA)
     nSalario :=MAX(FUNCION(10),FUNCION(3))
     VARIAC   :=TABDIAVAC
     oNm:nDias:=TABDIAVAC // TABDIAS          // Utilizado por Caja y/o Fondo de Ahorro
     nResult  :=nSalario*VARIAC
  ENDIF

RETURN nResult
// EOF
