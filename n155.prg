FUNCTION N155(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,nMax:=0,dDesde,dHasta,nAnos:=6
 LOCAL bEdad

 IF CONDICION="A" .AND. oNm:cOtraNom="GR"
    bEdad:={|nAnos,nMeses,nDias|nAnos<6}
    VARMEMO :=""
    VARIAC  :=0
    nMax    :=PORCEN(CNS(26),CNS(94)) // % Tope(94) sobre el Salario Mínimo
    nFactor1:=nMax                    // Necesario para determinar retroactivo
    dDesde  :=FchIniMes(oNm:dDesde)
    dHasta  :=FchFinMes(oNm:dHasta)
    nResult :=GuardCuotas(dDesde,dHasta,@VARMEMO,nMax,bEdad,NIL,@VARIAC)
 ENDIF

RETURN nResult
// <EOF>
/*
Lee los registros de mensualidad de guardería por cada representado vinculado con el
trabajador y cuya fecha de inscripción corresponda al mes de proceso de nómina
 Guardería.  Si el trabajador tiene registrado varios hijos en guardería, es totalizado el
 monto del concepto y a través de la variable "VARMEMO". La información se muestra
 por cada hijo: Parentesco, Edad, Fecha de Nacimiento y Monto por Guardería. 

/*