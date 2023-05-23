FUNCTION A002(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDias,nFebrero,nDiasVac:=0
  LOCAL DH,DF,DNH,dM,dDesde:=oNm:dDesde,dHasta:=oNm:dHasta

  IF CONDICION$[AL] .AND. C_A000<1

     // 22/05/2023 .AND. REPOSO(oNm:dDesde,oNm:dHasta)<=3
     // nDias   :=MIN(DIAS_TRAB(11,,,,,@nDiasVac),11)
     nDias   :=MIN(DIAS_TRAB(15,,,,,@nDiasVac),15)
     nDias   :=nDias -  nDiasVac

     IF MONTH(FECHA_ING)=2 .AND. DAY(FECHA_ING )=16 .AND. MONTH(oNm:dHasta)=2;
                           .AND. YEAR(FECHA_ING)=YEAR(oNm:dHasta)
        nDias:=11 // Segunda Quincena de Febrero
        dDesde:=FECHA_ING
     ENDIF

     IF MONTH(FECHA_FIN)=2 .AND. DAY(FECHA_FIN)>=11 .AND. MONTH(oNm:dHasta)=2;
                           .AND. YEAR(FECHA_FIN)=YEAR(oNm:dHasta).AND.FINMES
         IF DAY(oNm:dHasta)=28
            dM:=2
         ENDIF
         IF DAY(oNm:dHasta)=29
            dM:=1
         ENDIF
         DH :=DIAS_HAB(FECHA_FIN+1,oNm:dHasta)+dM
         DNH:=DIAS_NOHAB(FECHA_FIN+1,oNm:dHasta)
         nDias :=DH+DNH // Segunda Quincena de Febrero
         dHasta:=FECHA_FI
     ENDIF

     VARIAC   :=nDias
     oNm:nDias:=nDias  // Necesario en H350
     nResult  :=FUNCION(3)*VARIAC

  ENDIF

  // Sueldo Quincenal Redondeo
  IF nDias=11
     nResult:=NMROUND((SALARIO/30)*nDias,2)
  ENDIF

RETURN nResult
// EOF

/*
FUNCTION A002(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDias,nFebrero
  IF CONDICION$[AL]

     nDias   :=MIN(DIAS_TRAB(11),11)

     IF MONTH(FECHA_ING)=2 .AND. DAY(FECHA_ING )=16 .AND. MONTH(oNm:dHasta)=2;
                           .AND. YEAR(FECHA_ING)=YEAR(oNm:dHasta)
        nDias:=11 // Segunda Quincena de Febrero
     ENDIF

     VARIAC   :=nDias
     oNm:nDias:=nDias  // Necesario en H350
     nResult  :=FUNCION(3)*VARIAC

  ENDIF
RETURN nResult
// EOF
*/
