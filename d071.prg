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
Se aplica en el Pago de Vacaciones y Liquidación de Prestaciones.

Nómina "DI" Datos Iniciales
Acepta el monto correspondiente a los Adelantos de Utilidades que serán descontadas
en siguiente pago de utilidades a través del concepto D071.

Nómina: "LI" Liquidación
Deduce todos los anticipos de utilidades otorgados por el trabajador en la nómina "AN"
para Anticipos. Solo se aplica este si las utilidades no será diferidas según previa
configuración de la Empresa. Si la utilidad es diferida, el Concepto "N064" restará del
cálculo de utilidades el monto obtenido por anticipos de utilidades otorgados previamente
en la nómina "Anticipos" según el concepto "A071".

/*