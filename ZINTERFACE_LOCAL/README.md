📘 ZPROGRAMAINTERFACE — Exemplo de Polimorfismo com Interface e Classes Filhas em ABAP
Este projeto demonstra como implementar polimorfismo em ABAP utilizando:

Uma interface (lif_exemplo)

Duas classes filhas que implementam essa interface

Seleção dinâmica da classe via radiobuttons

Consulta à tabela EKKO para retornar informações diferentes conforme a classe escolhida

O objetivo é apresentar uma arquitetura simples, limpa e orientada a objetos, mostrando como interfaces permitem padronizar comportamentos entre múltiplas classes.

🎯 Objetivo
O programa permite que o usuário informe um número de pedido (EBELN) e escolha, através de radiobuttons, qual informação deseja consultar:

Classe Filha 1 → retorna o tipo de pedido (BSART)

Classe Filha 2 → retorna o centro/empresa (BUKRS)

A seleção determina qual classe será instanciada e qual lógica será executada.

🧱 Arquitetura do Código
🔹 1. Interface (lif_exemplo)
Define o método exibir, que deve ser implementado por todas as classes que utilizarem a interface.

abap
INTERFACE lif_exemplo.

  METHODS exibir
    IMPORTING iv_pedido TYPE ebeln
    EXPORTING ev_tipopedido TYPE bsart.

ENDINTERFACE.
🔹 2. Classe Filha 1 — Retorna BSART
abap
CLASS ZCLASSE_FILHA1 DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_exemplo.
ENDCLASS.

CLASS ZCLASSE_FILHA1 IMPLEMENTATION.
  METHOD lif_exemplo~exibir.
    SELECT SINGLE bsart
      FROM ekko
      INTO ev_tipopedido
      WHERE ebeln = iv_pedido.
  ENDMETHOD.
ENDCLASS.
🔹 3. Classe Filha 2 — Retorna BUKRS
abap
CLASS ZCLASSE_FILHA2 DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_exemplo.
ENDCLASS.

CLASS ZCLASSE_FILHA2 IMPLEMENTATION.
  METHOD lif_exemplo~exibir.
    SELECT SINGLE bukrs
      FROM ekko
      INTO ev_tipopedido
      WHERE ebeln = iv_pedido.
  ENDMETHOD.
ENDCLASS.
🔹 4. Report Principal (ZPROGRAMAINTERFACE)
abap
START-OF-SELECTION.

  DATA lo_object TYPE REF TO lif_exemplo.

  IF pr1 = 'X'.
    lo_object = NEW ZCLASSE_FILHA1( ).
  ELSE.
    lo_object = NEW ZCLASSE_FILHA2( ).
  ENDIF.

  lo_object->exibir(
    EXPORTING iv_pedido = p_pedido
    IMPORTING ev_tipopedido = DATA(lv_resultado)
  ).

  WRITE: / 'Tipo de pedido', / lv_resultado.
🔍 Como funciona
O usuário informa o número do pedido (EBELN).

Escolhe uma das opções:

R1 → Tipo do pedido (BSART)

R2 → Centro/Empresa (BUKRS)

O programa instancia a classe correspondente.

O método exibir é executado conforme a implementação da classe.

O resultado é exibido na tela.

🧠 Benefícios da Abordagem com Interface
✔ Padronização de métodos entre múltiplas classes

✔ Flexibilidade para adicionar novas implementações

✔ Código mais modular e organizado

✔ Polimorfismo aplicado de forma clara

✔ Redução de dependência entre classes

📌 Possíveis Extensões
Criar novas classes filhas para retornar outras colunas da EKKO

Implementar tratamento de erros e mensagens mais detalhadas

Criar uma classe fábrica para instanciar automaticamente a implementação correta

Adicionar testes unitários com ABAP Unit

📎 Requisitos
SAP ECC ou S/4HANA

Acesso à tabela EKKO

ABAP OO habilitado no ambiente
