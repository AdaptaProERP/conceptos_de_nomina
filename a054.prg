FUNCTION A054(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0,nMeses:=0,nDias:=0,fIni:=0
  IF CONDICION=[A].AND.oNm:cOtraNom=[UT]
     fIni    :=FCHINICIO
     nMeses  :=MESES(MAX(FCHINICIO,FECHA_ING),oNm:dHasta+1) // Cuantos Meses Transcurridos
     nSalario:=PROMEDIO_C(FCHINICIO,oNm:dHasta)
     nSalario:=MAX(nSalario,FUNCION(3))
     nDias   :=DIV(nMeses,12)*CNS(52)
     VARIAC  :=nDias
     IF oNm:lPrenomina
         VAROBSERV:="Días por Año="+STR(CNS(52),3)+" Entre "+STR(nMeses,2)+" Meses,"+;
                    ",Salario="+ALLTRIM(STR(nSalario,14,2))
     ENDIF
    nResult :=nSalario*nDias
  ENDIF
RETURN nResult
// EOF
