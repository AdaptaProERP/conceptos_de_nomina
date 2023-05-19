FUNCTION A044(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario,nDias,dDesde,dHasta,nContar,nMeses:=0,dFchFin

  IF CONDICION=[A].AND. (oNm:cOtraNom=[VC].OR.oNm:cOtraNom=[DI])

     IF oNm:cOtraNom=[DI] // Datos Iniciales
        lVariac:=.T.
        nResult:=VARIAC
        RETURN nResult
     ENDIF

     // Vacaciones Colectivas
     TABLAVAC()
     VARIAC   :=TABDIAACU
     nSalario :=FUNCION(10)
     nMeses   :=MESES(FECHA_ING,oDp:dFchCierre) // 31/12/AAAA
     VARMEMO  :=LSTR(nMeses)+" Mes(es) de Antiguedad"+CRLF+;
                ""
     nResult  :=VARIAC*nSalario

/*
     MensajeErr(TABDIAACU,"TAB_DIAACU") // Vacaciones Disfrutadas por Adelantado

     nDias   :=CNS(56)+FUNCION(84)             // Dias x A_o + Disfrute Adicional
     nMeses  :=MESES(FECHA_ING,oDp:dFchCierre) // 31/12/AAAA

     IF nMeses>=12 // Tiene m~s de un A_o
       RETURN 0
     ENDIF

     nMeses  :=MIN(nMeses,12)                  // No puede ser > 12
     nDias   :=DIV(nDias,nMeses)*12            // Cantidad de Dias en Proporci©n

     dDesde  :=FCHHABIL(CNS(53))
     dHasta  :=dDesde                          // Fecha Real de Disfrute

     // Determina el Periodo Reglamentario como Vacaciones Individuales
     WHILE nContar<nDias
       IF DIAS_HAB(dHasta,dHasta,oTrabajador:TURNO,NIL)>0
         nContar++
       ENDIF
       dHasta++
     ENDDO

     dFchFin  :=FCHHABIL(CNS(54))             // Regreso de Vacaciones
     VARIAC   :=dFchFin-dHasta

     IF VARIAC<1
       GRATABVAC("TAB_DIAACU",ABS(VARIAC))
       VARIAC:=0
     ENDIF

     nSalario :=FUNCION(10)
     nResult  :=VARIAC*nSalario
*/
  ENDIF

RETURN nResult
// EOF
