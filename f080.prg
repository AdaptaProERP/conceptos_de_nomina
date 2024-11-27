FUNCTION F080(uPar1,uPar2,uPar3,uPar4,uPar5)
IF oNm:cOtraNom="VC"
  RETURN TABHASTA-TABDESDE
ENDIF
RETURN CNS(50)
// EOF
/*
Utilizado por el formulario de Vacaciones y devolver cuantos d—as
corresponden por vacaciones.
Las Vacaciones Colectivas emplea, la cantidad de d—as del periodo de vacaciones y no la
constante CNS(52)

/*