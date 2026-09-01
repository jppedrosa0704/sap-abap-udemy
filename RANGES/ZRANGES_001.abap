REPORT ZRANGES_001.

DATA: lt_produtos TYPE TABLE OF zproduto,
      ls_produto TYPE zproduto.

RANGES: r_id for zproduto-id.

" incluir ids de 1 até 10.
r_id-SIGN = 'I'. "incluir  include
r_id-OPTION = 'BT'. "Entre
r_id-LOW = '1'.
r_id-HIGH = '10'.
APPEND r_id.

"Excluir ids do 5 até 7
r_id-SIGN = 'E'. "Excluir  exclude
r_id-OPTION = 'BT'. "Entre
r_id-LOW = '5'.
r_id-HIGH = '7'.
APPEND r_id.

" Incluir o ID 20
r_id-SIGN = 'I'. " Incluir Include
r_id-OPTION = 'EQ'. "Igual Equal
r_id-LOW = '20'.
APPEND r_id.

SELECT * FROM zproduto
  WHERE id IN @r_id
  ORDER BY ID
  into TABLE @lt_produtos.

IF lt_produtos IS INITIAL.
  WRITE 'nenhum registro encontrado com os critérios encontrados.'.
ELSE.
  WRITE 'Registros encontrados'.
  ULINE.

  LOOP AT lt_produtos into ls_produto.
    WRITE: /  'ID: ', ls_produto-ID,
              'produto: ', ls_produto-PRODUTO,
              'Quantidade: ', ls_produto-QUANTIDADE,
              'Valor: ', ls_produto-VALOR,
              'Status: ', ls_produto-STATUS.
  ENDLOOP.
ENDIF.
