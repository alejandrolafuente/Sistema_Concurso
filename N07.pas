Program N07_ALEJANDRO;
uses crt;
type vetor = array[1..6] of integer;   
var arq1,arq2: text; // arq1 � PROVAOK.txt e arq2 � notas.txt
    reg1:string[94]; reg2: string[28]; gaba: string[90]; nn: string[4];
    a,x,i,aux,posi,ce: integer;  notas, questoes: vetor;
    
//******************************************************************************

Procedure abre_arquivos(var arq1,arq2: text);
Begin
 assign(arq1,'PROVATRA.txt');
 assign(arq2,'notas.txt');
 reset(arq1);
 rewrite(arq2);
End;

Procedure le_gabarito(var gaba: string[90]);
 var chav: boolean; i: integer; 
Begin
 Repeat
  writeln('Digite o gabarito:');
  readln(gaba);
	gaba:= upcase(gaba);
	i:= 0;
	chav:= true;
	Repeat
	 i:= i+1;
	 if(gaba[i]<'A') or (gaba[i]>'E')then
	  chav:= false;
	Until(i = 90) or (not chav);
	If not chav then
	 writeln('gabarito ilegal');
 Until(chav);
End;
//******************************************************************************
		
BEGIN
 abre_arquivos(arq1,arq2);
 le_gabarito(gaba);
 questoes[1]:= 10; questoes[2]:= 10 ; questoes[3]:= 20; questoes[4]:=20;
 questoes[5]:= 20; questoes[6]:= 10; 
 a:= 0; 
 REPEAT
  posi:= 1;
  aux:= 0;
  readln(arq1,reg1); 
  a:= a + 1;  
  insert(copy(reg1,1,4),reg2,posi); 
  FOR X:= 1 TO 6 DO
  BEGIN
   ce:= 0; posi:= posi + 4;
   For i:= 1 to questoes[x] do
   Begin
    aux:= aux + 1;
    if gaba[aux] = reg1[aux+4] then      
     ce:= ce + 1;
   End;
   notas[x]:= ce * (100 div questoes[x]);        
   str(notas[x]:4,nn);
   insert(nn,reg2,posi);
  END;
  writeln(arq2,reg2);
 UNTIL(EoF(arq1));
 close(arq1);
 close(arq2);
 writeln('Registros lidos: ',a:7);
 writeln('Enter para finalizar...');
 readln;
END.









    