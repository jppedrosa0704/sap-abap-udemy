*&---------------------------------------------------------------------*
*& Report ZCLASSE_LOCAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zclasse_local.

PARAMETERS: p_pedido TYPE ebeln.

CLASS lcl_pedidos DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS buscar_dados
      IMPORTING  iv_pedido  TYPE ebeln
      EXPORTING  et_pedidos TYPE ztstr_detalhes
      EXCEPTIONS entrada_errada.

ENDCLASS.

CLASS lcl_pedidos IMPLEMENTATION.

  METHOD buscar_dados.

    SELECT cabecalho~ebeln,
           cabecalho~bsart,
           cabecalho~bukrs,
           cabecalho~aedat,
           cabecalho~lifnr,
           item~ebelp,
           item~matnr,
           item~menge,
           item~meins
      FROM ekko AS cabecalho
      INNER JOIN ekpo AS item
        ON item~ebeln = cabecalho~ebeln
      WHERE cabecalho~ebeln = @iv_pedido
      ORDER BY cabecalho~ebeln, item~ebelp
      INTO CORRESPONDING FIELDS OF TABLE @et_pedidos.


    IF sy-subrc <> 0.
      RAISE entrada_errada.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.


 lcl_pedidos=>buscar_dados(
    EXPORTING
      iv_pedido  = p_pedido
    IMPORTING
      et_pedidos = DATA(lt_pedidos)
    EXCEPTIONS
      entrada_errada = 1
      OTHERS = 2
  ).

  IF lt_pedidos IS INITIAL.

    MESSAGE 'Documento não encontrado!' TYPE 'I' DISPLAY LIKE 'E'.

  ELSE.

    TRY.
        cl_salv_table=>factory(
          IMPORTING
            r_salv_table = DATA(lo_alv)
          CHANGING
            t_table      = lt_pedidos ).

        lo_alv->get_columns( )->set_optimize( abap_true ).
        lo_alv->display( ).

      CATCH cx_salv_msg INTO DATA(lx_erro).
        MESSAGE lx_erro->get_text( ) TYPE 'I' DISPLAY LIKE 'E'.

    ENDTRY.

  ENDIF.
