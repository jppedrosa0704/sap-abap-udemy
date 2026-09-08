REPORT ZPEDIDOS_COMPRA.

PARAMETERS: p_pedido type ebeln.

DATA(lo_object) = NEW ZCLASSE_DETALHES( ).


LO_OBJECT->BUSCAR_DADOS(
  EXPORTING
    IV_PEDIDO  = p_pedido
  IMPORTING
    ET_PEDIDOS = DATA(lt_pedidos)
    ).

if lt_pedidos is INITIAL.
  MESSAGE 'documento não encontrado' TYPE 'I' DISPLAY LIKE 'E'.

ELSE.
  LOOP AT lt_pedidos INTO DATA(lwa_pedidos).
    WRITE: / lwa_pedidos-ebeln,
             lwa_pedidos-ebelp,
             lwa_pedidos-bsart,
             lwa_pedidos-bukrs,
             lwa_pedidos-aedat,
             lwa_pedidos-lifnr,
             lwa_pedidos-matnr,
             lwa_pedidos-menge,
             lwa_pedidos-meins.
  ENDLOOP.

*    cl_salv_table=>factory(
*  IMPORTING r_salv_table = DATA(lo_alv)
*    CHANGING t_table = lt_pedidos ).
*  lo_alv->get_columns( )->set_optimize( abap_true ).
*  lo_alv->display( ).

ENDIF.
