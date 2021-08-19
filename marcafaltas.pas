Program marcafaltas ;
//
//luiz antonio profe
//programa para atualizar o campo "som" nos registros de "cand.ind" com 1 (um)
//lembre que não tem como o campo soma das notas ser um
//executar antes de executar o programa que irá atualizar os campos de nota e soma das notas
//usará o arquivo faltas.txt que contem o numero de quem faltou na prova
//
uses bibliont;
var
//arquivos
 arq:file of regis;
 reg:regis;
 falta:text;
//outras
 vet:vetor;
 a,b,c,posiv,np,i,tot,tc,t:integer;
 numa,num:string[4];
Begin
 assign(arq,'cand.ind');
 assign(falta,'faltas.txt');
 reset(arq);
 reset(falta);
//o arquivo falta soh possui o num de inscr, logo o acesso serah por num
//monta o vetor pelo num de insc
 Repeat
  read(arq,reg);
  i:=a+1;          //i=indice do vetor
	vet[i].pf:=a;    //a=posicao fisica do registro no arquivo começando em zero!
	str(reg.num,num);
	tc:=length(num);
	for b:=1 to 4-tc do
	 insert('0',num,1);  //insere zeros a esquerda para ficar compativel com o numero lido em faltas
	vet[i].cc:=num; 
	a:=a+1;
 Until(eof(arq));	
//fim da montagem
 tot:=i;    // tot = 1227 que é o tamanho do nosso vetor vet, incluindo os "faltantes"
 writeln('inicio da ordenacao');
 ordem(vet,i);
 writeln('fim da ordenação');
//leitura dos faltantes
 REPEAT
  t:=t+1;
  readln(falta,numa);
  pebin1(vet,numa,tot,posiv);
  seek(arq,vet[posiv].pf);//    												         1234567890123456789012345678901234567890
  											  //SUPONDO TAMANHO DO REG=10BITS                 !         !         !         !
                          //SEEK (ARQ,2)     POSICIONA NO BIT 11           A<<<---     APONTADOR
                          //READ (ARQ,REG)   PEGA DO 11 AO 20, para no 21            ..........A<<<---     APONTADOR
  read(arq,reg);
//ATUALIZA O CAMPO REG.SOM (SOMA DAS NOTAS) COM -600 PARA INDICAR QUE O CANDIDATO FALTOU
  REG.SOM:=1;
  writeln(reg.num:5,' ',reg.nome,' ',numa,REG.SOM:10);
//  WRITE(ARQ,REG); SE FIZER SOH ISTO GRAVO AS INFORMAÇOES DE REG NA POSICAO DO PRÓXIMO-ERRRRRRO  (PASCALZIN >>>NAO GRAVA<<<)
//SEMPRE tem QUE TER O PAR SEEK READ----SEEK WRITE
	SEEK(ARQ,VET[POSIV].PF);//RETORNA APONTADOR PARA INICIO DO REGISTRO
	WRITE(ARQ,REG);
 UNTIL eof(falta);
 close(arq);
 close(falta);
 writeln('total de faltantes na prova --',t:5,' candidatos');
 termine; 
End.