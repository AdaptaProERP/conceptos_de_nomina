FUNCTION H400(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nSalario,nDias,nMeses,nAnos,nDias

  IF CONDICION=[A] .AND. oNm:cOtraNom=[DI] // Asume el Valor de N400
     VARIAC:=CONCEPTO("N401") // Días
     RETURN CONCEPTO("N400")
  ENDIF

  IF ACUMC_MES("H400")>0
     Return 0
  ENDIF

  IF oDp:lConstruccion
     // JN 25/11/2010

     nDias   :=EJECUTAR("NMBUSCATABANT",FECHA_ING , oDp:dFecha, 2) - ACUMV_FCH("H400")
     nSalario:=FUNCION(022)
     nResult :=(nSalario*nDias)-ACUMC_FCH("H400")
     VARIAC  :=nDias

     RETURN nResult

  ENDIF

  nMeses:=MESES(FECHA_ING,oNm:dHasta) // Cantidad de Meses

  IF (CONDICION=[A].AND.nMeses>3 .AND.;
             oNm:dHasta>=CNS(82) .AND. FINMES()) .OR. (oNm:cOtraNom$"VC,VI")

     nMeses   :=MESES(MAX(FECHA_ING,CNS(82)),oNm:dHasta) // Ingreso Vs R'gimen
     nAnos    :=DIV(nMeses,12)
     nSalario :=C_H354  // Salario Integral PROMEDIO(oDp:cSalPres,oNm:dHasta,.T.) // Calcula Salario Integral

     IF Empty(nSalario) // Puede no existir Acumulados en la Primera Pren÷mina
        nSalario:=DIV(oNm:nPromedioB,oNm:nDias)
        // Esta es Otra Forma
        // nSalario :=IIF(TIPO_NOM!="S",DIV(SALARIO,30),SALARIO)
        // nSalario+=DIV(nSalario*CNS(52),360)       // Debe sumarle la Alicuota de Utilidades
     Endif

     nAnos   :=INT(DIV(MESES(MAX(FECHA_ING,CNS(82)),oNm:dHasta),12))

     IF nAnos>=2 .AND. nAnos<16 .AND. !oDp:lArt108Adi
        nAnos:=IIF(nAnos=2,2,(nAnos-1)*2)  // Suma Dos Dias por Año Adicional
        nAnos:=MIN(nAnos,30) // No debe pasar de 15 Dias Adicionales
        // Esta condicion indica sumar los dos días adicionales
        IF !oDp:lDistAnosA .AND. !ANIVERSARIO(FECHA_ING,FCHINIMES(oNm:dDesde),oNm:dHasta)
           nAnos:=0
        ENDIF
     ELSE
        nAnos:=0
    ENDIF

    // Esta pagando los Dias Adicionales en Concepto A101
//    IF C_A101>0 .OR. ACUMC_FCH("A101")>0
//       nAnos:=0
//    ENDIF

    IF oDp:lDistAnosA // Distribuir Años Adicionales
        nDias   :=INT(DIV(CNS(61)+nAnos,12)*100)/100
    ELSE
        nDias   :=INT(DIV(CNS(61),12)*100)/100
        nDias   :=nDias+nAnos
        nAnos   :=0
    ENDIF

    nDias   :=MIN(nDias,30)
    nResult :=nSalario*nDias
    VARIAC  :=nDias

  ENDIF

RETURN nResult
//EOF
