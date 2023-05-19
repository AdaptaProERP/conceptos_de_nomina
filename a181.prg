FUNCTION A181(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDias:=0,nSalario:=0,nMeses:=0,nAnos:=0,dFecha

  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA$[RI]

     nDias   :=FUNCION(84) // Dias Adicinales de Disfrute
     VARIAC  :=nDias
     nSalario:=MAX(FUNCION(10),FUNCION(3))
     dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta)    // Determina Aniversario

     IF oDp:lColectiva.AND.!EMPTY(FECHA_VAC)
        dFecha:=FECHA_FIN
     ENDIF

     dFecha  :=MAX(dFecha,FECHA_ING)             // No puede se Mayor que FCH_INGRESO

     IF dFecha>oNm:dHasta
       dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta-360)    // Determina Aniversario
      ENDIF

     nMeses  :=MESES(dFecha,oNm:dHasta)          // Determina Cuantos Meses han Transcurrido

     ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,0,0) // Determina los A_os de Antiguedad

     nSalario:=FUNCION(3)

     VARIAC  :=DIV(nDias,12)*nMeses
     nResult :=VARIAC*nSalario

     IF oNm:lPrenomina

        VARMEMO :="Diario="+ALLTRIM(STR(nSalario))+", Meses="+STR(nMeses,2)+;
                   ", Años="+STR(nAnos,2)+" Bono.Vac="+STR(nDias,2)+CRLF

        IF oDp:lColectiva .AND. !EMPTY(FECHA_VAC)
           VARMEMO:=VARMEMO+"Vacacion Colectiva: "+DTOC(FECHA_VAC)+"-"+DTOC(FECHA_FIN)
        ELSE
           VARMEMO:=VARMEMO+"Fecha Base: "+DTOC(dFecha)+" "+;
                    IIF(oDp:lColectiva,"Colectiva","Individual")
        ENDIF

     ENDIF

  ENDIF
RETURN nResult
// EOF
