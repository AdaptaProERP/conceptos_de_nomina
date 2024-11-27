FUNCTION D051(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nLunes,nSalario,nReposo:=0,nDiasCal:=0,nDif,nAnos:=0,nResult2:=0

  IF (C_A001+C_A002+C_A003+C_A500+C_A499>0) .AND. !DESCONTAR$[Nn] .OR. (CONDICION=[A].AND.oNm:cOtraNom=[VI].AND.TABLAVAC()) .OR. (CONDICION=[A].AND.oNm:cOtraNom=[VC])

     //nReposo:=REPOSO(oNm:dDesde,oNm:dHasta,@nDiasCal)

     // Todo el Periodo de Pago esta de Reposo
     //IF nReposo>=nDiasCal .AND. nReposo>0
     //   RETURN 0
     //ENDIF

     ANTIGUEDAD(FECHA_NAC,oNm:dHasta,@nAnos)

     IF oNm:cTipoNom="S"

        IF (nAnos<IIF(SEXO=[M],CNS(04),CNS(05)) .OR. EMPTY(FECHA_NAC))

           nLunes  :=FUNCION(6)
           nSalario:=FUNCION(5)
           nResult :=PORCEN((SALARIO*360/52),CNS(01))*nLunes // CNS(01) % Seguro Social
           VARIAC  :=CNS(01)

        ENDIF

     ENDIF

     // Diferir Retenci©n, para la próxima Nómina

     IF oNm:cTipoNom="Q" .AND. oDp:lDifSSO

        // Si se Aplica a Final de Mes , La condicion es IF !QUINCE()
        IF QUINCE()
           CREAVARCON("H104",nResult)
           RETURN 0
        ELSE
           nDif:=ACUMC_MES("H104")
           VAROBSERV:=IIF(nDif=0,"","Diferido "+ALLTRIM(STR(nDif)))
           //nResult:=nResult+nDif
           nResult:=nResult
         ENDIF

     ENDIF

     IF oNm:cTipoNom="Q"

         IF (nAnos<IIF(SEXO=[M],CNS(04),CNS(05)) .OR. EMPTY(FECHA_NAC))

            nLunes  :=FUNCION(6)
            nSalario:=FUNCION(5)
            nResult2 :=PORCEN(((SALARIO/30)*360/52),CNS(02))*nLunes // CNS(02) % Seguro Social
            VARIAC  :=CNS(02)

         ENDIF


     ENDIF

     ELSE

        CREAVARCON("H104",0)

  ENDIF

RETURN nResult+nResult2
// EOF
/*
Se utiliza para deducirle en el recibo un monto.  El monto esta almacenado 
en "VARIAC".

/*