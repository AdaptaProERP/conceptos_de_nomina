FUNCTION D050(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nLunes,nSalario,nReposo:=0,nDiasCal:=0,nDif,nAnos:=0,nResult2:=0

  IF (C_A001+C_A002+C_A003+C_A500+C_A499>0) .AND. !DESCONTAR$[Nn] .OR. (CONDICION=[A].AND.oNm:cOtraNom=[VI].AND.TABLAVAC()) .OR. (CONDICION=[A].AND.oNm:cOtraNom=[VC])

    // nReposo:=REPOSO(oNm:dDesde,oNm:dHasta,@nDiasCal)

     // Todo el Periodo de Pago esta de Reposo
     IF nReposo>=nDiasCal .AND. nReposo>0
        RETURN 0
     ENDIF

     ANTIGUEDAD(FECHA_NAC,oNm:dHasta,@nAnos)

     IF oNm:cTipoNom="Q"

        IF (nAnos<IIF(SEXO=[M],CNS(04),CNS(05)) .OR. EMPTY(FECHA_NAC))

           nLunes  :=FUNCION(6)
           nSalario:=FUNCION(5)
           nResult :=PORCEN(((SALARIO/30)*360/52),CNS(01))*nLunes // CNS(01) % Seguro Social
           VARIAC  :=CNS(01)

        ENDIF

     ENDIF

     //Diferir Retenci�n, para la pr�xima N�mina

     IF oNm:cTipoNom="Q" .AND. oDp:lDifSSO

        // Si se Aplica a Final de Mes , La condicion es IF !QUINCE()
        IF QUINCE()
           CREAVARCON("H104",nResult)
           RETURN 0
        ELSE
           nDif:=ACUMC_MES("H104")
           VAROBSERV:=IIF(nDif=0,"","Diferido "+ALLTRIM(STR(nDif)))
           nResult:=nResult+nDif
           nResult:=nResult
        ENDIF


     ENDIF

     ELSE

        CREAVARCON("H104",0)


  ENDIF

RETURN nResult
// EOF
/*
Aplica el porcentaje de la constante "01" sobre el salario semanal multiplicado por la
cantidad de lunes encontrados dentro del periodo de  disfrute de vacaciones. 
S�lo para N�mina Quincenal: Si la configuraci�n de la Empresa, solicita su diferimiento 
del S.S.O. para la segunda quincena, el monto ser� almacenado en el concepto "H104", 
el valor del Concepto "D004" ser� cero "0.00" para la primera Quincena.

F006 Calcula los lunes del periodo de pago
F005 Determina el Salario
Se aplica seg�n la cantidad de lunes existentes en el periodo de pago.

lineas agregadas segun :Cap�tulo III De la vejez
Art�culo 27: EI asegurado, despu�s de haber cumplido 60 a�os de edad si es var�n o 55 
si es mujer, tiene derecho a una pensi�n de vejez siempre que tenga acreditadas un 
m�nimo de 750 semanas cotizadas.

     ANTIGUEDAD(FECHA_NAC,oNm:dHasta,@nAnos)
     IF (nAnos<IIF(SEXO=[M],CNS(04),CNS(05)) .OR. EMPTY(FECHA_NAC))
       nLunes  :=FUNCION(6)
       nSalario:=FUNCION(5)
       nResult :=PORCEN(nSalario,CNS(01))*nLunes // CNS(01) % Seguro Social
       VARIAC  :=CNS(01)
     ENDIF

/*