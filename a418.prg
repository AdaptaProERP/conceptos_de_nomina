FUNCTION A418(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,aData:={},nAt:=0,nSalario:=0,nMeses:=0,nTope:=0,nAnos:=0,nDias:=0
  LOCAL nDiasx:=0,A

  IF oDp:lArt104
    RETURN 0
  ENDIF


  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA=[I].AND.FECHA_ING<oNm:dHasta

     // Adicionalmente  el trabajador  recibira  una indemnizacion
     // sustitutiva del preaviso previsto en el articulo 104 de es
     // ta Ley, en los siguientes montos y condiciones:

     AADD(aData,{ 02 , 06 , 15})
     AADD(aData,{ 07 , 11 , 30})
     AADD(aData,{ 12 , 23 , 45})
     AADD(aData,{ 24 ,119 , 60})
     AADD(aData,{120 ,999 , 90})

     nSalario:=MAX(FUNCION(10),FUNCION(3))
     nTope   :=DIV(CNS(26)*10,30) // No puede ser Superior a 10 Salarios Minimos
     nSalario:=MIN(nTope,nSalario)
     ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,@nMeses,@nDias)

     nMeses  :=INT(MESES(FECHA_ING,oNm:dHasta))
     nAt     :=ASCAN(aData,{|a,n|nMeses>=a[1].and.nMeses<=a[2]})

    //otra FORMA
    IF nMeses>=3 .AND. nMeses<=6
        nDiasx:=15
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

     IF nMeses>=6 .AND. nDias>0
          nDiasx:=30
         //  VARMEMO+=CRLF+" Meses "+STR(nMeses,2)+", Fracci¢n Superior a Seis Meses."+CRLF+;
         //       " Llevado a "+STR(nAnos,2)+" A¤o(s) x 30 D¡as "
         //" es Igual  a "+STR(nDias,3)+" D¡as"
     ENDIF

     IF nAnos>=1 .AND. nAnos<=2
        nDiasx:=45
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

     IF nAnos>=2 .AND. nAnos<=10
        nDiasx:=60
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

    IF nAnos>10     // .AND. nAnos<=10

        A:=90
        nDiasx:=90
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF


    VARIAC:=nDiasx

   //HASTA AQUI


     nResult:=VARIAC*nSalario

  ENDIF

RETURN nResult
// EOF
