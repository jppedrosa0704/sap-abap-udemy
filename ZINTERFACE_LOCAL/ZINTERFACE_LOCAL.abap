REPORT ZPROGRAMAINTERFACE.

PARAMETERS p_pedido TYPE ebeln.
PARAMETERS: pr1 RADIOBUTTON GROUP r1,
            pr2 RADIOBUTTON GROUP r1.

INTERFACE lif_exemplo.

  METHODS exibir
    IMPORTING iv_pedido TYPE ebeln
    EXPORTING ev_tipopedido TYPE BSART.

ENDINTERFACE.

CLASS ZCLASSE_FILHA1 DEFINITION.
  PUBLIC SECTION.
  INTERFACES lif_exemplo.
ENDCLASS.

CLASS ZCLASSE_FILHA1 IMPLEMENTATION.
  METHOD lif_exemplo~exibir.
    SELECT SINGLE BSART
      FROM EKKO
      INTO ev_tipopedido
      WHERE ebeln = iv_pedido.
  ENDMETHOD.
ENDCLASS.

CLASS ZCLASSE_FILHA2 DEFINITION.
  PUBLIC SECTION.
  INTERFACES lif_exemplo.
ENDCLASS.

CLASS ZCLASSE_FILHA2 IMPLEMENTATION.

  METHOD lif_exemplo~exibir.
    SELECT SINGLE Bukrs
      FROM EKKO
      INTO ev_tipopedido
      WHERE ebeln = iv_pedido.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA lo_object TYPE REF TO lif_exemplo.

  IF pr1 = 'X'.
    lo_object = NEW ZCLASSE_FILHA1( ).
  ELSE.
    lo_object = NEW ZCLASSE_FILHA2( ).
  ENDIF.

  lo_object->EXIBIR(
    EXPORTING
      iv_pedido = p_pedido
    IMPORTING
      ev_tipopedido = DATA(lv_resultado)
  ).

  WRITE: /'Tipo de pedido', / lv_resultado.
