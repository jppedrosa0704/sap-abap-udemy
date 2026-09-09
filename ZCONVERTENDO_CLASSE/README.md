📘 README — Convertendo uma Classe Global para Classe Local em ABAP
Este documento explica como converter uma classe global ABAP (mantida na SE24) para uma classe local dentro de um programa (REPORT). O exemplo utilizado é a classe responsável por buscar dados de documentos de compras (EKKO/EKPO) e exibir o resultado via ALV.

🎯 Objetivo
Transformar uma classe global existente (ZCLASSE_DETALHES) em uma classe local, mantendo:

A mesma lógica de negócio

A mesma assinatura de métodos

A mesma estrutura de dados

O mesmo tratamento de exceções

A motivação pode ser:

Facilitar testes

Criar um programa independente

Evitar dependências de objetos globais

Prototipar rapidamente uma solução

🧩 O que foi convertido
A classe global possuía um método BUSCAR_DADOS que:

Recebia um número de pedido (EBELN)

Consultava tabelas EKKO e EKPO

Retornava uma tabela interna com os detalhes (ZTSTR_DETALHES)

Levantava exceção ENTRADA_ERRADA quando o pedido não existia

Toda essa estrutura foi replicada como classe local dentro do REPORT.

🏗️ Estrutura da Classe Local
1. Definição da classe

CLASS lcl_pedidos DEFINITION.
  PUBLIC SECTION.
    METHODS BUSCAR_DADOS
      IMPORTING IV_PEDIDO TYPE EBELN
      EXPORTING ET_PEDIDOS TYPE ZTSTR_DETALHES
      EXCEPTIONS ENTRADA_ERRADA.
ENDCLASS.

Nome da classe local (lcl_pedidos)

Método público BUSCAR_DADOS

Parâmetros de entrada e saída

Exceção própria

2. Implementação da classe

CLASS lcl_pedidos IMPLEMENTATION.
  METHOD BUSCAR_DADOS.
    SELECT ...
      INTO CORRESPONDING FIELDS OF TABLE @ET_PEDIDOS.

    IF sy-subrc <> 0.
      RAISE ENTRADA_ERRADA.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

A lógica é idêntica à da classe global:

SELECT com JOIN entre EKKO e EKPO

Preenchimento da tabela de saída

Levantamento da exceção caso não haja dados


   
