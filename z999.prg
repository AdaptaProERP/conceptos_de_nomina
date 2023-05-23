FUNCTION Z999(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF oNm:lActualiza .AND. oNm:cOtraNom=[LI].AND.TABLALIQ()
     GRATABLIQ("LIQ_NUMREC",oNm:cRecibo)
     GRATABLIQ("LIQ_FECHA" ,oNm:dHasta)
     GRATABLIQ("LIQ_PROCES",.T.)
     GRABARCAM("FECHA_EGR",oNm:dHasta)
     GRABARCAM("CONDICION","L")
  ENDIF

  // Actualiza Tabla de Vacaciones
  IF oNm:lActualiza .AND. oNm:cOtraNom$[LI,VC,VI] .AND. TABLAVAC()
     // Actualiza Tabla de Vacaciones
     GRATABVAC("TAB_NUMREC",oNm:cRecibo)
     GRATABVAC("TAB_FECHA" ,oNm:dHasta)
     GRATABVAC("TAB_PROCES",.T.)
     // Actualiza la Ficha del Trabajador
     GRABARCAM("FECHA_VAC",TABDESDE)
     GRABARCAM("FECHA_FIN",TABHASTA)
  ENDIF

  IF oNm:lActualiza
    EJECUTAR("NMRECSALARIO",oTrabajador:CODIGO,oNm:dHasta)
  ENDIF

RETURN 0
// EOF
