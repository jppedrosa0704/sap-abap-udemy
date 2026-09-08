method BUSCAR_DADOS.
* ABAP MODERNO

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


*ABAP moderno (mais recente)

*    SELECT FROM ekko AS cabecalho
*        INNER JOIN ekpo AS item
*           ON item~ebeln = cabecalho~ebeln
*      FIELDS cabecalho~ebeln,
*             cabecalho~bsart,
*             cabecalho~bukrs,
*             cabecalho~aedat,
*             cabecalho~lifnr,
*             item~ebelp,
*             item~matnr,
*             item~menge,
*             item~meins
*      WHERE cabecalho~ebeln = @iv_pedido
*      ORDER BY cabecalho~ebeln, item~ebelp
*      INTO CORRESPONDING FIELDS OF TABLE @et_pedidos.



* ABAP ANTIGO

*    "recebe a estrutura da EKKO (Documento de compras)
*  TYPES: BEGIN OF lty_data,
*                EBELN TYPE EBELN,
*                BSART TYPE BSART,
*                BUKRS TYPE BUKRS,
*                AEDAT TYPE AEDAT,
*                LIFNR TYPE LIFNR,
*         END OF lty_data.
*
*" Internal Table - Tabela interna / Work Area - Área de Trabalho
*  DATA: lt_data TYPE TABLE OF lty_data,
*        lwa_data TYPE lty_data.
*
*  DATA: lwa_output TYPE ZSTR_DETALHES.
*
*  "recebe a estrutura da EKPO (itens do documento de compra)
*  TYPES: BEGIN OF lty_data1,
*               EBELN TYPE EBELN,
*               EBELP TYPE EBELP,
*               MATNR TYPE MATNR,
*               MENGE TYPE BSTMG,
*               MEINS TYPE BSTME,
*         END OF lty_data1.
*
*" Internal Table - Tabela interna / Work Area - Área de Trabalho
*  DATA: lt_data1 TYPE TABLE OF lty_data1,
*        lwa_data1 TYPE lty_data1.
*
*  SELECT EBELN BSART BUKRS AEDAT LIFNR
*    FROM EKKO " Cabeçalho do documento de compras
*    INTO TABLE lt_data
*    WHERE ebeln = iv_pedido.
*
*
*  IF lt_data IS NOT INITIAL.
*     SELECT EBELN EBELP MATNR MENGE MEINS
*     FROM EKPO "Item do documento de compras
*     INTO TABLE lt_data1
*     FOR ALL ENTRIES IN lt_data
*     WHERE ebeln = lt_data-EBELN.
*
*   ENDIF.
*
*  LOOP AT lt_data INTO lwa_data.
*    LOOP AT lt_data1 INTO lwa_data1 WHERE ebeln = lwa_data-ebeln.
*      lwa_output-EBELN = lwa_data-EBELN.
*      lwa_output-BSART = lwa_data-BSART.
*      lwa_output-BUKRS = lwa_data-BUKRS.
*      lwa_output-AEDAT = lwa_data-AEDAT.
*      lwa_output-LIFNR = lwa_data-LIFNR.
*
*      lwa_output-EBELP = lwa_data1-EBELP.
*      lwa_output-MATNR = lwa_data1-MATNR.
*      lwa_output-MENGE = lwa_data1-MENGE.
*      lwa_output-MEINS = lwa_data1-MEINS.
*      APPEND lwa_output TO ET_PEDIDOS.
*      CLEAR: lwa_output.
*    ENDLOOP.
*  ENDLOOP.


endmethod.
