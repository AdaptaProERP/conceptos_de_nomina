FUNCTION D032(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAnos:=0,nMeses:=0,nDias:=0,nSalario:=0

  ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,@nMeses,@nDias)

  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA=[R]
   IF oDp:lConstruccion
        nSalario:=FUNCION(10)
        nDias   :=EJECUTAR("NMBUSCATABANT",FECHA_ING , oDp:dFecha, 1)
        VARIAC  :=nDias-oNMTABLIQ:LIQ_DIAPRE
        nResult :=VARIAC*nSalario
    ELSE
     nDias   :=0
     nSalario:=FUNCION(10) // Salario Promedio_C

     IF nAnos>=1
        VARIAC:=30
     ELSE
        IF nMeses>1 .AND. nMeses<6
           VARIAC:=7
        ENDIF
        IF nMeses>6.AND.nDias>=1
           VARIAC:=15
        ENDIF
     ENDIF

     VARMEMO:="Reglamentarios: "+ALLTRIM(STR(VARIAC))+" menos ("+ALLTRIM(STR(LIQDIAPRE,3));
    +") días trabajados"
     VARIAC   :=MAX(VARIAC-LIQDIAPRE,0)
     nResult :=nSalario*VARIAC

      //
   ENDIF
  ENDIF
RETURN nResult
// EOF
/*


/*