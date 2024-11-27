FUNCTION F006(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nLun
  LOCAL dDesde,dHasta   //ORIGINAL ABAJO TJ

  dDesde:=MAX(oNm:dDesde,FECHA_ING)
  dHasta:=oNm:dHasta

  // Tuvo Vacaciones, Asume la Fecha que Culmina las Vacaciones//.AND.YEAR(FECHA_VAC)=YEAR(oNm:dHasta)
    IF dHasta>=FECHA_VAC.AND.YEAR(FECHA_VAC)=YEAR(oNm:dHasta);
  .OR. dDesde>FECHA_FIN.AND.YEAR(FECHA_VAC)=YEAR(oNm:dHasta)

    IF !EMPTY(FECHA_VAC).AND.MONTH(dDesde)=MONTH(FECHA_VAC)
     dDesde:=MIN(dDesde,FECHA_VAC)
     dHasta:=FECHA_VAC-1
    ENDIF

    IF !EMPTY(FECHA_FIN).AND.MONTH(dDesde)=MONTH(FECHA_FIN)
      dDesde:=MAX(dDesde,FECHA_FIN+1)
      dHasta:=oNm:dHasta
    ENDIF
/*
    // Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_EGR)
      dHasta:=MIN(oNm:dHasta,FECHA_EGR)
    ENDIF   //JD
   // Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_CON)
      dHasta:=MIN(oNm:dHasta,FECHA_CON)
    ENDIF
*/
  ENDIF

    // Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_EGR)
      dHasta:=MIN(oNm:dHasta,FECHA_EGR)
    ENDIF   //JD
   // Si Culmina Contrato, asume la fecha de Culminacion de Contrato
    IF !EMPTY(FECHA_CON)
      dHasta:=MIN(oNm:dHasta,FECHA_CON)
    ENDIF

  // Si esta de Vacaciones
  IF oNm:cOtraNom$[VI,VC]
    dDesde:=TABDESDE
    dHasta:=TABHASTA
  ENDIF

   nResult:=NLUNES(dDesde,dHasta)


RETURN nResult
// EOF

/*
FUNCTION F006(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nLun
  LOCAL dDesde,dHasta   //ORIGINAL ABAJO TJ

  dDesde:=MAX(oNm:dDesde,FECHA_ING)
  dHasta:=oNm:dHasta

  // Tuvo Vacaciones, Asume la Fecha que Culmina las Vacaciones//.AND.YEAR(FECHA_VAC)=YEAR(oNm:dHasta)
    IF dHasta>=FECHA_VAC.AND.YEAR(FECHA_VAC)=YEAR(oNm:dHasta);
  .OR. dDesde>FECHA_FIN.AND.YEAR(FECHA_VAC)=YEAR(oNm:dHasta)

    IF !EMPTY(FECHA_VAC).AND.MONTH(dDesde)=MONTH(FECHA_VAC)
     dDesde:=MIN(dDesde,FECHA_VAC)
     dHasta:=FECHA_VAC-1
    ENDIF

    IF !EMPTY(FECHA_FIN).AND.MONTH(dDesde)=MONTH(FECHA_FIN)
      dDesde:=MAX(dDesde,FECHA_FIN+1)
      dHasta:=oNm:dHasta
    ENDIF

    // Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_EGR)
      dHasta:=MIN(oNm:dHasta,FECHA_EGR)
    ENDIF   //JD
   // Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_CON)
      dHasta:=MIN(oNm:dHasta,FECHA_CON)
    ENDIF

  ENDIF

  // Si esta de Vacaciones
  IF oNm:cOtraNom$[VI,VC]
    dDesde:=TABDESDE
    dHasta:=TABHASTA
  ENDIF

   nResult:=NLUNES(dDesde,dHasta)


RETURN nResult
// EOF

FUNCTION F006(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  LOCAL dDesde,dHasta

  dDesde:=MAX(oNm:dDesde,FECHA_ING)
  dHasta:=oNm:dHasta

  // Tuvo Vacaciones, Asume la Fecha que Culmina las Vacaciones
  IF dHasta>FECHA_VAC .OR. dDesde>FECHA_FIN

    IF !EMPTY(FECHA_VAC).AND.MONTH(dDesde)=MONTH(FECHA_VAC)
     dDesde:=MIN(dDesde,FECHA_VAC)
     dHasta:=FECHA_VAC
    ENDIF

IF !EMPTY(FECHA_FIN).AND.MONTH(dDesde)=MONTH(FECHA_FIN)
     dDesde:=MAX(dDesde,FECHA_FIN+1)
//     dHasta:=
    ENDIF

    // Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_EGR)
      dHasta:=MIN(oNm:dHasta,FECHA_EGR)
    ENDIF
//JD
// Si Egresó, asume la fecha de Egreso
    IF !EMPTY(FECHA_CON)
      dHasta:=MIN(oNm:dHasta,FECHA_CON)
    ENDIF

  ENDIF

  // Si esta de Vacaciones
  IF oNm:cOtraNom$[VI,VC]
    dDesde:=TABDESDE
    dHasta:=TABHASTA
  ENDIF

//  nFactor1:=CREAVAR("FCHX1",MAX(MAX(FECHA_ING,oNm:dDesde),FECHA_VAC))
//  nFactor2:=CREAVAR("FCHX2",MAX(MAX(FECHA_EGR,oNm:dHasta),FECHA_FIN))
//  nFactor3:=CREAVAR("FCHX1",IIF(oNm:cOtraNom$[VI,VC],TABDESDE,FCHX1))
//  nFactor4:=CREAVAR("FCHX2",IIF(oNm:cOtraNom$[VI,VC],TABHASTA,FCHX2))
   nResult:=NLUNES(dDesde,dHasta)

RETURN nResult
//
*/
/*
Calculo de cantidad de lunes para el periodo de pago
Se toma en cuenta el perido de retorno de vacaciones, fecha de ingreso
y fecha de egreso.


/*