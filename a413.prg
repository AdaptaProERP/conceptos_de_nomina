FUNCTION A413(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nMeses:=0, nSalario

  IF DESTINO_PR<>[B] .AND. CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ()       .AND.FECHA_ING<oNm:dHasta

  IF oDp:lConstruccion
     nSalario:=FUNCION(22)
     VARIAC:=EJECUTAR("NMBUSCATABANT",FECHA_ING , oDp:Fecha, 2)
     nResult:=VARIAC*nSalario

  ELSE

     nResult  :=ACUMC_FCH("H400,A415")
     VARIAC   :=ACUMV_FCH("H400")
  ENDIF
     VAROBSERV:="Motivo : "+SAYOPTIONS("NMTABLIQ","LIQ_CAUSA",oNMTABLIQ:LIQ_CAUSA)
  ENDIF
RETURN nResult
// EOF
