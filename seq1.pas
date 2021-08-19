Program seq1 ;
{criar arq de acesso seq com os campos abaixo: numero(4 - menor que 3001),
nome(35), cpf(11), nas(8-dd,mm,aaaa), cargo (2-maior que zero e menor que 13)
 numero menor que 1 encerra o processamento}
uses ex2modbiblio;
var num,aa:string[4]; //  8
    nome:string[35];  // 35
    cpf:string[11];   // 11
    dd,mm:string[2];  //  4
    cargo:string[2];  //  2 = 60 caracteres
    reg:string[60]; {01 - 04 - numero
                    05 - 39 - nome
                    40 - 50 - cpf
                    51 - 52 - dia
                    53 - 54 - mes
                    55 - 58 - ano
                    59 - 60 - cargo} 
    err,numi,a,b,t,di,mi,ai:integer;
    arql:text;
    aux:boolean;
    
//**************************************************************************************

BEGIN
  assign(arql,'cadastro.txt'); //liga nome logico ao físico
  append(arql);                //abre para acrescentar informações (apenas seq, texto)
  writeln; // ** acrescentei para pular linha e poder gravar o próximo registro
  Repeat
   write('num=>');
   readln(num); 
   val(num,numi,err);
   if(err>0) or (numi >3000) then
    writeln('ilegal');
  Until(err=0) and (numi<=3000);
  
  WHILE(numi>0) DO
   BEGIN
//preenche com zeros a esquerda os campos numéricos
    t:=length(num);
    for a:=1 to 4-t do      
     insert('0',num,1);// insere zeros à esquerda de num caso precise               
    insert(num,reg,1); //insere numero em reg na posição 1
    write('nome=>');
    readln(nome);
    nome:= upcase(nome);
//garantir que o nome tenha 35 caracteres inserindo espaços à direita se necessário
   t:=length(nome);
   for a:=t+1 to 35 do
    insert(' ',nome,a);
   insert(nome,reg,5); //insere nome em reg
//tem que validar CPF(não está)
    write('cpf=>');
    readln(cpf);
    insert(cpf,reg,40);
//TEM QUE VALIDAR A DATA 
    REPEAT
     aux:=true;
		 WRITE('DIA=>');
     READLN(DD);
     val(dd,di,err);  // garante que so entram digitos numéricos di eh dia em inteiro
     if(err > 0) then
		  aux:=false;
     WRITE('MES=>');
     READLN(MM);
     val(mm,mi,err);  // mi eh mes em integer
     if(err > 0) then
		  aux:=false;
     WRITE('ANO=>');
     READLN(AA);
     val(aa,ai,err); // ai eh ano em integer
     if(err > 0) then
		  aux:=false;
     if(aux) then   // se aux true so entraram dados numéricos até agora, top!
		  aux:=validata(di,mi,ai);
		 if(not aux) then
		  writeln('ilegal')
    UNTIL(aux);  // fim da validação da data de nascimento
//fim da validaçao que nao está
		for a:=1 to 2-length(dd) do //preenche com zeros à esquerda  usando for
		 insert('0',dd,1);          
		insert(dd,reg,51);
		if(mi<10) then         //idem usando if
		 insert('0',mm,1);
		insert(mm,reg,53);
		insert(aa,reg,55);
//validacao do cargo, que deve estar entre 1 e 12 incluindo estes
    Repeat
     write('cargo=>');
     readln(cargo);
     val(cargo,numi,err);
     if(err>0) or (numi >13) then
      writeln('ilegal');
    Until(err=0) and (numi<13) and (numi>0);
    
    if(numi<10)then        
		 insert('0',cargo,1);  
    insert(cargo,reg,59);
//
    writeln(arql,reg); // *** GRAVA FINALMENTE E LÊ O PRÓXIMO NÚMERO DE INSCRIÇÃO***
//
    repeat
     write('num=>');
     readln(num);
     val(num,numi,err);
     if(err>0) or (numi >3000) then
      writeln('ilegal');
    until(err=0) and (numi<=3000);  // não coloca num < 0 porque precisa p sair do laço
	END;// WHILE(numi>0) DO
	
	close(arql);//fecha o arquivo depois que já gravou os registros!
END.