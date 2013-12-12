%{
int num_linha = 1;
%}

%%

\/\*[^(\*\/)]*\*\/	;
\/\/[^\n]*\n 		;

algoritmo 		{return token_pr_pr_algoritmo;}
variáveis 		{return token_pr_variaveis;}
fim-variáveis 	{return token_pr_fim_variaveis;}
início			{return token_pr_inicio;}
fim 			{return token_pr_fim;}
inteiro 		{return token_pr_inteiro;}
inteiros 		{return token_pr_inteiros;}
caractere 		{return token_pr_caractere;}
caracteres 		{return token_pr_caracteres;}
real 			{return token_pr_real;}
reais 			{return token_pr_reais;}
literal 		{return token_pr_literal;}
lógico 			{return token_pr_logico;}
lógicos 		{return token_pr_logicos;}
matriz 			{return token_pr_matriz;}
se 				{return token_pr_se;}
então 			{return token_pr_entao;}
senão 			{return token_pr_senao;}
fim-se 			{return token_pr_fim_se;}
para 			{return token_pr_para;}
de 				{return token_pr_de;}
até 			{return token_pr_ate;}
faça 			{return token_pr_faca;}
fim-para 		{return token_pr_fim_faca;}
passo 			{return token_pr_passo;}
enquanto 		{return token_pr_enquanto;}
fim-enquanto 	{return token_pr_fim_enquanto;}
imprima 		{return token_pr_imprima;}
leia 			{return token_pr_leia;}
função 			{return token_pr_funcao;}
retorne 		{return token_pr_retorne;}
verdadeiro		{return token_pr_verdadeiro;}
falso			{return token_pr_falso;}
"e"				{return token_pr_e;}
"ou"			{return token_pr_ou;}

("+"|"-")?[0-9]+ |
0(x|X)[0-9a-fA-F]+ |
0(c|C)[0-7]+ |
0(b|B)[0-1]+ 				{return token_inteiro;}
("+"|-)?[0-9]"."[0-9]+ 		{return token_real;}
\'([^\\]|\\.)?\'			{return token_caractere;}
\"([^\"\\\n\r]|\\.)*\"		{return token_literal;}
"+"							{return token_soma;}
"-"							{return token_subtracao;}
"\/"						{return token_divisao;}
"\*"						{return token_multiplicacao;}
"++"						{return token_incrementador;}
"%"							{return token_divisao_inteira;}
">"							{return token_maior;}
">="						{return token_maior_igual;}
"<"							{return token_menor;}
"="							{return token_igual;}
"<>"						{return token_diferente;}
"&&"						{return token_e;}
"||"						{return token_ou;}
"!"							{return token_nao;}
"\""						{return token_aspas_dupla;}
"'"							{return token_aspas_simples;}
"("							{return token_abre_parenteses;}
")"							{return token_fecha_parenteses;}
"{"							{return token_abre_chaves;}
"}"							{return token_fecha_chaves;}
"#"							{return token_tralha;}
"\\"						{return token_contra_barra;}
"."							{return token_ponto;}
","							{return token_virgula;}
";"							{return token_dois_pontos;}
":"							{return token_ponto_virgula;}
":="						{return token_atribuicao;}
[a-zA-Z_][a-zA-Z0-9_]*		{return token_identificador;} 

[ \t]	;
\n	{nun_linha++;}

.	{return token_desconhecido;}

%%
