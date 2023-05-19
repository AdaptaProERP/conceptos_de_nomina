FUNCTION A101(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario,nDias:=0,nMeses:=0,nAnos:=0,cAnt:="",dDesde,dHasta

  dDesde:=oNm:dDesde
  dHasta:=oNm:dHasta

  IF oNm:dHasta>=CNS(82) .AND. oDp:lArt108Adi .AND. FINMES() .AND. CONDICION="A" .AND. ANIVERSARIO(FECHA_ING,FCHINIMES(dDesde),dHasta)

     cAnt     :=ANTIGUEDAD(FECHA_ING,FCHFINMES(oNm:dHasta),@nAnos,@nMeses,@nDias) // Determina la Cantidad de A_os y Meses
     nSalario :=FUNCION(3) // Salario Normal

     IF nAnos>=2 .AND. nAnos<16
        VAROBSERV:="Antigüedad "+STR(nAnos,2,0)+" Años"
        nAnos    :=IIF(nAnos=2,2,(nAnos-1)*2)  // Suma Dos Dias por A_o Adicional
        nAnos    :=MIN(nAnos,30) // No debe pasar de 15 Dias Adicionales
     ELSE
        nAnos:=0
     ENDIF

     VARIAC:=nAnos
     nResult :=nSalario*nAnos

  ENDIF

RETURN nResult
// Versión Corregida por Jesús Santiago
//EOF
