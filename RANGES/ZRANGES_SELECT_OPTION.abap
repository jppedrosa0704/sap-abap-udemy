REPORT ZRANGES_SELECT_OPTION.

TABLES: zproduto.

DATA: lt_produtos TYPE TABLE OF zproduto,
      ls_produto TYPE zproduto.

SELECT-OPTIONS s_id FOR zproduto-id.

SELECT * from zproduto
  WHERE id in @s_id
  ORDER BY id
  INTO TABLE @lt_produtos.

if lt_produtos IS INITIAL.
  WRITE 'nenhum registro encontrado.'.
ELSE.
  WRITE 'Registro Encontrado'.

  LOOP AT lt_produtos INTO ls_produto.
    WRITE: / ls_produto-ID,
             ls_produto-PRODUTO,
             ls_produto-QUANTIDADE,
             ls_produto-VALOR,
             ls_produto-STATUS.
  ENDLOOP.

ENDIF.
