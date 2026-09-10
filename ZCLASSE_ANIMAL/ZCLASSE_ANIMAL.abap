REPORT ZCLASSE_ANIMAL.

CLASS zcl_animal DEFINITION.
  PUBLIC SECTION.
    METHODS falar
      RETURNING VALUE(rv_texto) TYPE string.
ENDCLASS.

CLASS zcl_animal IMPLEMENTATION.
  METHOD falar.
    rv_texto = 'O animal faz um som'.
  ENDMETHOD.
ENDCLASS.

CLASS zcl_cachorro DEFINITION INHERITING FROM zcl_animal.
  PUBLIC SECTION.
  METHODS falar REDEFINITION.
ENDCLASS.

class zcl_cachorro IMPLEMENTATION.
  METHOD falar.
    rv_texto = 'O cachorro faz au au.'.
  ENDMETHOD.
ENDCLASS.

CLASS zcl_gato DEFINITION INHERITING FROM zcl_animal.
  PUBLIC SECTION.
  METHODS falar REDEFINITION.
ENDCLASS.

CLASS zcl_gato IMPLEMENTATION.
  METHOD falar.
    rv_texto = 'O gato faz miau.'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA(lo_animal) = NEW zcl_animal( ).
DATA(lo_cachorro) = NEW zcl_cachorro( ).
DATA(lo_gato) =  NEW zcl_gato( ).

WRITE: / lo_animal->falar( ).
WRITE: / lo_cachorro->falar( ).
WRITE: / lo_gato->falar( ).
