FUNCTION D071(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0

  IF  oDp:lUtilDif .AND. oNm:cOtraNom="LI"
     RETURN 0
  ENDIF

  IF CONDICION="A" .AND. (oNm:cOtraNom="UT" .OR. (oNm:cOtraNom=[LI].AND.TABLALIQ()))
     nResult:=ACUMC_FCH("A071,D071")
  ENDIF

RETURN nResult
// EOF
/*
Se aplica en el Pago de Vacaciones y Liquidaci�n de Prestaciones.

N�mina "DI" Datos Iniciales
Acepta el monto correspondiente a los Adelantos de Utilidades que ser�n descontadas
en siguiente pago de utilidades a trav�s del concepto D071.

N�mina: "LI" Liquidaci�n
Deduce todos los anticipos de utilidades otorgados por el trabajador en la n�mina "AN"
para Anticipos. Solo se aplica este si las utilidades no ser� diferidas seg�n previa
configuraci�n de la Empresa. Si la utilidad es diferida, el Concepto "N064" restar� del
c�lculo de utilidades el monto obtenido por anticipos de utilidades otorgados previamente
en la n�mina "Anticipos" seg�n el concepto "A071".

/*