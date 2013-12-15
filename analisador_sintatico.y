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
%token token_pr_fim_faca
%token token_pr_passo
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
%token token_inteiro;
%token token_real;
%token token_caractere
%token token_literal
%token token_soma
%token token_subtracao
%token token_divisao
%token token_multiplicacao
%token token_incrementador
%token token_divisao_inteira
%token token_maior
%token token_maior_igual
%token token_menor
%token token_igual
%token token_diferente
%token token_e
%token token_ou
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
: declaracao_algoritmo bloco_variaveis bloco_inicio
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

/*bloco inicio pode nao existir ou pode ser vazio*/
bloco_inicio
: token_pr_inicio lista_comandos token_pr_fim
| token_pr_inicio token_pr_fim
|
;

lista_comandos
:
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