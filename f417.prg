FUNCTION F417(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0,nAnos:=0,nMeses:=0,nDias:=0,dDesde,nContar:=0
  LOCAL nMesesAcum,cAnos

  cAnos:=ANTIGUEDAD(FECHA_ING,oNm:dHasta,@nAnos,@nMeses)

  IF CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ()

      nDias:=0
      DO CASE
        CASE nMeses<=3
            nDias:=0
        CASE nMeses>3.AND.nMeses<=5
            nDias:=5-nMeses
        CASE nMeses>5.AND.nMeses<=11
            nDias:=11-nMeses
        CASE nMeses=12 .AND. nAnos=0
            nDias:=3 // Meses no Acumulados el Primer trimestre
        CASE nMeses=12 .AND. nAnos>0
            nDias:=0
       ENDCASE


//     nMeses:=nMeses-(INT(DIV(nMeses,12))*12)  // Meses despues del Aniversario
//     nFactor1:=MESES(FECHA_ING,oNm:dHasta)
//     nFactor2:=nFactor1-(INT(DIV(nFactor1,12))*12)
//     nFactor3:=IIF(nFactor2>5,nFactor2,0)
//     nFactor4:=IIF(nFactor3>0,nFactor3*5,0)
//     nResult:=IIF(nFactor2>5,60,0)-nFactor4
     RETURN 1
  ENDIF
RETURN nResult
// EOF
/*
La f©rmula A416 ya incluye este c~lculo

/*