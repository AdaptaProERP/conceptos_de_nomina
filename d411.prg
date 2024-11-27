FUNCTION D411(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,lAniver:=.F.,dDesde,dHasta

  // Solo Destino Contabilidad
  IF DESTINO_PR="B"
    RETURN 0
  ENDIF

  dDesde:=oNm:dDesde
  dHasta:=oNm:dHasta

  IF oDp:lAniverInt .AND. oNm:cTipoNom$"SQM" .AND. QUINCE() .AND. .F.
     dHasta:=FCHINIMES(dDesde)-1
     dDesde:=FCHINIMES(dHasta)
  ENDIF

  lAniver:=ANIVERSARIO(FECHA_ING,dDesde,dHasta)

  IF CONDICION=[A] .AND. (oNm:cOtraNom$[IN,AL] .OR. (oNm:cOtraNom=[LI].AND.TABLALIQ())) .OR. ;
     (oDp:lAniverInt.AND.lAniver.AND.oNm:cTipoNom$"SQM")
     nResult:=ACUMC_FCH("A411",FECHA_ING,-1)
    // nResult:=ACUMC_FCH("A411",FECHA_ING,dHasta)
  ENDIF

RETURN nResult
// <EOF>
/*
Se aplica cuando el trabajador finalice la relación laboral y se utiliza como contrapeso
del concepto A411.

Obtiene el total de intereses pagados en "A411" desde la fecha de ingreso del trabajador
 hasta la fecha final del ejercicio y permite restar del pago el total de intereses cobrados 
anteriormente por el trabajador, logrando así obtener el neto por concepto de intereses
 sobre Art.108.

/*