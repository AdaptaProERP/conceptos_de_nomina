FUNCTION A043(uPar1,uPar2,uPar3,uPar4,uPar5)
 LOCAL nResult:=0
 LOCAL nMeses,nSalario,nDias
 LOCAL dDesde,dHasta
 LOCAL nDiasHab:=0,nAdic219:=0

 IF !EMPTY(FECHA_CON) .AND. FECHA_CON<oDp:dHasta
    CONDICION:="I"
 ENDIF

 IF CONDICION=[A].AND.oNm:cOtraNom=[VC]

     IF EMPTY(oDp:dFchIniVac)
        VAROBSERV:="Falta Periodo de Vacaciones"
        RETURN 1
     ENDIF

     nAdic219:=FUNCION(84)
     nDias   :=CNS(56)+nAdic219                // Dias x A_o + Disfrute Adicional
     nMeses  :=MESES(FECHA_ING,oDp:dFchCierre) // 31/12/AAAA
     nMeses  :=MIN(nMeses,12)                  // No puede ser > 12
     nDias   :=DIV(nDias,nMeses)*12            // Cantidad de Dias en Proporci©n

     // Cuenta los dÑas que esta disrutando

     dDesde  :=FCHHABIL(oDp:dFchIniVac+1)
     dHasta  :=oDp:dFchFinVac
     nDiasHab:=DIAS_HAB(dDesde,dHasta,oTrabajador:TURNO)
     nDias   :=CNS(56)+nAdic219                // Dias x A_o + Disfrute Adicional

     IF nDias>nDiasHab
        // El Tiempo Reglamentario es mayor al Otorgado, debe ampliar la fecha de Regreso
        dHasta  :=FCHHABIL(dHasta,nDias-nDiasHab)
        nDiasHab:=DIAS_HAB(dDesde,dHasta,oTrabajador:TURNO)
     ENDIF

     VARMEMO  :="Retiro:  "  +RTRIM(CSEMANA(oDp:dFchIniVac))+" "+DTOC(oDp:dFchIniVac)+CRLF+;
                "Inicio:  "  +RTRIM(CSEMANA(dDesde        ))+" "+DTOC(dDesde        )+CRLF+;
                "Culmina: "  +RTRIM(CSEMANA(dHasta-1      ))+" "+DTOC(dHasta-1      )+CRLF+;
                "Reintegro: "+RTRIM(CSEMANA(dHasta+nAdic219))+" "+DTOC(dHasta+nAdic219)+CRLF+;
                "Días = Hábiles("+LSTR(nDiasHab)+"),"

     nDias:=MIN(nDiasHab,CNS(050))

     VARIAC   :=nDiasHab
     nSalario :=FUNCION(10)

     CREATABVAC(dDesde,dHasta,VARIAC)
     GRATABVAC("TAB_DIAFER",DIASFERIAD(dDesde,dHasta,TURNO))
     GRATABVAC("TAB_DIADES",DIAS_DESCANSO(dDesde,dHasta,TURNO))
     GRATABVAC("TAB_DIAADI",nAdic219)       // Art. 119
     GRATABVAC("TAB_DIAACU",nDias-nDiasHab) // Vacaciones Disfrutadas por Adelantado

     VARMEMO  +="Feriados("+LSTR(TABDIAFER)+"),"+;
                "Descanso("+LSTR(TABDIADES)+")"

     VARMEMO  +=CRLF+"Total Días:"+LSTR(TABDIAFER+TABDIADES+TABDIAS)

     IF TABDIAADI>0
        VARMEMO  +=CRLF+"Incluye Adic. Art.219 ("+LSTR(TABDIAADI)+") Día(s)"
        VARIAC   :=VARIAC-TABDIAADI
     ENDIF

     IF nMeses<12
        VARIAC:=DIV(nDias,12)*nMeses      // Cantidad de Dias en Proporci©n
     ELSE
        VARIAC  :=nDias
     ENDIF

     nResult :=VARIAC*nSalario

  ENDIF

RETURN nResult
// EOF
