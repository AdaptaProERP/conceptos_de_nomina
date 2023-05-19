FUNCTION A042(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario,nAnos,dFecha,nMeses:=0

  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA$[RI].AND.FECHA_ING<oNm:dHasta
    IF oDp:lConstruccion
        VARIAC:=EJECUTAR("NMBUSCATABANT",FECHA_ING , oDp:dFecha, 3)
        nSalario:=FUNCION(3)
        nResult:=VARIAC*nSalario
    ELSE
     dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta)    // Determina Aniversario

     dFecha  :=MAX(dFecha,FECHA_ING)             // No puede se Mayor que FCH_INGRESO

      IF dFecha>oNm:dHasta
       dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta-360)    // Determina Aniversario
      ENDIF

     IF oDp:lColectiva .AND. !EMPTY(FECHA_FIN)
         dFecha:=FECHA_FIN
     ENDIF

     nMeses  :=MESES(dFecha,oNm:dHasta)          // Determina Cuantos Meses han Transcurrido
//     ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,0,0) // Determina los A_os de Antiguedad
//     nAnos   :=0
//     IF nAnos>1
//        nAnos=MIN(nAnos-1,7)
//     ENDIF

     nSalario:=FUNCION(3)
     VARIAC  :=DIV(CNS(50)+nAnos,12)*nMeses
     nResult :=VARIAC*nSalario
     IF oNm:lPrenomina
        VARMEMO:="Vacaciones: "+IIF(oDp:lColectiva,"Colectiva","Individual")+" ("+;
                 IIF(!EMPTY(FECHA_VAC),DTOC(FECHA_VAC)+"-"+DTOC(FECHA_FIN),"")+")"+CRLF+;
                 "Aniversario: "+DTOC(dFecha)+CRLF+;
                 "Diario="+ALLTRIM(STR(nSalario))+", Vacación Anual="+STR(CNS(50),2)+CRLF+;
                 ",Días/Vac="+STR(CNS(50)+nAnos,2)+" Entre:"+STR(nMeses,2)+" Meses "+CRLF+;
                 "Días Adicionales en A181"

     ENDIF
    ENDIF
  ENDIF
RETURN nResult
// EOF

/*
FUNCTION A042(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario,nAnos,dFecha,nMeses,dFechaA,dFechaE,nMeses1:=0,nDias
  LOCAL FI,NMESESX:=0,DI,DD,vf,vd,na,nm

  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA$[RI].AND.FECHA_ING<oNm:dHasta

    dFecha  :=MAX(dFecha,FECHA_ING)
    nMesesX  :=MESES(dFecha,oNm:dHasta)

    dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta)    // Determina Aniversario

    IF dFecha>oNm:dHasta
       dFecha  :=FCHANUAL(FECHA_ING,oNm:dHasta-360)    // Determina Aniversario
    ENDIF

MensajeErr(DTOC(oNm:dHasta))

    dFecha  :=MAX(dFecha,FECHA_ING)             // No puede se Mayor que FCH_INGRESO

     IF oDp:lColectiva .AND. !EMPTY(FECHA_FIN)
         dFecha:=FECHA_FIN
     ENDIF


     nMeses1  :=MESES(dFecha,oNm:dHasta)          // Determina Cuantos Meses han Transcurrido

     nMeses  :=MESES(dFecha,oNm:dHasta)          // Determina Cuantos Meses han Transcurrido
//     ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,0,0) // Determina los A_os de Antiguedad
//     nAnos   :=0
//     IF nAnos>1
//        nAnos=MIN(nAnos-1,7)
//     ENDIF
     nSalario:=PROMEDIO_D(FCHINICIO,oNm:dHasta)
     nSalario:=FUNCION(3)
     VARIAC  :=DIV(CNS(50)+nAnos,12)*nMeses
     nResult :=VARIAC*nSalario
     IF oNm:lPrenomina
        VARMEMO:="Vacaciones: "+IIF(oDp:lColectiva,"Colectiva","Individual")+" ("+;
                 IIF(!EMPTY(FECHA_VAC),DTOC(FECHA_VAC)+"-"+DTOC(FECHA_FIN),"")+")"+CRLF+;
                 "Aniversario: "+DTOC(dFecha)+CRLF+;
                 "Diario="+ALLTRIM(STR(nSalario))+", Vacaci©n Anual="+STR(CNS(50),2)+CRLF+;
                 ",DÑas/Vac="+STR(CNS(50)+nAnos,2)+" Entre:"+STR(nMeses,2)+" Meses "+CRLF+;
                 "DÑas Adicionales en A181"

     ENDIF
  ENDIF
RETURN nResult
// EOF
*/
