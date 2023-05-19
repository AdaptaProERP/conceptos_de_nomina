FUNCTION A064(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario,nMeses


  // Utilidades Diferidas
  IF CONDICION=[L].AND.oNm:cOtraNom=[UD]
     VARIAC :=ACUMV_FCH("N064")
     nResult:=ACUMC_FCH("N064")-ACUMC_FCH("A064")
     RETURN nResult
  ENDIF

  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ()
    IF oDp:lConstruccion
       nSalario:=FUNCION(10) // SALARIO PROMEDIO
       VARIAC:=EJECUTAR("NMBUSCATABANT",FECHA_ING , oDp:dFecha, 4)
       nResult:=VARIAC*nSalario
    ELSE
     nMeses  :=MESES(MAX(FECHA_ING,FCHINICIO),oNm:dHasta)
     VARIAC  :=DIV(CNS(52),12)*nMeses
     nSalario:=PROMEDIO_C(FCHINICIO,oNm:dHasta)
     nSalario:=MAX(nSalario,FUNCION(3))

     IF oNm:lPrenomina

         VAROBSERV:="Días por Año="+STR(CNS(52),3)+" Entre "+STR(nMeses,2)+" Meses,"+;
                    "Salario="+ALLTRIM(STR(nSalario,14,2))
     ENDIF

     nResult:=VARIAC*nSalario

     // Diferir Utilidades para Liquidaci©n

     IF oDp:lUtilDif
        CREAVARCON("N064",VARIAC,VAROBSERV)
        nResult:=0
     ENDIF

  ENDIF
ENDIF
RETURN nResult
// EOF
