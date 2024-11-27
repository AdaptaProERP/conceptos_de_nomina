FUNCTION F352(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAnos,nSalario,nDias,dDesde,nMeses:=0
  LOCAL dFechaA // Aniversario Anterior cobr© bono Vacacional
  LOCAL dFechaE // Aniversario Este A_o, le corresponde Cobrar Bono Vacacional

  dFechaA:=FCHANUAL(FECHA_ING,FCHDESDE-360) // Fecha Aniversario Anterior
  dFechaE:=FCHANUAL(FECHA_ING,FCHDESDE)     // Anivesario Este A_o

  IF FECHA_ING>=dFechaA
     dFechaA:=FECHA_ING
     dFechaE:=oNm:dHasta
  ENDIF

  // Futura Antiguedad
  nAnos:=0
  ANTIGUEDAD(FECHA_ING,dFechaE,@nAnos,@nMeses,0) // Determina la Cantidad de A_os y Meses
  nResult :=nAnos
  nSalario:=FUNCION(3)
  IF nAnos>1
     nDias:=nAnos+CNS(057)-1
     nDias  :=MAX(CNS(91),nDias) // Toma el Mayor entre la Empresa y la Ley
  ELSE
     nDias :=CNS(057) // Lo que dice la Ley
  ENDIF

  nDias  :=DIV(nDias,12)      // Proporci©n de un solo mes
  VARIAC :=nDias
  nResult:=DIV(nDias*nSalario,30)

RETURN nResult
// EOF
/*
Determina el Valor diario del Bono Vacacional necesario para Determinar
el Salario Integral.
Constante 091, se refiere el Bono Vacacional que ofrece la empresa y se compara
con el mayor entre 91 y 57

/*