REPORT ZCLASSE_LOCAL.

* Definindo a classe - "O que a classe sabe fazer"
CLASS lcl_pedidos DEFINITION.
  PUBLIC SECTION.
  METHODS dizer_ola.
ENDCLASS.

CLASS lcl_pedidos IMPLEMENTATION.
  METHOD dizer_ola.
    WRITE: / 'Olá! Eu sou um método de uma classe local'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA(lo_pedidos) = NEW lcl_pedidos( ).

lo_pedidos->dizer_ola( ).
