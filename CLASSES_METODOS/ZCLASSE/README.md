📄 README.md — Projeto ABAP: Classe ZCLASSE001 + Programa ZCLASSE
🧩 Descrição do Projeto
Este repositório contém um exemplo simples e funcional de orientação a objetos em ABAP, utilizando:

Uma classe customizada ZCLASSE001

Um programa executável ZCLASSE

Tratamento de exceções definidas na classe

Instanciação de objetos

Retorno de dados via parâmetros IMPORTING

O objetivo é demonstrar como criar uma classe ABAP que recebe um número de pedido, valida a entrada e retorna informações relacionadas ao pedido.

🏗️ Estrutura do Projeto

/src
 ├── ZCLASSE001.clas.abap     # Classe ABAP com método EXIBIR
 └── ZCLASSE.prog.abap        # Programa ABAP que instancia a classe e chama o método
README.md

🧱 Classe: ZCLASSE001
A classe contém:

Método público EXIBIR

Exceção própria ENTRADA_ERRADA

Lógica para validar o número do pedido

Retorno de informações via parâmetros IMPORTING

✔ Exemplo de assinatura do método

METHODS exibir
  IMPORTING
    iv_pedido TYPE ebeln
  EXPORTING
    ev_pedido         TYPE ebeln
    ev_tipo_pedido    TYPE bsart
    ev_centro         TYPE bukrs
    ev_data_criacao   TYPE aedat
    ev_cod_fornecedor TYPE lifnr
  EXCEPTIONS
    entrada_errada.

✔ Levantando exceção dentro da classe

IF iv_pedido IS INITIAL.
  RAISE entrada_errada.
ENDIF.


▶️ Programa: ZCLASSE
O programa:

Instancia a classe

Verifica se o objeto foi criado (IS BOUND)

Chama o método EXIBIR

Trata exceções via SY-SUBRC

Exibe os dados retornados

✔ Código do programa

REPORT zclasse.

DATA: lv_pedido         TYPE ebeln,
      lv_tipo_pedido    TYPE bsart,
      lv_centro         TYPE bukrs,
      lv_data_criacao   TYPE aedat,
      lv_cod_fornecedor TYPE lifnr.

DATA: lo_object TYPE REF TO zclasse001.

PARAMETERS: p_pedido TYPE ebeln.

CREATE OBJECT lo_object.

IF lo_object IS NOT BOUND.
  MESSAGE 'Objeto não instanciado' TYPE 'E'.
  EXIT.
ELSE.
  MESSAGE 'Objeto instanciado' TYPE 'S'.
ENDIF.

CALL METHOD lo_object->exibir
  EXPORTING
    iv_pedido         = p_pedido
  IMPORTING
    ev_pedido         = lv_pedido
    ev_tipo_pedido    = lv_tipo_pedido
    ev_centro         = lv_centro
    ev_data_criacao   = lv_data_criacao
    ev_cod_fornecedor = lv_cod_fornecedor
  EXCEPTIONS
    entrada_errada = 1
    others         = 2.

IF sy-subrc <> 0.
  MESSAGE text-000 TYPE 'I' DISPLAY LIKE 'E'.
ELSE.
  WRITE: / lv_pedido,
         / lv_tipo_pedido,
         / lv_centro,
         / lv_data_criacao,
         / lv_cod_fornecedor.
ENDIF.


⚠️ Tratamento de Exceções
A exceção ENTRADA_ERRADA é levantada somente dentro da classe.

No programa, ela é tratada via SY-SUBRC:

SY-SUBRC = 1 → exceção ENTRADA_ERRADA

SY-SUBRC = 2 → erro genérico

SY-SUBRC = 0 → execução bem-sucedida

🚀 Como Executar
Criar a classe ZCLASSE001 no SE24

Criar o programa ZCLASSE no SE38

Ativar ambos

Executar o programa

Informar um número de pedido válido no parâmetro P_PEDIDO

📌 Objetivo Didático
Este projeto demonstra:

Instanciação de objetos em ABAP OO

Uso correto de IS BOUND

Tratamento de exceções definidas na classe

Comunicação entre programa e classe via parâmetros

Estrutura limpa e profissional para projetos ABAP

