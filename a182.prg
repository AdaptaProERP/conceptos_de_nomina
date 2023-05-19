FUNCTION A182(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario:=0,nDias:=0,dFecha,nMeses:=0,nAnos:=0,nBono:=0,cAnt

  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA$[RI]
    IF oDp:lConstruccion
       nResult // Preguntar si Calcula el monto del Bono Vacacional fraccionado
    ELSE
     dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta)    // Determina Aniversario

     IF oDp:lColectiva .AND. !EMPTY(FECHA_VAC)
        dFecha:=FECHA_FIN
     ENDIF

     dFecha  :=MAX(dFecha,FECHA_ING)             // No puede se Mayor que FCH_INGRESO

      IF dFecha>oNm:dHasta
       dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta-360)    // Determina Aniversario
      ENDIF

     nMeses  :=MESES(dFecha,oNm:dHasta)          // Determina Cuantos Meses han Transcurrido

     cAnt    :=ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,0,0) // Determina los A_os de Antiguedad

     IF nAnos>1
        nAnos:=nAnos-1
        nDias:=nAnos+CNS(057)
     ELSE
        nDias:=CNS(057)
     ENDIF

     nDias   :=MAX(nDias,CNS(91))   // Dias ofertados por el Patrono

     IF CNS(91)<CNS(60) // El Patrono Paga M~s
        nDias   :=MIN(nDias,CNS(60))   // Compara con el Tope,Tope Bono Vacacional
     ENDIF

     nBono   :=MAX(CNS(57),CNS(91)) // nBono

     nSalario:=FUNCION(3)
     VARIAC  :=DIV(nDias,12)*nMeses
     nResult :=VARIAC*nSalario

     IF oNm:lPrenomina

        VARMEMO :="Diario="+ALLTRIM(STR(nSalario))+", Meses="+STR(nMeses,2)+;
                   ", Adic x A_os="+STR(nAnos,2)+" Bono.Vac="+STR(VARIAC,2)+CRLF+;
                   ", DÑas por A_o:"+STR(nBono,2,0)+",Antiguedad: "+cAnt+CRLF+;
                   "Fecha Base: "+DTOC(dFecha)+"  Vacaci©n:  "+;
                   IIF(oDp:lColectiva,"Colectiva","Individual")

        IF !EMPTY(FECHA_VAC)
           VARMEMO:=VARMEMO+CRLF+"Ultima Vacaci©n: "+DTOC(FECHA_VAC)+"-"+DTOC(FECHA_FIN)
        ENDIF

     ENDIF
    ENDIF
  ENDIF
RETURN nResult
// EOF
