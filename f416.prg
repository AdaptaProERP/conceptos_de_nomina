FUNCTION F416(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  LOCAL nMeses,nDias:=0

  nMeses:=INT(MESES(FECHA_ING,oNm:dHasta))

  IF CONDICION=[A] .AND. oNm:cOtraNom=[LI] .AND. TABLALIQ() .AND. nMeses<13

     // Calcula el Tabulador de Dias
     DO CASE
        CASE nMeses<=3
            nDias:=0
        CASE nMeses>3.AND.nMeses<=5
            nDias:=15
        CASE nMeses>5.AND.nMeses<=11
            nDias:=45
        CASE nMeses=12
            nDias:=60
     ENDCASE

     nFactor1:=INT(MESES(FECHA_ING-15,oNm:dHasta))
     nFactor2:=TABLA("0005",nFactor1,"ANT_DIA")
     nFactor3:=IIF(nFactor1>3,(nFactor1-3)*5,0)
     nFactor4:=nFactor2-MAX(nFactor3,ACUMC_FCH("H401,A415"))
     nResult:=IIF(nFactor4>0,nFactor4,0)

  ENDIF

RETURN nResult
// EOF
/*
La f©rmula A416 incluye este c~lculo

/*