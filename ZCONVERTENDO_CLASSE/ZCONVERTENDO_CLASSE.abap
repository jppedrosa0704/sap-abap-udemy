REPORT ZCONVERTENDO_CLASSE.

PARAMETERS: p_pedido TYPE EBELN.

CLASS lcl_pedidos DEFINITION.
  PUBLIC SECTION.
  METHODS BUSCAR_DADOS
    IMPORTING IV_PEDIDO TYPE EBELN
    EXPORTING ET_PEDIDOS TYPE ZTSTR_DETALHES
    EXCEPTIONS ENTRADA_ERRADA.
ENDCLASS.

CLASS lcl_pedidos IMPLEMENTATION.
  METHOD BUSCAR_DADOS. " buscar os dados do  método na se24 na classe ZCLASSE_DETALHES.
    SELECT cabecalho~EBELN,
       cabecalho~BSART,
       cabecalho~BUKRS,
       cabecalho~AEDAT,
       cabecalho~LIFNR,
       item~EBELP,
       item~MATNR,
       item~MENGE,
       item~MEINS
    FROM EKKO as cabecalho
      INNER JOIN EKPO as item
        on item~EBELN = cabecalho~EBELN
    WHERE cabecalho~ebeln = @iv_pedido
    ORDER BY cabecalho~ebeln, item~EBELN
    INTO CORRESPONDING FIELDS OF TABLE @ET_PEDIDOS.

    IF sy-subrc <> 0.
      RAISE ENTRADA_ERRADA.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA(lo_object) = NEW lcl_pedidos( ).

lo_object->BUSCAR_DADOS(
  EXPORTING
    IV_PEDIDO = p_pedido
  IMPORTING
    ET_PEDIDOS = DATA(lt_pedidos)
  EXCEPTIONS ENTRADA_ERRADA = 1
  OTHERS = 2
 ).

if lt_pedidos is INITIAL.
  MESSAGE 'documento não encontrado' TYPE 'I' DISPLAY LIKE 'E'.

ELSE.
*  LOOP AT lt_pedidos INTO DATA(lwa_pedidos). " dados pego na SE38 repor: ZPEDIDOS_COMPRA
*    WRITE: / lwa_pedidos-ebeln,
*             lwa_pedidos-ebelp,
*             lwa_pedidos-bsart,
*             lwa_pedidos-bukrs,
*             lwa_pedidos-aedat,
*             lwa_pedidos-lifnr,
*             lwa_pedidos-matnr,
*             lwa_pedidos-menge,
*             lwa_pedidos-meins.
*  ENDLOOP.
  TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = DATA(lo_alv)
      CHANGING
        t_table = lt_pedidos ).
    lo_alv->get_columns( )->set_optimize( abap_true ).
    lo_alv->display( ).
    CATCH cx_salv_msg INTO DATA(lx_erro).
      MESSAGE lx_erro->get_text( ) TYPE 'I' DISPLAY LIKE 'E'.
   ENDTRY.
ENDIF.
