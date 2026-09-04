REPORT ZCLASSE_STATIC.


PARAMETERS: p_pedido TYPE EBELN.

ZCLASSE001_STATIC=>EXIBIR(
  EXPORTING
    IV_PEDIDO         = p_pedido
  IMPORTING
    EV_PEDIDO         = DATA(lv_pedido)
    EV_TIPO_PEDIDO    = DATA(lv_tipo_pedido)
    EV_CENTRO         = DATA(lv_centro)
    EV_DATA_CRIACAO   = DATA(lv_data_criacao)
    EV_COD_FORNECEDOR = DATA(lv_cod_fornecedor)
  EXCEPTIONS
    ENTRADA_ERRADA    = 1
    others            = 2 )
        .

IF SY-SUBRC <> 0.
  MESSAGE TEXT-000 TYPE 'I' DISPLAY LIKE 'E'.
ELSE.
  cl_demo_output=>display(
  |Pedido: { lv_pedido }\n| &&
  |Tipo: { lv_tipo_pedido }\n| &&
  |Centro: { lv_centro }\n| &&
  |Data de criação: { lv_data_criacao }\n| &&
  |Códido do fornecedor: { lv_cod_fornecedor }| ).

ENDIF.
