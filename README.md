Sistema básico de correção e gerenciamento de concurso implementado na
linguagem PASCAL

Este sistema foi implementado utilizando o compilador Pascalzim, fácil-
mente encontrado nos buscadores. Basta baixar para rodar o programa, o
compilador é muito leve.

O objetivo é mostrar como se utilizam registros e a manipulação de ar-
quivos nesta linguagem.

Segue a contextualização do problema:

A empresa FazTudo Ltda. irá realizar um concurso para preenchimento de vagas
em 12 cargos, conforme tabela abaixo:

COD                 DESCRIÇÃO DO CARGO                 (VAGAS)

1                   ENGANADOR DE CHEFE                  (20)
2                   ENROLADOR DE TRABALHO               (15)
3                   PENSADOR                            (17)
4                   ANALISTA DE SISTEMAS                (18)
5                   DEGUSTADOR DE CERVEJA               (15)
6                   TECNICO EM REDES                    (20)
7                   CONTADOR DE ESTORIAS                (14)
8                   PEDREIRO DE PRIMEIRA                (12)
9                   AÇOUGUEIRO LIMPINHO                 (17)
10                  SEGURANÇA DE BANHEIRO               (18)
11                  GESTOR DE BORBOLETAS                (17)
12                  AGENTE LEVA E TRAZ                  (20)

O concurso será realizado em uma única etapa, com prova de múltipla escolha com
90 questões assim distribuidas:

10 questões de L.E.M (1)                -----    Max 100 pontos (10 por acerto);
10 questões de matematica (2)           -----    Max 100 pontos (10 por acerto);
20 questões de lógica (3)                -----   Max 100 pontos (5 por acerto);
20 questões de conhe. espec. do cargo (4)  ----- Max 100 pontos (5 por acerto);
20 questões de informática (5)           -----   Max 100 pontos (5 por acerto);
10 questões de atualidades (6)          -----    Max 100 pontos (10 por acerto);

As vagas nos cargos serão preenchidas pela ordem decrescente da SOMA das notas
das 6 disciplinas, sendo critério de desempate pela ordem:

Maior nota em conhecimentos específicos do cargo (4);
Maior nota em informática (5);
Maior nota em lógica (3);
Maior nota em matemática (2);
Maior nota em atualidades (6);
Maior nota em lingua estrangeira moderna (1);
Maior idade.

O cadastro inicial deverá conter:

- Número de inscrição (4 dígitos) --- Validar (1 até 9999)
- Nome (35 caracteres)   
- CPF (11 dígitos)                --- Validar
- Data de nascimento (8 digitos)  --- Validar
- Cargo (2 dígitos)               --- Validar (1 até 12)    

===> Fim da contextualização

Caso deseje executar o sistema, seguir os seguintes passos:

1. Os arquivos devem estar na mesma pasta
2. O programa seq1.pas serve para gerar o arquivo CAND.txt. Contudo para
   evitar digitar tantos dados é disponibilizado o CAND.txt já pronto, ficando
   o arquivo seq1.pas apenas para verificação, não é necessário executá-lo.
3. Executar o programa GERIND.pas ; este arquivo abre o arquivo CAND.txt e cria
   o arquivo binário CAND.IND
4. Neste momento, já é possível visualizar o arquivo CAND.IND executando o ar-
   quivo N08.pas
5. Executar o arquivo marcafaltas.pas; este programa irá abrir o arquivo
   FALTAS.txt e a partir deste, ATUALIZAR o CAND.IND
6. Executar o programa N07.pas ; este programa irá abrir o arquivo PROVATRA.txt
   e a partir deste gera o arquivo texto notas.txt
7. Executar o programa N09.pas ; este programa abre o arquivo notas.txt e
   ATUALIZA os campos das notas no arquivo CAND.IND
8. Executar o programa N10_1.pas para ATUALIZAR os campos de classificação no
   arquivo CAND.IND
9. Executar o arquivo N10_2.pas para poder visualizar os candidatos classifica-
   dos e a ordem de classificação
