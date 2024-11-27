FUNCTION D010(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAsume:=0,nEmpresa:=0,nDiasCal:=0

  IF C_A001+C_A002+C_A003>0

     VARIAC :=REPOSO(oNm:dDesde,oNm:dHasta,@nDiasCal)

     IF VARIAC>3 // A parir del tercer DÑa lo Asume el SSO

        // Todo el Periodo de Pago est~ de Reposo
        IF VARIAC>=oNm:nDias .AND. nDiasCal>0
           VARIAC:=MIN(nDiasCal,oNm:nDias)
        ENDIF

        nResult:=FUNCION(3)*VARIAC

        IF POR_REPOSO>0

           nAsume   :=PORCEN(nResult,POR_REPOSO) // Asumido por el Trabajador
           VAROBSERV:=ALLTRIM(STR(100-POR_REPOSO,6,2))+"% Asumido por el Trabajador"

           IF POR_REPOSO=100
              CREAVARCON("N063",nResult,VAROBSERV)
              nResult  :=0
           ELSE
              nResult  :=nResult-nAsume
              CREAVARCON("N063",nResult,VAROBSERV)
           ENDIF

        ELSE

           CREAVARCON("N063",0,"")

        ENDIF

      ENDIF

  ENDIF

RETURN nResult
// EOF
/*
Obtiene de la tabla de Ausencias los días de reposo para el periodo de pago de nómina
segon la función: REPOSO(oNm:dDesde,oNm:dHasta). En caso que la cantidad de días
 de reposo sea inferior a Cuatro (4) no será deducido sino será registrado en forma 
automática para concepto "N062 Días de Reposo asumido por la Empresa" con la 
finalidad de ser aplicado en la nómina Cesta Ticket y posibles asientos contables. Si en la 
ficha del trabajador está registrado el % (Porcentaje en el campo: "POR_REPOSO") que
 asume el trabajador por días de reposo superiores a tres días, será aplicado al monto de
 este concepto y la diferencia será automáticamente registrada para el concepto".























******
. Obtiene de la tabla de Ausencias los dÑas de reposo para el periodo de pago de n©mina segon la funci©n: REPOSO(oNm:dDesde,oNm:dHasta). En caso que la cantidad de dÑas de reposo sea inferior a Cuatro (4) no ser~ deducido sino ser~ registrado en forma autom~tica para concepto "N062 DÑas de Reposo asumido por la Empresa" con la finalidad de ser aplicado en la n©mina Cesta Ticket y posibles asientos contables. Si en la ficha del trabajador est~ registrado el % (Porcentaje en el campo: "POR_REPOSO") que asume el trabajador por dÑas de reposo superiores a tres dÑas, ser~ aplicado al monto de este concepto y la diferencia ser~ autom~ticamente registrada para el concepto".

/*