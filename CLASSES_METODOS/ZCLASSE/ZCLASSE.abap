*----------------------------------------------------------------------------  
*MÉTODO           TIPO         VISIBILIDADE             DESCRIÇÃO
*EXIBIR	    Instance Method	      Public	        Exbir detalhes do pedido
*----------------------------------------------------------------------------  

REPORT ZCLASSE.

*DATA: lv_pedido         TYPE EBELN,
*      lv_tipo_pedido    TYPE BSART,
*      lv_centro         TYPE BUKRS,
*      lv_data_criacao   TYPE AEDAT,
*      lv_cod_fornecedor TYPE LIFNR.

*DATA: lo_object TYPE REF TO ZCLASSE001.
DATA(lo_object) = NEW zclasse001( ).

PARAMETERS: p_pedido TYPE EBELN.

*CREATE OBJECT lo_object.

IF lo_object IS NOT BOUND.
  MESSAGE 'Objeto não instanciado' TYPE 'E'.
  EXIT.
ELSE.
  MESSAGE 'Objeto instanciado' TYPE 'S'.
ENDIF.

LO_OBJECT->EXIBIR(
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
*  WRITE: / lv_pedido,
*         / lv_tipo_pedido,
*         / lv_centro,
*         / lv_data_criacao,
*         / lv_cod_fornecedor.

  cl_demo_output=>display(
  |Pedido: { lv_pedido }\n| &&
  |Tipo: { lv_tipo_pedido }\n| &&
  |Centro: { lv_centro }\n| &&
  |Data de criação: { lv_data_criacao }\n| &&
  |Códido do fornecedor: { lv_cod_fornecedor }| ).

ENDIF.
