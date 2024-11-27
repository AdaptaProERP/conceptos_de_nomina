FUNCTION D410(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0

 IF CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ()
   lVariac:=.F. // Indica si Requiere Valor en Variaci©n
   nResult:=ACUMC_FCH("N063")
 ENDIF

RETURN nResult
// <EOF>
/*
Obtiene el total del Monto pagado por la empresa derivados de Reposos médicos
 registrados previamente por el Concepto "N063 Reposo Pagado por la Empresa"
 y generado automáticamente desde el concepto "D010 Reposo Médico" cuando 
el reposo supera los tres días y el trabajador posee registrado en un ficha % que 
asume del reposo.

/*