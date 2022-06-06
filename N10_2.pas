Program N10_ALEJANDRO;
uses bibliont;
const cargos: array[1..12] of string[22] =
('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR              ','ANALISTA DE SISTEMAS  ',
 'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','PEDREIRO DE PRIMEIRA  ',
 'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );
var reg: regis; arq: file of regis ; stri: string[2]; cad: string[4];
    vet: vetor; 
    opc,i,a,c,e,t,anterior,orde,contlin: integer;
//*********************************************************    
BEGIN
 assign(arq,'cand.ind');
 reset(arq);
 writeln('Entre com a op��o:');
 writeln('1- Para mostrar os classificados em ordem alfab�tica');
 writeln('2- Para mostrar TODOS os candidatos em ordem de classifica��o por cargo');
 writeln('3- Para mostrar TODOS os candidatos em ordem de classifica��o geral');
 Repeat
  leia1('Ordem',opc);
 Until(opc>0) and (opc<=3);
 i:= 1; a:= 0;
 REPEAT
   read(arq,reg);
   If (opc = 1) and (reg.ccl <> 0)then
   Begin                  
    vet[i].pf:= a;
    vet[i].cc:= reg.nome; 
    str(reg.ccl,stri);
    If (reg.ccl < 10) then
     insert('0',stri,1);
    insert(stri,vet[i].cc,1);
    i:= i + 1;
   End;
   If ((opc = 2) or (opc = 3)) and (reg.som <> 1) then
   Begin 
	   vet[i].pf:= a;
	   If (opc = 2) then
	   Begin
	    str(reg.car,stri);
	    If (reg.car < 10) then
	     insert('0',stri,1);
	    str(reg.clc,cad);
	    t:= length(cad);
	    For c:= 1 to 4 - t do
	     insert('0',cad,1);
	    vet[i].cc:= stri + cad;
	   End
	   Else // opc = 3
	   Begin
	    str(reg.clg,cad);
	    t:= length(cad);
	    For c:= 1 to 4 - t do
	     insert('0',cad,1);
	    vet[i].cc:= cad;
	   End;
	   i:= i + 1;
	 End; 
	 a:= a + 1; 
 UNTIL(eof(arq));
 i:= i - 1;
//*******************************************
 For c:= 1 to i do
  writeln(vet[c].pf:5,' ',vet[c].cc);
 writeln('Ordenando, aguarde...');
 ordem(vet,i);
 writeln('Fim da ordena��o');
 For c:= 1 to i do
  writeln(vet[c].pf:5,' ',vet[c].cc);
 writeln('================= PRESSIONE ENTER PARA CONTINUAR ================');
//*******************************************
 For e:= 1 to i do
 Begin
  seek(arq,vet[e].pf);
  read(arq,reg);
  If ((opc = 1) or (opc = 2)) and (anterior <> reg.car) then
   orde:= 0;
  If ((contlin mod 30 = 0) or (((opc = 1) or (opc = 2)) and (anterior <> reg.car))) then
  Begin
   readln;    
   clrscr;
   anterior:= reg.car;
   writeln;
   If ((opc = 1) or (opc = 2)) then
    writeln('  CURSO:',anterior:5,' -- ',cargos[anterior]);
   writeln;
   If (opc = 1) then
    writeln('  ORD  NUM NOME                                NASCIMENTO  CAR');
   contlin:= 0; 
   If (opc = 2) or (opc = 3) then
   Begin
    If (opc = 3) then
     writeln('  RELA��O ORDEM DE CLASSIFICA��O GERAL');
    write('  ORD INSC NOME                                SOM N4 N5 N3 N2 N6 N1');
    WRITELN(' NASCIMENTO  CAR OBSERVA��O');
   End;
  End;
  orde:= orde + 1;
  If (opc = 1) then
   writeln(orde:5,reg.num:5,' ',reg.nome,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano,reg.car:4);
  If (opc = 2) or (opc = 3)then
  Begin
   write(orde:5,reg.num:5,' ',reg.nome,' ',reg.som,reg.notas[4]:3,reg.notas[5]:3,reg.notas[3]:3);
   write(reg.notas[2]:3,reg.notas[6]:3,reg.notas[1]:3,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano);
   write(reg.car:4);
   If (opc = 2) then
    If (reg.ccl <> 0) then
     writeln('  CLAS CAR=',reg.ccl)
    Else
     writeln;
   If (opc = 3) then
    If (reg.ccl <> 0) then
     writeln('  CLAS CAR=',reg.car)
    Else
     writeln;
  End;
	contlin:= contlin + 1;
 End;
//**********************************************************************************
 close(arq);
 writeln;
 termine;                                    
END.















