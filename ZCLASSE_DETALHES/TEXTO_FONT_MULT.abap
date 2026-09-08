method BUSCAR_MULT_PEDIDOS.

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
  WHERE cabecalho~ebeln IN @it_pedido
  ORDER BY cabecalho~ebeln, item~EBELN
  INTO CORRESPONDING FIELDS OF TABLE @ET_PEDIDOS.

 endmethod.
