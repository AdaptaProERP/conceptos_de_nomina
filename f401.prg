FUNCTION F401(uPar1,uPar2,uPar3,uPar4,uPar5)
  LOCAL nResult:=0
  IF CONDICION$"ARV".AND.oNm:dHasta>CNS(82)
     nFactor1:=MESES(MAX(FECHA_ING,CNS(82)),oNm:dHasta)
     nFactor2:=INT(DIV(nFactor1,12))
     nFactor3:=IIF(nFactor2>=2,2,0)*IIF(nFactor2>16,15,nFactor2-1)
     nFactor4:=IIF(MONTH(MAX(FECHA_ING,CNS(82)))=MONTH(oNm:dHasta),nFactor3,0)
     nResult:=nFactor4
  ELSE
      //
  ENDIF
RETURN nResult
// EOF
/*


/*