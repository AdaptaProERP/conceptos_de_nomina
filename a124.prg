FUNCTION A024(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,SD:=0,SXH:=0,BNOCT:=0,SNXH:=0,SXH2:=0,SNXH2:=0,SXH1:=0,SXH3:=0,SXH4:=0
LOCAL nDias, nDiasIna:=0 , nHoras:=0,nResult1:=0,nResult2:=0
LOCAL SSemanal:=0, SDiario:=0
IF CONDICION=[A] .AND. TURNO="MIX" .AND. TIPO_NOM="S"
nDiasIna:=VARPRE("D001")+VARPRE("D010")+VARPRE("D011")
nDias:=DIAS_TRAB(5)-nDiasIna
nHoras:= cns(102)
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
     VARIAC:=nHoras*nDias
     nResult:=((((SNXH2+SXH2)*nDias)-(SALARIO*nDias))/(nDias*CNS(099)))*VARIAC
ENDIF
//==========================================================
IF CONDICION=[A] .AND. TURNO="MIX" .AND. TIPO_NOM="M"
//IF CONDICION=[A] .AND. TIPO_NOM="M"
   nDiasIna:=VARPRE("D001")+VARPRE("D010")+VARPRE("D011")
   nDias:=DIAS_TRAB(30)-nDiasIna
   IF MONTH(oNm:dHasta)=2 .AND. C_A003 > 0
        nDias:=nDias+2
   ENDIF
   nHoras:=cns(102)  // cns(102)  3 horas
   SSemanal:=(SALARIO*12)/52  // Sueldo Semanal
   SDiario :=SSemanal/7        // Sueldo Diario
//------------------------------
     SD:=Salario/30  //SDiario
     SXH:= SD/CNS(099)         // Salario DIario /7.5
     SXH1:=SXH*CNS(101)        // Salario DIario *4.5
     BNOCT:= Porcen(SXH,CNS(100))  // SDiario+Bono Noct.
     SXH2 := SXH+BNOCT
     SXH2 := SXH2*3    // bien
     SXH3 := SXH1+SXH2 // bien
     SXH4 := (((SXH3*7)*52)/12)  // bien
    //SNXH2 := SNXH*CNS(102)
     VARIAC:=nHoras*nDias
     SNXH2 :=Variac*BNoct
     nResult:=sxh4-C_A003
     nResult:=sNxh2  //*VARIAC
//  //BNOCT*VARIAC  //SNXH2  //SDIARIO
// ((((SNXH2+SXH2)*nDias)-(SALARIO*nDias))/(nDias*CNS(099)))*VARIAC
//------------------------------
ENDIF
RETURN nResult
// EOF
