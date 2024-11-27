FUNCTION P207(nPar1,nPar2,nPar3,nPar4,nPar5,nPar6)
 LOCAL nResult:=0,oFamilia,nSalario:=CNS(26),nAnos:=0,nMeses:=0

 IF C_P001>0

    VARIAC  :=0
    nSalario:=PORCEN(nSalario,CNS(94)) // Valor M~ximo de Guarder—a

    oFamilia:=OpenTable("SELECT FAM_FCHNAC FROM NMFAMILIA WHERE FAM_CODTRA"+;
              GetWhere("=",CODIGO)+" AND FAM_PARENT LIKE '%HIJ%'",.T.)

    WHILE !oFamilia:Eof()
      nAnos:=INT(DIV(MESES(oFamilia:FAM_FCHNAC,oNm:dHasta),12))
      IF nAnos<=CNS(93)
         VARIAC:=VARIAC+1
      ENDIF
      oFamilia:DbSkip()
    ENDDO
    oFamilia:End()

    nMeses :=MESES(MAX(FCHINICIO,FECHA_ING),oNm:dHasta+1) // Cuantos Meses Transcurridos
    nMeses :=MAX(nMeses,12)
    nResult:=VARIAC*nSalario*nMeses

 ENDIF

RETURN nResult
// <EOF>
/*


/*