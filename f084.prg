FUNCTION F084(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL dFecha,nAnos:=0,dHasta

  // Fecha Base de Vacaciones

  IF oNm:cOtraNom=[VC]
     dHasta:=FCHHABIL(CNS(53),1) // TABDESDE)
     // dHasta:=FCHHABIL(oDp:dFchIniVac,1)
  ELSE
     dHasta:=oNm:dHasta
  ENDIF

  ANTIGUEDAD(MAX(FECHA_ING,CNS(55)),dHasta,@nAnos)

  IF nAnos>1
     nAnos:=MIN(nAnos-1,15) // Tope Maximo 15 A_os
  ELSE
     nAnos:=0
  ENDIF

RETURN nAnos
// EOF
/*
Días adicionales de disfrute.
Determina el aniversario de la fecha de ingreso o fecha resultante.
Obtiene la fecha mayor entre la fecha de Ingreso y la Constante 55 (Vigencia Art 223).
Determina los meses de vacaciones y la proporción en días.


/*