FUNCTION A022(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0, SD:=0, SXH:=0, BNOCT:=0,SNXH:=0,SXH2:=0,SNXH2:=0
LOCAL nDias, nDiasIna:=0
IF CONDICION=[A] .AND. TURNO="MIX" .AND. TIPO_NOM="S"
nDiasIna:=VARPRE("D001")+VARPRE("D010")+VARPRE("D011")
nDias:=DIAS_TRAB(5)-nDiasIna
    IF C_A004>0
       nDias:=nDias+1
    ENDIF
    IF C_A010>0
       nDias:=nDias+1
    ENDIF
    SD:=(SALARIO)
     SXH:= SD/CNS(099)
     SXH2:= SXH * CNS(101)
     BNOCT:= SXH*CNS(100)/100
     SNXH:=SXH+BNOCT
     SNXH2 := SNXH*CNS(102)
     nResult:= ((SNXH2+SXH2)*nDias)-(SALARIO*nDias)
  ENDIF

  IF CONDICION=[A] .AND. TURNO="MIX" .AND. TIPO_NOM="M"
   nDiasIna:=VARPRE("D001")+VARPRE("D010")+VARPRE("D011")
   nDias:=DIAS_TRAB(30)-nDiasIna
     SD:=(SALARIO/30)       //(((FUNCION(000))+SALARIO)/30)
     SXH:= SD/CNS(099)
     SXH2:= SXH * CNS(101)
     BNOCT:= SXH*CNS(100)/100
     SNXH:=SXH+BNOCT
     SNXH2 := SNXH*CNS(102)
     nResult:=((((SNXH2+SXH2)*30)-SALARIO)/30)*nDias
  ENDIF
RETURN nResult
// EOF
