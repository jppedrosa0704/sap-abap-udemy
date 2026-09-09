📘 README — Como criar uma classe local em ABAP
Este guia explica, de forma prática, como criar, implementar e utilizar uma classe local dentro de um REPORT ABAP.

🧩 O que é uma classe local?
Uma classe local é uma classe definida dentro do próprio programa (REPORT).
Ela só existe ali e não pode ser usada por outros objetos do sistema.

É útil para:

Organizar melhor o código

Encapsular lógica

Criar métodos reutilizáveis dentro do mesmo programa

🏗️ Estrutura básica de uma classe local
Uma classe local tem duas partes:

DEFINITION → “O que a classe sabe fazer”

IMPLEMENTATION → “Como ela faz”

Exemplo:

CLASS lcl_exemplo DEFINITION.
  PUBLIC SECTION.
    METHODS meu_metodo.
ENDCLASS.

CLASS lcl_exemplo IMPLEMENTATION.
  METHOD meu_metodo.
    WRITE: / 'Executando o método da classe local'.
  ENDMETHOD.
ENDCLASS.

🚀 Como usar a classe local no programa
Depois de definir e implementar a classe, você cria uma instância:

DATA(lo_objeto) = NEW lcl_exemplo( ).

E chama o método:

lo_objeto->meu_metodo( ).

📌 Regras importantes
A classe deve ser definida antes do START-OF-SELECTION.

A implementação deve vir logo após a definição.

Métodos só podem ser chamados depois que a classe foi totalmente declarada.

Classes locais são visíveis somente dentro do REPORT.

🎯 Criando uma nova classe local (exemplo para cálculo)
Se quiser criar uma classe local para cálculos:

CLASS lcl_calculo DEFINITION.
  PUBLIC SECTION.
    METHODS somar
      IMPORTING iv_a TYPE i
                iv_b TYPE i
      RETURNING VALUE(rv_result) TYPE i.
ENDCLASS.

CLASS lcl_calculo IMPLEMENTATION.
  METHOD somar.
    rv_result = iv_a + iv_b.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA(lo_calc) = NEW lcl_calculo( ).
DATA(lv_total) = lo_calc->somar( 2 3 ).

WRITE: / 'Resultado:', lv_total.


