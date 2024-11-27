FUNCTION P003(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
  LOCAL nResult:=0,nDias:=0,nSalario:=0,nMeses:=0,nAnos:=0,dHasta

  IF C_P001>0

     nMeses  :=MESES(MAX(FCHINICIO,FECHA_ING),oNm:dHasta+1) // Cuantos Meses Transcurridos
     nSalario:=FUNCION(3)
     nDias   :=DIV(nMeses,12)*CNS(52)
     VARIAC  :=nDias
     IF oNm:lPrenomina
         VAROBSERV:="Días por Año="+STR(CNS(52),3)+" Entre "+STR(nMeses,2)+" Meses,"+;
                    ",Salario="+ALLTRIM(STR(nSalario,14,2))
     ENDIF
    nResult :=nSalario*nDias

  ENDIF

RETURN nResult
// <EOF>
/*


/*