FUNCTION A419(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,aData:={},nAt:=0,nSalario:=0,nMeses:=0,nTope:=0,nAnos:=0,nDias:=0
  LOCAL nDiasx:=0
  IF CONDICION=[A].AND.oNm:cOtraNom=[LI].AND.TABLALIQ().AND.LIQCAUSA=[I].AND.FECHA_ING<oNm:dHasta

     //  debera adicionalmente a lo contemplado en  el
     //  articulo  108 de esta Ley, ademas de los salarios que hu-
     //  biere dejado de percibir durante el procedimiento, una in-
     //  demnizacion equivalente a:

     nSalario:=MAX(FUNCION(10),FUNCION(3))
     nTope   :=DIV(CNS(26)*10,30) // No puede ser Superior a 10 Salarios MÑnimos
     nSalario:=MIN(nTope,nSalario)

     ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,@nMeses,0)

     VARMEMO+=IIF(EMPTY(VARMEMO),"",CRLF+CRLF)
     VARMEMO+="Adicional Artículo 108: "+CRLF+;
              " Años : "+STR(nAnos,3)+" Meses:"+STR(nMeses,3)

      //OTRA FORMA
     // A) Diez  (10) dias de salario si la antiguedad fuere mayor
     // de tres (3) meses y no excediere de seis (6) meses.

     IF nAnos<1 .AND. nMeses>3 .AND. nMeses<=6
        nDiasx:=10
        VARMEMO+=CRLF+" Condición Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

     // B) Treinta (30) dias de salario por cada a¤o de antiguedad
     // o fraccion superior de sies (6) meses,  hasta un maximo de
     // ciento cincuenta (150) dias de salario.

    IF nAnos<1 .AND. nMeses>3 .AND. nMeses<=6
        nDiasx:=10
        VARMEMO+=CRLF+" Condición Indica en [A] Entre 3 y Menor de 6 meses"
    ENDIF

    IF nMeses>=6 .AND. nDias>0
         nDiasx:=30
         VARMEMO+=CRLF+" Condición Indica en [A] Mayor de 3 Meses y Un Dia"
    ENDIF

     IF nAnos>=1 .AND. nMeses>=6      //.AND. nDias>=1
        nDiasx:=60
        VARMEMO+=CRLF+" Condición Indica en [A] Mayor de 1 Año y 6 meses"
     ENDIF

     IF nAnos>=2 .AND. nMeses>=6 .AND. nDias>=1
        nDiasx:=90
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

     IF nAnos>=3 .AND. nMeses>=6  .AND. nDias>=1
        nDiasx:=120
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

     IF nAnos>=4 .AND. nMeses>=6 .AND. nDias>=1
        nDiasx:=150
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

     IF nAnos>=5       //.AND. nMeses>=6      //.AND. nDias>=1
        nDiasx:=150
        //VARMEMO+=CRLF+" Condici¢n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF

/*
     // A) Diez  (10) dias de salario si la antiguedad fuere mayor
     // de tres (3) meses y no excediere de seis (6) meses.
     IF nAnos<1 .AND. nMeses>3 .AND. nMeses<=6
        nDias:=10
        VARMEMO+=CRLF+" Condici©n Indica en [A] Entre 3 y Menor de 6 meses"
     ENDIF
     // B) Treinta (30) dias de salario por cada a_o de antiguedad
     // o fraccion superior de sies (6) meses,  hasta un maximo de
     // ciento cincuenta (150) dias de salario.
     IF nAnos>0 .OR. nMeses>0
        VARMEMO+=CRLF+" Condici©n Indicada en [B] 30 DÑas por A_o "
        nAnos:=nAnos+IIF(nMeses>6,1,0)
        nDias:=30*(nAnos)
        IF nMeses>6
           VARMEMO+=CRLF+" Meses "+STR(nMeses,2)+", Fracci©n Superior a Seis Meses."+CRLF+;
                         " Llevado a "+STR(nAnos,2)+" A_o(s) x 30 DÑas "
        ELSE
           VARMEMO+=CRLF+" 30 DÑas por:  "+STR(nAnos,2)+" es Igual  a "+STR(nDias,3)+" DÑas"
        ENDIF
        IF nDias>150
            nDias:=150
            VARMEMO+=CRLF+" No Debe Supera los 150 DÑas"
        ENDIF
*/
        VARIAC:=nDiasx

     //ENDIF

     nResult:=VARIAC*nSalario

  ENDIF

RETURN nResult
// EOF
