REPORT ZSELECT_001.

*DATA: ls_produto TYPE mara.
*
*select SINGLE MATNR, MTART FROM mara INTO CORRESPONDING FIELDS OF @ls_produto.
*
* if sy-subrc = 0.
*   WRITE: / 'Material: ', ls_produto-matnr, 'Tipo:', ls_produto-mtart.
* ENDIF.


*DATA: lt_produto TYPE TABLE OF zproduto,
*      ls_produto TYPE zproduto.


*      SELECT COM MULTIPLOS FILTROS
*SELECT * from zproduto into TABLE lt_produto WHERE ( status = 'B' Or status = 'A' ) AND quantidade >= 2 AND produto LIKE '%o%'.
*
*    LOOP AT lt_produto into ls_produto .
*      WRITE: / ls_produto-id, ls_produto-produto, ls_produto-quantidade, ls_produto-valor, ls_produto-status.
*
*    ENDLOOP.

*SELECT * from zproduto into TABLE lt_produto WHERE produto in ('Notebook', 'Teclado').
**SELECT * from zproduto into TABLE lt_produto WHERE produto = 'Notebook' or produto = 'Teclado'.
*
*  LOOP AT lt_produto into ls_produto .
*    WRITE: / ls_produto-id, ls_produto-produto, ls_produto-quantidade, ls_produto-valor, ls_produto-status.
*
*  ENDLOOP.


*  SELECT DISTINCT

*DATA: lt_status_unicos TYPE TABLE OF zproduto-status.
*
*SELECT DISTINCT status FROM zproduto INTO TABLE lt_status_unicos.
*
*LOOP AT lt_status_unicos INTO DATA(lv_status).
*  WRITE: / lv_status.
*
*ENDLOOP.


"    ORDER BY
*DATA: lt_qtd_unicos TYPE TABLE OF zproduto-quantidade.
*
*SELECT DISTINCT quantidade FROM zproduto INTO TABLE lt_qtd_unicos ORDER BY quantidade DESCENDING.
*
*LOOP AT lt_qtd_unicos INTO DATA(lv_quantidade).
*  WRITE: / lv_quantidade.
*
*ENDLOOP.


*  SELECT DISTINCT

*DATA: lt_produto TYPE TABLE OF zproduto,
*      ls_produto TYPE zproduto.
*
*
**      SELECT COM MULTIPLOS FILTROS
*SELECT * from zproduto into TABLE lt_produto ORDER BY status valor.
*
*    LOOP AT lt_produto into ls_produto .
*      WRITE: / ls_produto-id, ls_produto-produto, ls_produto-quantidade, ls_produto-valor, ls_produto-status.
*
*    ENDLOOP.



*          SELECT com UP TO Rows
*DATA: lt_produto TYPE TABLE OF zproduto,
*      ls_produto TYPE zproduto.
*
*
*SELECT * from zproduto UP TO 3 ROWS into TABLE lt_produto ORDER BY id DESCENDING.
*
*    LOOP AT lt_produto into ls_produto .
*      WRITE: / ls_produto-id, ls_produto-produto, ls_produto-quantidade, ls_produto-valor, ls_produto-status.
*
*    ENDLOOP.

*     select com count.
*DATA: lv_total TYPE i.
*
*SELECT COUNT( * ) FROM zproduto WHERE status = 'A' into @lv_total.  "contagem de quantos produtos com status 'A'
*  WRITE lv_total.


* select com count e com o filto where
*DATA: lv_total TYPE i.
*
*SELECT COUNT( * ) FROM zproduto WHERE valor > 200  INTO @lv_total.
*  WRITE lv_total.


DATA: lv_resultado TYPE i.

SELECT SUM( valor ) FROM zproduto WHERE status = 'A' INTO @lv_resultado.
  WRITE lv_resultado.
