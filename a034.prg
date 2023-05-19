FUNCTION A034(uPar1,uPar2,uPar3,uPar4,uPar5)
LOCAL nResult:=0,SD:=0,SXH:=0,BNOCT:=0,SNXH:=0,SXH2:=0,SNXH2:=0,SXH1:=0,SXH3:=0,SXH4:=0
LOCAL nDias, nDiasIna:=0 , nHoras:=0,nResult1:=0,nResult2:=0
LOCAL SSemanal:=0, SDiario:=0
LOCAL IMIXTA:=0,DIFSAL:=0,SMD:=0,SMD1:=0,SXH0:=0,SALSEM:=0
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
//===============================================================================
IF CONDICION=[A] .AND. TIPO_NOM="M" .AND. TURNO="MIX"
//IF CONDICION=[A] .AND. TIPO_NOM="M"
   nDiasIna:=VARPRE("D001")+VARPRE("D010")+VARPRE("D011")
   nDias:=DIAS_TRAB(30)-nDiasIna
   IF MONTH(oNm:dHasta)=2 .AND. C_A003 > 0
        nDias:=30  //nDias+2
   ENDIF
   nHoras:=135    //cns(101)            // cns(102) //4,5
   SSemanal:=(SALARIO*12)/52   // Sueldo Semanal
   SDiario :=SSemanal/7        // Sueldo Diario
//---------------------------------------------------------------------------------------------
     SD:=Salario/30             // SDiario
     SXH:= SD/7.5               // Salario DIario /7.5  --- 1.104,49
     SXH0:= (SXH*30)/100        // Salario DIario /7.5  --- 331.35
     SXH1:=SXH*4.5              // Salario DIario *4.5  --- 4.970,21
     SXH2:=(SXH+SXH0)*3         // Salario DIario *4.5  --- 4.307,51
     SMD:=SXH1+SXH2             // Salario Mixto Diario --- 9.277.72
     SMD1:=(SMD*7*52)/12        // Salario Mensual Mixto   281.424,18
//---------- Calculo Salario Mixto Mensual Preliminar  -----------------------------
     DIFSAL:=SMD1-SALARIO       // >>     32.913,77
     SALSEM:=(DIFSAL*12)/52     // >>      7.595,49
     IMIXTA:=(SALSEM/7)/7.5     //      144,68
//---------- Calculo Salario Mixto Mensual Preliminar  -----------------------------
     VARIAC:=ndias*3  //nHoras*nDias     //     VARIAC:=135
     nResult:=IMIXTA*VARIAC
ENDIF
//===============================================================================
RETURN nResult
// EOF
