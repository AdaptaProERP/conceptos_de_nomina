FUNCTION A025(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDiasIna:=0,nResult2:=0,nResult3:=0,nResult4:=0,nResult5:=0,nResult6:=0,nResult7:=0,nResult8:=0
  LOCAL nResult9:=0, nAus:=0

   nDiasIna:=VARPRE("A000")+VARPRE("D001")+VARPRE("D010")+VARPRE("D011")+(VARPRE("D018")-VARPRE("D008") /8)
//sin efecto "temporal" 27/12/16
// VARPRE A000 BONO POSTVACIONAL 10/04/2017
// nAus Ausencia afecta (-)  10/04/2017



  IF C_A001>0 .AND. C_A003=0 .AND. nDiasIna+(5-DIAS_TRAB(5))<CNS(27)
     oNm:nDias:=oNm:nDias+1  // Adiciona el S~bado como Dia trabajado
     nResult:=SALARIO

  ENDIF


  IF nDiasIna=0 .AND. C_A001>0 .AND. C_A003=0
     10  // ADICIONA VALOR DEL BONO DE ASISTENCIA
     nResult2:=CNS(51)/5

  ENDIF

  IF C_A003>0 .AND. nDiasIna<CNS(27)
      10  // ADICINA VALOR DEL BONO DE ASISTENCIA POST VACACIONES
      nResult3:=((SALARIO*(5-nDiasIna))+70)/(5-nDiasIna)

  ENDIF

  IF C_A004>0 .AND. nDiasIna<CNS(27)
      10  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
      nResult4:= C_A004/5

  ENDIF

  IF C_A005>0 .AND. nDiasIna<CNS(27)
      10  // ADICINA VALOR DE FERIADO TRABAJADO
      nResult5:= C_A005/5

  ENDIF

  IF C_A006>0 .AND. nDiasIna<CNS(27)
      10  // ADICIONA VALOR DE BONO NOCTURNO
      nResult6:= C_A006/5

  ENDIF

  IF C_A017>0 .AND. nDiasIna<CNS(27)
      10  // ADICIONA VALOR DE BONO NOCTURNO
      nResult7:= C_A017/5

  ENDIF

  IF C_A013>0 .AND. nDiasIna<CNS(27)
      10  // ADICIONA VALOR DE BONO POR CUMPLEAÑOS
      nResult8:= C_A013/5

  ENDIF

   IF C_A008>0 .AND. nDiasIna<CNS(27)
      10  // ADICIONA VALOR DE SALARIO RETROACTIVO
      nResult9:= C_A008/5

  ENDIF

IF C_A000>0 .AND. nDiasIna<CNS(28)
      10  // ADICIONAL VALOR DE BONO POST VACACIONAL
      nResult9:= C_A000/5

ENDIF

IF nDiasIna > 0
  nAus:=nResult/5
ENDIF

RETURN nResult+nResult2+nResult3+nResult4+nResult5+nResult6+nResult7+nResult8+nResult9-nAus
// EOF
