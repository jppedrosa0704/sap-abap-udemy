*&---------------------------------------------------------------------*
REPORT zclasse_010.

PARAMETERS: p_pedido TYPE ebeln.
PARAMETERS: p_r1 TYPE c RADIOBUTTON GROUP r1.
PARAMETERS: p_r2 TYPE c RADIOBUTTON GROUP r1.


* Classe Local Abstrata
CLASS lcl_classe_abstrata DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS exibir ABSTRACT
      IMPORTING iv_pedido     TYPE ebeln
      EXPORTING ev_tipopedido TYPE bsart.
    
ENDCLASS.

* Subclasse 01
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



* Subclasse 02
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
