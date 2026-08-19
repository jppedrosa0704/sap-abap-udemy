REPORT ZMODIFY_001.

"MODIFY - quando o registro não existe, ele cria um novo
"MODIFY - quando o registro já existe, ele substitui.
DATA ls_produto TYPE zproduto.

ls_produto-ID = 2.
ls_produto-PRODUTO = 'mouse'.
ls_produto-QUANTIDADE = 8.
ls_produto-VALOR = 200.
ls_produto-status = 'A'.

MODIFY zproduto FROM ls_produto.
