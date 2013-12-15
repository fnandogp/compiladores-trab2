%{
#include <stdio.h>
%}

/*%error-verbose*/
%token token_pr_algoritmo
%token token_pr_variaveis
%token token_pr_fim_variaveis
%token token_pr_inicio
%token token_pr_fim
%token token_pr_inteiro
%token token_pr_inteiros
%token token_pr_caractere
%token token_pr_caracteres
%token token_pr_real
%token token_pr_reais
%token token_pr_literal
%token token_pr_literais
%token token_pr_logico
%token token_pr_logicos
%token token_pr_matriz
%token token_pr_se
%token token_pr_entao
%token token_pr_senao
%token token_pr_fim_se
%token token_pr_para
%token token_pr_de
%token token_pr_ate
%token token_pr_faca
%token token_pr_passo
%token token_pr_fim_para
%token token_pr_enquanto
%token token_pr_fim_enquanto
%token token_pr_imprima
%token token_pr_leia
%token token_pr_funcao
%token token_pr_retorne
%token token_pr_verdadeiro
%token token_pr_falso
%token token_pr_e
%token token_pr_ou
%token token_pr_nao
%token token_inteiro;
%token token_real;
%token token_caractere
%token token_literal
%token token_soma
%token token_subtracao
%token token_divisao
%token token_multiplicacao
%token token_incrementador
%token token_modulo
%token token_maior
%token token_maior_igual
%token token_menor
%token token_menor_igual
%token token_igual
%token token_diferente
%token token_e
%token token_e_bit
%token token_ou
%token token_ou_bit
%token token_xor_bit
%token token_til
%token token_nao
%token token_aspas_dupla
%token token_aspas_simples
%token token_abre_parenteses
%token token_fecha_parenteses
%token token_abre_chaves
%token token_fecha_chaves
%token token_abre_colchetes
%token token_fecha_colchetes
%token token_tralha
%token token_contra_barra
%token token_ponto
%token token_virgula
%token token_dois_pontos
%token token_ponto_virgula
%token token_atribuicao
%token token_identificador 
%token token_desconhecido

%start algoritmo

%%


algoritmo
: declaracao_algoritmo bloco_variaveis bloco_inicio declacarao_funcoes
| declaracao_algoritmo bloco_variaveis bloco_inicio
;

declaracao_algoritmo
: token_pr_algoritmo token_identificador token_ponto_virgula
;

/*bloco de variaveis pode nao existir ou pode ser vazio*/
bloco_variaveis
: token_pr_variaveis declaracao_variaveis token_pr_fim_variaveis
| token_pr_variaveis token_pr_fim_variaveis
|
;

declaracao_variaveis
: lista_variaveis token_dois_pontos tipo_variavel token_ponto_virgula
| declaracao_variaveis lista_variaveis token_dois_pontos tipo_variavel token_ponto_virgula
;

tipo_variavel
: tipo_primitivo
| tipo_matriz
;

lista_variaveis
: lista_variaveis token_virgula token_identificador
| token_identificador
;

tipo_primitivo
: token_pr_inteiro
| token_pr_real
| token_pr_caractere
| token_pr_literal
| token_pr_logico
;

tipo_matriz
: token_pr_matriz matriz_colchetes token_pr_de tipo_primitivo_plural
;

matriz_colchetes
: matriz_colchetes token_abre_colchetes token_inteiro token_fecha_colchetes
| token_abre_colchetes token_inteiro token_fecha_colchetes
;

tipo_primitivo_plural
: token_pr_inteiros
| token_pr_reais
| token_pr_caracteres
| token_pr_literais
| token_pr_logicos
;

/*bloco inicio pode ser vazio*/
bloco_inicio
: token_pr_inicio lista_comandos token_pr_fim
| token_pr_inicio token_pr_fim
;

lista_comandos
: lista_comandos comando
| comando
;

comando
: atribuicao
| chamada_funcao
/*
*/
| comando_retorne
| comando_se
| comando_enquanto
| comando_para
;

valor_esquerda
: token_identificador
| token_identificador matriz_colchetes
;

atribuicao
: valor_esquerda token_atribuicao expressao token_ponto_virgula
;

comando_retorne
: token_pr_retorne token_ponto_virgula
| token_pr_retorne expressao token_ponto_virgula
;

comando_se
: token_pr_se expressao token_pr_entao lista_comandos token_pr_fim_se
| token_pr_se expressao token_pr_entao lista_comandos token_pr_senao lista_comandos token_pr_fim_se
;

comando_enquanto
: token_pr_enquanto expressao token_pr_faca lista_comandos token_pr_fim_enquanto
;

comando_para
: token_pr_para valor_esquerda token_pr_de expressao token_pr_ate expressao token_pr_faca lista_comandos token_pr_fim_para
| token_pr_para valor_esquerda token_pr_de expressao token_pr_ate expressao passo token_pr_faca lista_comandos token_pr_fim_para
;

passo
: token_pr_passo token_inteiro
| token_pr_passo token_soma token_inteiro
| token_pr_passo token_subtracao token_inteiro
;
/*
*/

expressao
: expressao token_pr_ou expressao
| expressao token_ou expressao
| expressao token_ou_bit expressao
| expressao token_pr_e expressao
| expressao token_e expressao
| expressao token_e_bit expressao
| expressao token_xor_bit expressao
| expressao token_igual expressao
| expressao token_diferente expressao
| expressao token_maior expressao
| expressao token_maior_igual expressao
| expressao token_menor expressao
| expressao token_menor_igual expressao
| expressao token_soma expressao
| expressao token_subtracao expressao
| expressao token_divisao expressao
| expressao token_multiplicacao expressao
| expressao token_modulo expressao
| token_soma termo
| token_subtracao termo
| token_til termo
| token_pr_nao termo
| termo
;

termo
: chamada_funcao
| chamada_funcao_interna
| valor_esquerda
| valor_primitivo
| token_abre_parenteses expressao token_fecha_parenteses
;

valor_primitivo
: token_literal
| token_inteiro
| token_real
| token_caractere
| token_pr_verdadeiro
| token_pr_falso
;

chamada_funcao
: token_identificador token_abre_parenteses paramentros_chamada_funcao token_fecha_parenteses token_ponto_virgula
| token_identificador token_abre_parenteses token_fecha_parenteses token_ponto_virgula
;

chamada_funcao_interna
: token_pr_imprima token_abre_parenteses parametros_imprima token_fecha_parenteses token_ponto_virgula
| token_pr_leia token_abre_parenteses token_fecha_parenteses token_ponto_virgula
;

parametros_imprima
: parametros_imprima token_virgula parametro_imprima
| parametro_imprima
;

parametro_imprima
: valor_primitivo
| token_identificador
;

paramentros_chamada_funcao
: paramentros_chamada_funcao token_virgula expressao
| expressao
;

declacarao_funcoes
: declacarao_funcoes declaracao_funcao
| declaracao_funcao
;

declaracao_funcao
: token_pr_funcao token_identificador paramentros_funcao_parenteses token_dois_pontos tipo_primitivo bloco_inicio
| token_pr_funcao token_identificador paramentros_funcao_parenteses bloco_inicio
;

paramentros_funcao_parenteses
: token_abre_parenteses paramentros_funcao token_fecha_parenteses
| token_abre_parenteses token_fecha_parenteses
;

paramentros_funcao
: paramentros_funcao token_virgula paramentro_funcao
| paramentro_funcao
;

paramentro_funcao
: token_identificador token_dois_pontos tipo_primitivo
| token_identificador token_dois_pontos tipo_matriz
;



%%

#include "lex.yy.c"

main(){
	yyparse();
}

/* rotina de erro */
yyerror (){
	printf("Erro! Linha %d\n", num_linha);
}