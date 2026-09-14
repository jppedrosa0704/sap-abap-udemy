REPORT ZCLASSE_010.

*PARAMETERS: p_pedido TYPE ebeln.
*PARAMETERS: p_r1 TYPE c RADIOBUTTON GROUP r1.
*PARAMETERS: p_r2 TYPE c RADIOBUTTON GROUP r1.
*
*DATA(lo_object1) = NEW zsubclasse01( ).
*DATA(lo_object2) = NEW zsubclasse02( ).
*
*IF p_r1 = 'X'.
*  LO_OBJECT1->EXIBIR(
*    EXPORTING
*      IV_PEDIDO     = p_pedido
*    IMPORTING
*      EV_TIPOPEDIDO = DATA(lv_tipopedido)
*      ).
*
*
*  WRITE: / |Tipo do pedido: { lv_tipopedido }|.
*ENDIF.
*
*if p_r2 = 'X'.
*  LO_OBJECT2->EXIBIR(
*    EXPORTING
*      IV_PEDIDO     = p_pedido
*    IMPORTING
*      EV_TIPOPEDIDO = DATA(lv_centro)
*      ).
*
*    WRITE: / |Tipo do pedido: { lv_centro }|.
*
*ENDIF.

PARAMETERS: p_pedido TYPE ebeln.
PARAMETERS: p_r1 TYPE c RADIOBUTTON GROUP r1,
            p_r2 TYPE c RADIOBUTTON GROUP r1.

DATA lo_object TYPE REF TO zclasse_abstrata.

IF p_r1 = 'X'.
  lo_object = NEW zsubclasse01( ).
else.
  lo_object = NEW zsubclasse02( ).
ENDIF.

lo_object->EXIBIR(
  EXPORTING
    iv_pedido = p_pedido
  IMPORTING
    ev_tipopedido = DATA(lv_resultado)
     ).

WRITE: / |Tipo do pedido: { lv_resultado }|.
