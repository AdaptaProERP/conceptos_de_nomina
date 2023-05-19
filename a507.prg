FUNCTION A507(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nDiasIna:=0,nResult2:=0,nResult3:=0,nResult4:=0,nResult5:=0,nResult6:=0,nResult7:=0,nResult8:=0,nResult9:=0,nResult10:=0,nDiasIna2:=0,nResult11:=0,nResult12:=0,nResult13:=0,nResult14:=0,nResult15:=0,nResult16:=0, nAus:=0,nResult35:=0
  LOCAL nResult17:=0,nResult18:=0,nResult19:=0,nResult20:=0,nResult21:=0,nResult22:=0,vaca:=0,nResult23:=0,nResult24:=0,nResult25:=0,nResult26:=0,nResult27:=0,nResult28:=0,nResult29:=0,nResult30:=0,nResult31:=0,nResult32:=0,nResult33:=0,nResult34:=0
  LOCAL nResult36:=0,nResult37:=0

   nDiasIna:=VARPRE("D001")+VARPRE("D010")+VARPRE("D011")+(VARPRE("D018")/8)
//+VARPRE("D008") sin efecto "temporal" 27/12/16

   nDiasIna2:=VARPRE("D002")

   vaca:=C_A002/(SALARIO/30)

IF vaca>9

  IF  nDiasIna<CNS(028) .AND. C_A002>0

      IF C_A002>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DE SALARIO QUINCENAL
          nResult7:= C_A002/11*1

      ENDIF

      IF C_A004>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DE LA HORA EXTRA DIURNA QUINCENAL
          nResult8:= C_A004/11*1

      ENDIF

      IF C_A005>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DE FERIADO TRABAJADO QUINCENAL
          nResult9:= C_A005/11*1
      ENDIF

      IF C_A009>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DE BONO DE ASISTENCIA QUINCENAL
          nResult10:= C_A009/11*1
      ENDIF

      IF C_A006>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DE BONO NOCTURNO
          nResult16:= C_A006/11*1
      ENDIF

      IF C_A010>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DEL FERIADO TRABAJADO
          nResult17:= C_A010/11*1
      ENDIF

      IF C_A013>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DEL BONO CUMPLEAÑOS
          nResult19:= C_A013/11*1
      ENDIF

      IF C_A019>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult21:= C_A019/11*1
      ENDIF

//
     IF C_A022>0 .AND. nDiasIna<CNS(28)
         10  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
         nResult34:= C_A022/11*1
     ENDIF
//
      IF C_A503>0 .AND. nDiasIna2<CNS(028)
          10  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult37:= C_A503/11*1
      ENDIF


     IF C_A017>0 .AND. nDiasIna<CNS(28)
         10  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
         nResult36:= C_A017/11*1
     ENDIF


  ENDIF

  IF  nDiasIna2<CNS(028) .AND. C_A002>0 .AND. nDiasIna<CNS(028)

      IF C_A002>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DE SALARIO QUINCENAL
          nResult11:= C_A002/11*1

      ENDIF

      IF C_A004>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DE LA HORA EXTRA DIURNA QUINCENAL
          nResult12:= C_A004/11*1

      ENDIF

      IF C_A005>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DE FERIADO TRABAJADO QUINCENAL
          nResult13:= C_A005/11*1
      ENDIF

      IF C_A009>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DE BONO DE ASISTENCIA QUINCENAL
          nResult14:= C_A009/11*1
      ENDIF

      IF C_A006>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DE BONO NOCTURNO
          nResult15:= C_A006/11*1
      ENDIF

      IF C_A010>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DEL FERIADO TRABAJADO
          nResult18:= C_A010/11*1
      ENDIF

      IF C_A013>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DEL BONO CUMPLEAÑOS
          nResult20:= C_A013/11*1
      ENDIF

      IF C_A019>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult22:= C_A019/11*1
      ENDIF

      IF C_A503>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult31:= C_A503/11*1
      ENDIF

      IF C_A504>0 .AND. nDiasIna2<CNS(028)
          11  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult32:= C_A504/11*2
      ENDIF

//
     IF C_A022>0 .AND. nDiasIna<CNS(28)
         11  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
         nResult33:= C_A022/11*1
     ENDIF
//

     IF C_A017>0 .AND. nDiasIna<CNS(28)
         11  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
         nResult35:= C_A017/11*1
     ENDIF



  ENDIF

ENDIF

IF vaca>=5 .AND. vaca<=9

  IF  nDiasIna<CNS(028) .AND. C_A002>0

      IF C_A002>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DE SALARIO QUINCENAL
          nResult23:= C_A002/11*1

      ENDIF

      IF C_A004>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DE LA HORA EXTRA DIURNA QUINCENAL
          nResult24:= C_A004/11*1

      ENDIF

      IF C_A005>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DE FERIADO TRABAJADO QUINCENAL
          nResult25:= C_A005/11*1
      ENDIF

      IF C_A009>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DE BONO DE ASISTENCIA QUINCENAL
          nResult26:= C_A009/11*1
      ENDIF

      IF C_A006>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DE BONO NOCTURNO
          nResult27:= C_A006/11*1
      ENDIF

      IF C_A010>0 .AND. nDiasIna<CNS(028)
          10  // ADICIONA VALOR DEL FERIADO TRABAJADO
          nResult28:= C_A010/11*1
      ENDIF

      IF C_A013>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DEL BONO CUMPLEAÑOS
          nResult29:= C_A013/11*1
      ENDIF

      IF C_A019>0 .AND. nDiasIna<CNS(028)
          12  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult30:= C_A019/11*1
      ENDIF

      IF C_A503>0 .AND. nDiasIna2<CNS(028)
          12  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult31:= C_A503/11*1
      ENDIF

      IF C_A504>0 .AND. nDiasIna2<CNS(028)
          12  // ADICIONA VALOR DEL BONO POST VACACIONAL
          nResult32:= C_A504/11*1
      ENDIF
//
     IF C_A022>0 .AND. nDiasIna<CNS(28)
         12  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
         nResult33:= C_A022/11*1
     ENDIF
//

     IF C_A017>0 .AND. nDiasIna<CNS(28)
         12  // ADICIONA VALOR DE LA HORA EXTRA DIURNA
         nResult35:= C_A017/11*1
     ENDIF




  ENDIF

ENDIF

IF nDiasIna > 0
  10 //aus
  nAus:=((C_A002/11)/11)*2*nDiasIna
ENDIF
IF VARPRE("D008") > 0
  nAus:=CNS(51)/5
ENDIF

nResult:=nResult7+nResult8+nResult9+nResult10+nResult11+nResult12+nResult35+nResult36+nResult37-nAus
nResult:=nResult+nResult13+nResult14+nResult15+nResult16+nResult17+nResult18+nResult19+nResult20+nResult21+nResult22+nResult23+nResult24
nResult:=nResult+nResult25+nResult26+nResult27+nResult28+nResult29+nResult30+nResult31+nResult32+nResult33+nResult34
RETURN nResult
//7+nResult8+nResult9+nResult10+nResult11+nResult12+nResult13+nResult14+nResult15+nResult16+nResult17+nResult18+nResult19+nResult20+nResult21+nResult22+nResult23+nResult24+nResult25+nResult26+nResult27+nResult28+nResult29+nResult30+nResult31+nResult32
// EOF
