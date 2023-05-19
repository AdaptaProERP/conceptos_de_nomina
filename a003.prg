FUNCTION A003(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,nDias,DH,DF,DNH,dM,nDiasv
LOCAL ffv
IF CONDICION$[A]
     IF MONTH(oNm:dHasta)=MONTH(FECHA_VAC)
        nDiasv:=DIAS_HAB(FECHA_VAC,FECHA_FIN)+DIAS_NOHAB(FECHA_VAC,FECHA_FIN)
        nDias:=MIN(DIAS_TRAB(30),30)   //-nDiasv
     ELSE
        nDias:=MIN(DIAS_TRAB(30),30)
     ENDIF
     IF MONTH(FECHA_ING)=2 .AND. DAY(FECHA_ING) =1.AND.MONTH(oNm:dHasta)=2;
                           .AND. YEAR(FECHA_ING)=YEAR(oNm:dHasta)
        nDias:=30
     ENDIF
     //VALIDA SI ES TRABAJADOR INGRESA CUALQUIER DIA DE FEBRERO DIFERENTE A 1
     IF MONTH(FECHA_ING)=2 .AND. DAY(FECHA_ING)>=2.AND.MONTH(oNm:dHasta)=2;
                           .AND. YEAR(FECHA_ING)=YEAR(oNm:dHasta)
        IF DAY(oNm:dHasta)=28
           dM:=2
        ENDIF
        IF DAY(oNm:dHasta)=29
           dM:=1
        ENDIF
        nDias:=MIN(DIAS_TRAB(30),30)+dM
        CREAVAR("VARIAC",nDias)
        oNm:nDias:=nDias     // Necesario para H350
        lVariac:=.F.
        nResult:=FUNCION(3)*VARIAC
        RETURN nResult
     ENDIF
     //VALIDA SI ES TRABAJADOR SE VA DE VACACIONES PARA QUE AL REGRESO LE CANCELE LO
     //CORRESPONDIENTE
     IF MONTH(oNm:dHasta)=2 .AND. MONTH(FECHA_FIN)=2 .AND.YEAR(FECHA_FIN)=YEAR(oNm:dHasta)
                            //.AND. MONTH(FECHA_FIN)=2
        IF DAY(oNm:dHasta)=28
           dM:=2
        ENDIF
        IF DAY(oNm:dHasta)=29
           dM:=1
        ENDIF
        DH:=DIAS_HAB(FECHA_FIN+1,oNm:dHasta)+2
        DNH:=DIAS_NOHAB(FECHA_FIN+1,oNm:dHasta)
        nDias:=DH+DNH // Segunda Quincena de Febrero
     ELSE
         IF MONTH(oNm:dHasta)=2 .AND. MONTH(FECHA_FIN)<>3.AND.YEAR(oNm:dHasta)=YEAR(oNm:dHasta)
         nDias:=30
         ENDIF
     ENDIF
     CREAVAR("VARIAC",nDias)
     oNm:nDias:=nDias     // Necesario para H350
     lVariac:=.F.
     nResult:=FUNCION(3)*VARIAC
  ENDIF
RETURN nResult
// EOF

/*
FUNCTION A003(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDias
  IF CONDICION$[AL]
     nDias:=MIN(DIAS_TRAB(30),30)
     IF MONTH(FECHA_ING)=2 .AND. DAY(FECHA_ING) =1.AND.MONTH(oNm:dHasta)=2;
                           .AND. YEAR(FECHA_ING)=YEAR(oNm:dHasta)
        nDias:=30
     ENDIF
     CREAVAR("VARIAC",nDias)
     oNm:nDias:=nDias     // Necesario para H350
     lVariac:=.T.
     nResult:=FUNCION(3)*VARIAC
    // nResult  :=nResult-PORCEN(nResult,PORATIPICO) // Resta Salario At­pico

  ENDIF

RETURN nResult
// EOF
*/
