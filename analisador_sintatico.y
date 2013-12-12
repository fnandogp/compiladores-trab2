%{
#include <stdio.h>
%}

/*%error-verbose*/
%token token_pr_pr_algoritmo
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
%token token_pr_logico
%token token_pr_logicos
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
%token token_tralha
%token token_contra_barra
%token token_ponto
%token token_virgula
%token token_dois_pontos
%token token_ponto_virgula
%token token_atribuicao
%token token_identificador 

%start algoritmo

%%
algoritmo : ;

%%

#include "lex.yy.c"

main(){
	yyparse();
}

/* rotina de erro */
yyerror (){
	printf("Erro! Linha %d\n", nun_linha);
}

