FUNCTION P004(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
  LOCAL nResult:=0,nSalario,nDias,nMeses,nAnos,dHasta

  dHasta:=CTOD("31/12/"+STRZERO(YEAR(oDp:dFecha)))
  nMeses:=MESES(MAX(FECHA_ING,CNS(82)),dHasta) // Ingreso Vs R'gimen

  IF C_P001>0 .AND. nMeses>3

     nAnos    :=INT(DIV(nMeses,12))
     nMeses   :=MIN(12,nMeses)

     IF nAnos<=1
        nMeses:=nMeses-3
     ENDIF

     nSalario :=FUNCION(3)+ DIV(C_P002+C_P003,360)

     nDias    :=nMeses*5

     IF nAnos>=2 .AND. nAnos<16
        nAnos:=IIF(nAnos=2,2,(nAnos-1)*2)  // Suma Dos Dias por A_o Adicional
        nAnos:=MIN(nAnos,15) // No debe pasar de 15 Dias Adicionales
     ELSE
        nAnos:=0
     ENDIF

     nDias   :=nDias+nAnos
     nResult :=nSalario*nDias
     VARIAC  :=nDias

  ENDIF

RETURN nResult
// <EOF>
/*


/*