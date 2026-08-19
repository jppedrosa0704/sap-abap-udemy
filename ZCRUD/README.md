📂 Estrutura da Tabela ZPRODUTO
A tabela ZPRODUTO possui os seguintes campos:

A tabela ZPRODUTO possui os seguintes campos:

Campo	        Tipo	   Chave	Descrição
MANDT	        CLNT	    ✔	    Mandante
ID	          CHAR1	    ✔	    Código do produto
PRODUTO	      CHAR20	  ✖	    Nome do produto
QUANTIDADE	  INT4	    ✖	    Quantidade em estoque
VALOR	        DEC	      ✖	    Valor unitário
STATUS	      CHAR1	    ✖	    Código de status


📌 Programas incluídos
🟢 ZINSERT_001 — Inserção de Registros
Este programa demonstra duas formas de inserir dados:

✔ Inserção manual com estrutura
abap
DATA: lt_inserir TYPE STANDARD TABLE OF zproduto.

APPEND VALUE zproduto( id = 1 produto = 'teclado' quantidade = 2 valor = 150 status = 'A' ) TO lt_inserir.
APPEND VALUE zproduto( id = 2 produto = 'mouse' quantidade = 5 valor = 80 status = 'A' ) TO lt_inserir.
...
INSERT zproduto FROM TABLE lt_inserir.
✔ Limpeza da tabela antes da inserção
abap
DELETE FROM zproduto.


🔵 ZSELECT_001 — Consultas SQL (SELECT)
Este programa demonstra:

✔ SELECT com múltiplos filtros
abap
SELECT * FROM zproduto INTO TABLE lt_produto
 WHERE ( status = 'B' OR status = 'A' )
   AND quantidade >= 2
   AND produto LIKE '%o%'.
✔ SELECT com IN
abap
SELECT * FROM zproduto INTO TABLE lt_produto
 WHERE produto IN ('Notebook', 'Teclado').
✔ SELECT DISTINCT
abap
SELECT DISTINCT status FROM zproduto INTO TABLE lt_status_unicos.
✔ ORDER BY
abap
SELECT DISTINCT quantidade FROM zproduto
  INTO TABLE lt_qtd_unicos
  ORDER BY quantidade DESCENDING.
✔ UP TO ROWS
abap
SELECT * FROM zproduto UP TO 3 ROWS
  INTO TABLE lt_produto
  ORDER BY id DESCENDING.
✔ COUNT
abap
SELECT COUNT(*) FROM zproduto WHERE status = 'A' INTO @lv_total.
✔ SUM
abap
SELECT SUM(valor) FROM zproduto INTO @lv_total.
🟡 ZUPDATE_001 — Atualização de Registros
Demonstra o uso do comando UPDATE:

abap
UPDATE zproduto
  SET status = 'C'
      quantidade = 3
 WHERE id = '3'.
✔ Verificação com sy-dbcnt
abap
IF sy-dbcnt = 0.
  MESSAGE 'Nenhum registro alterado' TYPE 'I'.
ELSE.
  COMMIT WORK.
ENDIF.
🟣 ZMODIFY_001 — Inserir ou Atualizar (UPSERT)
O comando MODIFY:

Insere se o registro não existe

Atualiza se o registro já existe

abap
DATA ls_produto TYPE zproduto.

ls_produto-id = 2.
ls_produto-produto = 'mouse'.
ls_produto-quantidade = 8.
ls_produto-valor = 200.
ls_produto-status = 'A'.

MODIFY zproduto FROM ls_produto.
🔴 ZDELETE_001 — Exclusão de Registros
✔ DELETE com condição (seguro)
abap
DELETE FROM zproduto WHERE id = '9'.
✔ DELETE sem condição (remove tudo)
abap
DELETE FROM zproduto.


📊 Exemplo de dados inseridos
ID	Produto	    Quantidade	Valor	Status
1	  teclado	        2	       150	  A
2	  mouse	          5	       80	    A
3	  monitor	        11	     900	  C
4	  cabo HDMI	      10	      25	  A
5	  notebook	      3	      3500	  A
6	  impressora	    2	      1200	  C
7	  webcam	        8	      220	    B
8	  fone de ouvido	6	       180	  B


🧠 Conceitos importantes usados
✔ sy-dbcnt
Quantidade de linhas afetadas pela última operação SQL.

✔ INSERT FROM TABLE
Inserção em massa.

✔ SELECT INTO TABLE
Leitura de múltiplos registros.

✔ MODIFY
Insere ou atualiza automaticamente.

✔ DELETE
Remove registros.

📎 Licença
Este projeto é apenas para fins educacionais e demonstração de comandos ABAP.


