📘 ZCLASSE_010 — Exemplo de Polimorfismo com Classe Abstrata e Subclasses Locais em ABAP
Este repositório demonstra uma implementação simples e prática de polimorfismo em ABAP, utilizando:

Classe abstrata local

Subclasses locais com REDEFINITION

Seleção dinâmica da classe via radiobuttons

Consulta à tabela EKKO para retornar informações diferentes conforme a subclasse escolhida

O objetivo é mostrar como estruturar código ABAP de forma limpa, orientada a objetos e facilmente extensível.

🎯 Objetivo
O programa permite que o usuário informe um número de pedido (EBELN) e escolha, através de radiobuttons, qual informação deseja consultar:

Subclasse 01 → retorna o tipo de pedido (BSART)

Subclasse 02 → retorna o centro/empresa (BUKRS)

A seleção determina qual classe será instanciada e qual lógica será executada.

🧱 Arquitetura do Código
🔹 1. Classe Abstrata (lcl_classe_abstrata)
Define o método abstrato exibir, que deve ser implementado pelas subclasses.

CLASS lcl_classe_abstrata DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS exibir ABSTRACT
      IMPORTING iv_pedido     TYPE ebeln
      EXPORTING ev_tipopedido TYPE bsart.
ENDCLASS.

🔹 2. Subclasse 01 — Retorna BSART

CLASS lcl_subclasse01 DEFINITION
  INHERITING FROM lcl_classe_abstrata FINAL.
  PUBLIC SECTION.
    METHODS exibir REDEFINITION.
ENDCLASS.

CLASS lcl_subclasse01 IMPLEMENTATION.
  METHOD exibir.
    SELECT SINGLE bsart
      FROM ekko
      INTO ev_tipopedido
      WHERE ebeln = iv_pedido.
  ENDMETHOD.
ENDCLASS.

🔹 3. Subclasse 02 — Retorna BUKRS

CLASS lcl_subclasse02 DEFINITION
  INHERITING FROM lcl_classe_abstrata FINAL.
  PUBLIC SECTION.
    METHODS exibir REDEFINITION.
ENDCLASS.

CLASS lcl_subclasse02 IMPLEMENTATION.
  METHOD exibir.
    SELECT SINGLE bukrs
      FROM ekko
      INTO ev_tipopedido
      WHERE ebeln = iv_pedido.
  ENDMETHOD.
ENDCLASS.

🔹 4. Report Principal (zclasse_010)

START-OF-SELECTION.
  DATA lo_object TYPE REF TO lcl_classe_abstrata.

  IF p_r1 = 'X'.
    lo_object = NEW lcl_subclasse01( ).
  ELSE.
    lo_object = NEW lcl_subclasse02( ).
  ENDIF.

  lo_object->exibir(
    EXPORTING iv_pedido = p_pedido
    IMPORTING ev_tipopedido = DATA(lv_resultado)
  ).

  WRITE: / lv_resultado.

  🔍 Como funciona
O usuário informa o número do pedido (EBELN).

Escolhe uma das opções:

R1 → Tipo do pedido (BSART)

R2 → Centro/Empresa (BUKRS)

O programa instancia a subclasse correspondente.

O método exibir é executado conforme a implementação da subclasse.

O resultado é exibido na tela.

🧠 Benefícios da Abordagem
✔ Código mais organizado e modular

✔ Fácil manutenção e expansão

✔ Evita duplicação de lógica

✔ Demonstra polimorfismo de forma clara

✔ Substituição simples de comportamentos via subclasses

📌 Possíveis Extensões
Criar novas subclasses para retornar outras colunas da EKKO

Implementar tratamento de erros e mensagens mais detalhadas

Adicionar testes unitários com ABAP Unit

Criar uma classe fábrica para instanciar automaticamente a subclasse correta

📎 Requisitos
SAP ECC ou S/4HANA

Acesso à tabela EKKO

ABAP OO habilitado no ambiente
