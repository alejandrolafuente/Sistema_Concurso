Program GERIND;
{FUP QUE A PARTIR DO ARQUIVO cand.txt GERE UM ARQUIVO PARA ACESSO INDEXADO cand.IND
 IR� USAR O CONCEITO DE TAMANHO DE REGISTRO QUE POSSUIR� OS CAMPOS:
 NUMERO=INTEGER, NOME=STRING[35], CPF=STRING[11], DATA=STRING[8], INVERTIDA AAAAMMDD, CARGO=INTEGER....
 veja bibliont.pas para a descri��o completa.
   ATEN��O     ATEN��O    ATEN��O    ATEN��O    ATEN��O    ATEN��O    ATEN��O    ATEN��O    
  S� � POSSIVEL VER O CONTE�DO DO ARQUIVO ATRAV�S DE UM PROGRAMA QUE IR� LER OS REGISTROS
	}
uses BIBLIONT;
VAR ARQS:TEXT;
    ARQD:FILE OF REGIS;
    REGS:STRING[60];
    REGD:REGIS;
    A,B,E,NUM:INTEGER;
//***************************************************************************************    
BEGIN
	writeln(A,B,E,NUM);
  ASSIGN(ARQS,'CAND.TXT');
  RESET(ARQS); // abre para leitura posicionando o ponteiro no in�cio do arquivo
  ASSIGN(ARQD,'CAND.IND');
  REWRITE(ARQD); // CRIA um arquivo bin�rio novo
  WHILE NOT EOF(ARQS) DO
   BEGIN
    READLN(ARQS,REGS);//RETIRA DO ARQ E LEVA PARA MP AS INFORMA�OES DE UM REGISTRO (CAND.TXT)
//MONTA O REGISTRO QUE IR� PARA ARQD
    VAL(COPY(REGS,1,4),NUM,E);//RETIRA O NUMERO DO STRING
    REGD.NUM:=NUM;//NUMERO
    REGD.NOME:=COPY(REGS,5,35);//NOME
    REGD.CPF:=COPY(REGS,40,11);//CPF
    REGD.DATA.ANO:=copy(regs,55,4); //ano
    REGD.DATA.MES:=COPY(REGS,53,2); //mes
    REGD.DATA.DIA:=COPY(REGS,51,2); //dia
    VAL(COPY(REGS,59,2),REGD.CAR,E);//CARGO
//POSICIONA
    SEEK(ARQD,A); //<<<<<<COMPARE COM O QUE GERA SAI.DIR (ARQDIR)
//GRAVA NA POSICAO FISICA INDICADA POR NUM (CAMPO CHAVE) - 1
    WRITE(ARQD,REGD);
		A:=A+1
	 END;
	 WRITELN('GRAVADOS=>',A:5,' REGISTROS--VEJA O TAMANHO DO ARQUIVO -SAI.IND- (ENTER PARA ENCERRAR)');
	 READLN;
	 CLOSE(ARQS);
	 CLOSE(ARQD);  
END.