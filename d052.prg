FUNCTION D028(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAnos:=0,nReposo:=0,nDiasCal:=0,nDif:=0,ns,nResAap
  LOCAL nAportUtil,aAportBvac

  // variables para suma el aporte de utilidad y bono vacacional al salario devengado
  aAportUtil:=FUNCION(600)
  aAportBvac:=FUNCION(601)

  IF  (CONDICION=[A] .OR. CONDICION=[V]) .AND. CONDICION$"AL"  .AND. oNm:cOtraNom="UT"  .AND. FECHA_ING<oNm:dHasta
        RETURN 0
  ENDIF
  IF !UPPE(DESC_LPH)=[N] .AND. ASIGNA>0 .AND. oNm:cOtraNom<>"CT"

     //nReposo:=REPOSO(oNm:dDesde,oNm:dHasta,@nDiasCal)

     // Todo el Periodo de Pago está de Reposo
     IF nReposo>=nDiasCal .AND. nReposo>0
        RETURN 0
     ENDIF

     ANTIGUEDAD(FECHA_NAC,oNm:dHasta,@nAnos)

     IF (nAnos<IIF(SEXO=[M],CNS(04),CNS(05)) .OR. EMPTY(FECHA_NAC))

      VARIAC :=CNS(03)

     //Se cambia el resultado a que sume los aportes de utilidad y bono vacacional

     //nResult:=PORCEN(C_A001+C_A002+C_A003+C_A004+C_A005+C_A006+C_A007+C_A008+C_A009+;
     //          C_A012+C_A014+C_A015+C_A017+C_A024+C_A025+C_A026+C_A027+C_A043+C_A080+C_A081+;
     //          C_A083+C_A085+C_F600+C_F601+C_D023,CNS(03))

       nResult:=PORCEN((ASIGNA-C_A018-C_A030-C_A031+C_D002-C_A021-C_A060-C_A500),CNS(03))
//C_D001


     // nResult:=PORCEN(C_A001+C_A004+C_A010+C_A002+C_A003+C_A080+C_A081+C_A083+C_A085+;
       //        C_A043+C_D023,CNS(03))

     //nResult:=PORCEN(MIN(C_A001+C_A004+C_A010+C_A002+C_A003+C_A080+C_A081+C_A083+C_A085+;
               //C_A043+C_D023,CNS(22)*CNS(26)),CNS(03))
     ENDIF

     // Diferir Retenci©n

     //IF oNm:cTipoNom="Q" .AND. oDp:lDifLPH
       // IF QUINCE()
         //  CREAVARCON("H128",nResult)
         //  RETURN 0
      //  ELSE
        //   nDif:=ACUMC_MES("H128")
         //  VAROBSERV:=IIF(nDif=0,"","Diferido "+ALLTRIM(STR(nDif)))
           nResult:=nResult+nDif
       //  ENDIF
   //  ELSE
        CREAVARCON("H128",0)
   //  ENDIF

  ENDIF
RETURN nResult
// EOF
/*
//Cambio de Fondo de Ahorro Obligatorio (FAOV)  antes(Ley de Politica Habitacional
 a Ley de Vivienda y Hábitat segun ley 2005
Aplica el porcentaje de la constante "03" sobre el monto de vacaciones del concepto
A043, A044 y A081.Si un trabajador quincenal inicia el periodo de vacaciones el día 11,
realice los siguientes pasos: Introduzca el código en la tabla de vacaciones, ejecute 
parcialmente la nómina quincenal donde cobrará 10 días laborados la primera quincena 
y finalmente procese la nómina Vacaciones. De esta manera se logra la cronología de los
procesos y el trabajador recibe los pagos correspondientes a la primera quincena más el
periodo de vacaciones. Sólo para Nómina Quincenal: Si la configuración de la Empresa, 
solicita su diferimiento del "F.A.O.V". para la segunda quincena, el monto será almacenado 
en el concepto "H128", el valor del Concepto "D028" será cero "0.00" para la primera
Quincena.


/*