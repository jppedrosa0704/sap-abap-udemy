REPORT ZCLASSE.

DATA: lv_pedido         TYPE EBELN,
      lv_tipo_pedido    TYPE BSART,
      lv_centro         TYPE BUKRS,
      lv_data_criacao   TYPE AEDAT,
      lv_cod_fornecedor TYPE LIFNR.

DATA: lo_object TYPE REF TO ZCLASSE001.

PARAMETERS: p_pedido TYPE EBELN.

CREATE OBJECT lo_object.

IF lo_object IS NOT BOUND.
  MESSAGE 'Objeto não instanciado' TYPE 'E'.
  EXIT.
ELSE.
  MESSAGE 'Objeto instanciado' TYPE 'S'.
ENDIF.

CALL METHOD LO_OBJECT->EXIBIR
  EXPORTING
    IV_PEDIDO         = p_pedido
  IMPORTING
    EV_PEDIDO         = lv_pedido
    EV_TIPO_PEDIDO    = lv_tipo_pedido
    EV_CENTRO         = lv_centro
    EV_DATA_CRIACAO   = lv_data_criacao
    EV_COD_FORNECEDOR = lv_cod_fornecedor
  EXCEPTIONS
    ENTRADA_ERRADA    = 1
    others            = 2
        .

IF SY-SUBRC <> 0.
  MESSAGE TEXT-000 TYPE 'I' DISPLAY LIKE 'E'.
ELSE.
  WRITE: / lv_pedido,
         / lv_tipo_pedido,
         / lv_centro,
         / lv_data_criacao,
         / lv_cod_fornecedor.
ENDIF.
