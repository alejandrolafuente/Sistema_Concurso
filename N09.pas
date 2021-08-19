Program N09RICARDO_ALEJANDRO;
uses bibliont;
var
 arq:file of regis;
 reg:regis;
 nota:text;
 vet:vetor;
 a,b,ini,posiv,i,tot,tc,t,inte,err,cont,som:integer;
 num:string[4]; numa: string[28];
 soma: array[1..6] of integer; 
//********************************************************************
BEGIN
 assign(arq,'cand.ind');
 assign(nota,'notas.txt');
 reset(arq);
 reset(nota);
 Repeat
  read(arq,reg);
  i:=a+1;          
	vet[i].pf:=a;    //a=posicao fisica do registro no arquivo começando em zero!
	str(reg.num,num);
	tc:=length(num);
	for b:=1 to 4-tc do
	 insert('0',num,1);  
	vet[i].cc:=num; 
	a:=a+1;
 Until(eof(arq));	
//fim da montagem
 tot:=i;    // tot = 1227 que é o tamanho do nosso vetor vet, incluindo os "faltantes"
 writeln('inicio da ordenacao');
 ordem(vet,i);
 writeln('fim da ordenação');
//leitura das notas, acessa apenas os registros dos que fizeram a prova
 REPEAT
  t:=t+1;   // t conta o total de registros acessados ou alunos que fizeram a prova
  readln(nota,numa); // guarda na MP na string numa, cada registro tem tamanho 28
  num:= copy(numa,1,4);
  pebin1(vet,num,tot,posiv);
  seek(arq,vet[posiv].pf);     
  read(arq,reg);
  ini:= 6;
  som:= 0;
  For cont:= 1 to 6 do
  Begin
   val(copy(numa,ini,3),inte,err); // guarda em inte nota por nota 
   reg.notas[cont]:= inte;
   som:= som + inte;
   soma[cont]:= soma[cont] + inte; 
   ini:= ini + 4;
  End;
  reg.som:= som;
	seek(arq,vet[posiv].pf); // reposiciona para gravar e não gravar no próximo registro
	write(arq,reg);
 UNTIL eof(nota);
 close(arq);
 close(nota);
 clrscr;
 writeln;
 writeln;
 writeln('        DISCIPLINA                        MÉDIA');
 writeln;
 writeln('        LÍNGUA ESTRANGEIRA MODERNA','        ',soma[1]/t:5:2);
 writeln('        MATEMÁTICA','                        ',soma[2]/t:5:2);
 writeln('        LÓGICA','                            ',soma[3]/t:5:2);
 writeln('        CONHECIMENTOS ESPECÍFICOS','         ',soma[4]/t:5:2);
 writeln('        INFORMÁTICA','                       ',soma[5]/t:5:2);
 writeln('        ATUALIDADES','                       ',soma[6]/t:5:2);
 writeln;
 termine; 
END.