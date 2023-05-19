FUNCTION A416(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAnos:=0,nMeses:=0,nDias:=0,nSalario:=0,cAntg:="",nAbonados:=0
  LOCAL dDesde
// LOCAL sIntg,sv1,sint1,sintx,ci,CO,fe
// LOCAL nMonto:=0

  cAntg:=","+ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,@nMeses)

/*
  fe   :=FCHDESDE-30  //SALARIO INTEGRAL DEL MES ANTERIOR
  sIn  :=ACUMC_FCH("H354")
  sIntg:=ACUMC_MES("H354","01/01/2006")      //ACUMC_MES("A001","01/01/95")
  ci   :=ACUMC_MES("H354","15/07/2006")
  co   :=ACUMC_MES("H354",fe)
  sintx:=ACUMC_MES("H354","01/07/2006","31/07/2006")
  sInt1:=ACUMC_FCH("H354","01/07/06","31/07/06")
*/

  // JN
  dDesde  :=FCHDESDE
  nSalario:=ACUMC_MES("H354",dDesde)

  IF CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ()

     nSalario  :=MAX(nSalario,FUNCION(3))

     //nSalario  :=sIntg            //FUNCION(3)
     //nSalario := DIV(FUNCION(3)*15.9,12)
     nAbonados :=ACUMV_FCH("H400") // Dias Abonados en H400
     nAbonados :=IIF(nAbonados=0,(nMeses-3)*5,nAbonados)

     //MENOS DE 5 MESES
     IF  nAnos<1 .AND. nMeses>=4.AND.nMeses<=5   // Literal A

       VARIAC    :=MAX(15-nAbonados,0)
       VAROBSERV :="Literal A"

       IF oNm:lPrenomina
          VAROBSERV:=VAROBSERV+cAntg+", Tiene: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=15"
       ENDIF

       RETURN nSalario*VARIAC

     ENDIF

     IF  nAnos<1 .AND. nMeses>=6.AND.nMeses<=12  // Literal B

        VARIAC    :=MAX(45-nAbonados,0)
        VAROBSERV:="Literal B"

        IF oNm:lPrenomina
            VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=45"
        ENDIF

        RETURN nSalario*VARIAC

     ENDIF

     IF nAnos=1 .AND. nMeses<=3  // Literal C, No tiene 60 dias de Prestaciones

        VARIAC   :=MAX(60-nAbonados,0)
        VAROBSERV:="Literal C "

        IF oNm:lPrenomina
            VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=60"
        ENDIF

        RETURN nSalario*VARIAC

     ENDIF

     //SI EL TIEMPO ES MAYOR QUE 1 A¥O Y MESES ENTRE 6 Y 12

     IF  nAnos>0 .AND. nMeses>6 .AND. nMeses<12 // Literal C

        VARIAC   :=MAX(60-nAbonados,0)
        //VAROBSERV:="Literal C ,"
        IF oNm:lPrenomina
           // VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=60"
        ENDIF

        nResult:=nSalario*VARIAC

     ENDIF

     //SI EL TIEMPO ES MAYOR QUE 1 A¥O Y MESES ENTRE 6 Y 12
     IF  nAnos>=1 .AND. nMeses>6 .AND. nMeses<12 // Literal C
        VARIAC:=25
        nResult:=nSalario*VARIAC
     ENDIF

     //SI EL TIEMPO ES MAYOR QUE 1 A¥O Y MESES ENTRE 6 Y 12
     IF  nAnos>=1 .AND. nMeses>7 .AND. nMeses<12 // Literal C
        VARIAC:=20
        nResult:=nSalario*VARIAC
     ENDIF

     //SI EL TIEMPO ES MAYOR QUE 1 A¥O Y MESES ENTRE 6 Y 12
     IF  nAnos>=1 .AND. nMeses>8 .AND. nMeses<12 // Literal C
        VARIAC:=15
        nResult:=nSalario*VARIAC
     ENDIF

     //SI EL TIEMPO ES MAYOR QUE 1 A¥O Y MESES ENTRE 6 Y 12
     IF  nAnos>=1 .AND. nMeses>9 .AND. nMeses<12 // Literal C
        VARIAC:=10
        nResult:=nSalario*VARIAC
     ENDIF

     //SI EL TIEMPO ES MAYOR QUE 1 A¥O Y MESES ENTRE 6 Y 12
     IF  nAnos>=1 .AND. nMeses>10 .AND. nMeses<12 // Literal C
        VARIAC:=5
        nResult:=nSalario*VARIAC
     ENDIF

     //MODIFICACION PARA BANPLUS TJ
     IF  nAnos>=2 .AND. nMeses>6 .AND. nMeses<12 // Literal C

        //VARIAC   :=MAX(60-nAbonados,0)
        VARIAC:=25
        //VAROBSERV:="Literal C ,"
        IF oNm:lPrenomina
            //VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=60"
        ENDIF

        nResult:=nSalario*VARIAC

     ENDIF

  ENDIF

RETURN nResult
// EOF

/*
//ORIGINAL
FUNCTION A416(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAnos:=0,nMeses:=0,nDias:=0,nSalario:=0,cAntg:="",nAbonados:=0

  cAntg:=","+ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,@nMeses)

  IF CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ()

     nSalario  :=FUNCION(3)
     nAbonados :=ACUMV_FCH("H400") // Dias Abonados en H400
     nAbonados :=IIF(nAbonados=0,(nMeses-3)*5,nAbonados)

     IF  nAnos<1 .AND. nMeses>=4.AND.nMeses<=6   // Literal A

         VARIAC    :=MAX(15-nAbonados,0)
         VAROBSERV :="Literal A"
         IF oNm:lPrenomina
            VAROBSERV:=VAROBSERV+cAntg+", Tiene: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=15"
         ENDIF

         RETURN nSalario*VARIAC
     ENDIF

     IF  nAnos<1 .AND. nMeses>=7.AND.nMeses<=12  // Literal B
        VARIAC    :=MAX(45-nAbonados,0)
        VAROBSERV:="Literal B"
        IF oNm:lPrenomina
            VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=45"
          ENDIF
        RETURN nSalario*VARIAC
     ENDIF

     IF nAnos=1 .AND. nMeses<=3  // Literal C, No tiene 60 dias de Prestaciones
        VARIAC   :=MAX(60-nAbonados,0)
        VAROBSERV:="Literal C "
        IF oNm:lPrenomina
            VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=60"
          ENDIF
        RETURN nSalario*VARIAC
     ENDIF

     IF  nAnos>0 .AND. nMeses>6 .AND. nMeses<12 // Literal C
        VARIAC   :=MAX(60-nAbonados,0)
        VAROBSERV:="Literal C ,"
        IF oNm:lPrenomina
            VAROBSERV:=VAROBSERV+cAntg+", Abonados: "+STR(nAbonados,3,0)+" Sumar:"+STR(VARIAC,3)+"=60"
         ENDIF
        RETURN nSalario*VARIAC
     ENDIF

     RETURN 0

  ENDIF

RETURN nResult
// EOF
*/
