Program N10_ALEJANDRO;
uses bibliont;
const vagas : array[1..12] of integer = (20,15,17,18,15,20,14,12,17,18,17,20);
const data_fut = 20200101;
var   nota_s: string[3] ; idade: string[6]; dat: string[8];
      vet: vetor;  vetclacar: array[1..12] of integer; nota: array[1..6] of string[3];
      arq: file of regis; reg: regis;
      i,a,b,dati,err,tot,id_i,contclger,cont_cla: integer;
//****************************************************************************
BEGIN
  assign(arq,'cand.ind');
  reset(arq);
  REPEAT
   read(arq,reg);
   i:= a+1;
   vet[i].pf:= a;  
   If reg.som = 0 then
    vet[i].cc:= '00000'
   Else
   Begin
    str(reg.som:3,nota_s);
		vet[i].cc:= nota_s; 
    For b:= 1 to 6 do
    Begin
     str(reg.notas[b]:3,nota_s); 
     nota[b]:= nota_s;
    End;
    insert(reg.data.dia,dat,1);
    insert(reg.data.mes,dat,1);
    insert(reg.data.ano,dat,1);
    val(dat,dati,err);
    id_i:= data_fut - dati; 
    str(id_i,idade);
    vet[i].cc:= vet[i].cc + nota[4] + nota[5] + nota[3] + nota[2] + nota[6] + nota[1] + idade;
    a:= a + 1;
   End;
  UNTIL(eof(arq));
  tot:= i;
  For a:= 1 to 20 do
	 writeln(vet[a].pf:5,' ',vet[a].cc);
	writeln('ordenando, aguarde...');
  ordem(vet,tot);
  writeln('fim da ordena��o');
  For a:= tot downto (tot-20) do
	 writeln(vet[a].pf:5,' ',vet[a].cc);
// acesso indexado e atualiza��o de registro:
  For a:= tot downto 1 do
  Begin
   seek(arq,vet[a].pf);
   read(arq,reg);
   If reg.som <> 1 then // atualiza apenas os que compareceram na prova
   Begin
	   contclger:= contclger + 1;
		 reg.clg:= contclger;
		 vetclacar[reg.car]:= vetclacar[reg.car] + 1;
		 reg.clc:= vetclacar[reg.car];
		 If (vetclacar[reg.car] <= vagas[reg.car]) then
		 Begin
		  cont_cla:= cont_cla + 1;
		  reg.ccl:= reg.car;
		 End;
		 seek(arq,vet[a].pf);
		 write(arq,reg);
	 End;
  End; 
  close(arq);
  writeln('Total de classificados:',cont_cla:8);
  termine;
END.
























