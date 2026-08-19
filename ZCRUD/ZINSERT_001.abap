REPORT ZINSERT_001.

*inserir rigistros Banco de dados

*Data(ls_inserir) = VALUE zproduto( ID = 2 produto = 'Mouse' QUANTIDADE = 5 VALOR = 80 STATUS = 'A').
*INSERT zproduto from ls_inserir.
*
*
*Data(ls_inserir) = VALUE zproduto( ID = 3 produto = 'Mouse' QUANTIDADE = 5 VALOR = 80 STATUS = 'A').
*INSERT zproduto from ls_inserir.
*
*Data(ls_inserir) = VALUE zproduto( ID = 2 produto = 'Mouse' QUANTIDADE = 5 VALOR = 80 STATUS = 'A').
*INSERT zproduto from ls_inserir.
*
*Data(ls_inserir) = VALUE zproduto( ID = 2 produto = 'Mouse' QUANTIDADE = 5 VALOR = 80 STATUS = 'A').
*INSERT zproduto from ls_inserir.


*TABLES: zproduto.
*
*DATA: lt_inserir TYPE STANDARD TABLE OF zproduto,
*      ls_inserir TYPE zproduto.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 1.
*ls_inserir-produto = 'teclado'.
*ls_inserir-quantidade = 2.
*ls_inserir-valor = 150.
*ls_inserir-STATUS = 'A'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 2.
*ls_inserir-produto = 'mouse'.
*ls_inserir-quantidade = 5.
*ls_inserir-valor = 80.
*ls_inserir-STATUS = 'A'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 3.
*ls_inserir-produto = 'monitor'.
*ls_inserir-quantidade = 11.
*ls_inserir-valor = 900.
*ls_inserir-STATUS = 'C'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 4.
*ls_inserir-produto = 'cabo HDMI'.
*ls_inserir-quantidade = 10.
*ls_inserir-valor = 25.
*ls_inserir-STATUS  = 'A'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 5.
*ls_inserir-produto = 'notebook'.
*ls_inserir-quantidade = 3.
*ls_inserir-valor = 3500.
*ls_inserir-STATUS  = 'A'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 6.
*ls_inserir-produto = 'impressora'.
*ls_inserir-quantidade = 2.
*ls_inserir-valor = 1200.
*ls_inserir-STATUS  = 'C'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 7.
*ls_inserir-produto = 'webcam'.
*ls_inserir-quantidade = 8.
*ls_inserir-valor = 220.
*ls_inserir-STATUS  = 'B'.
*APPEND ls_inserir to lt_inserir.
*
*CLEAR: ls_inserir.
*ls_inserir-id = 8.
*ls_inserir-produto = 'fone de ouvido'.
*ls_inserir-quantidade = 6.
*ls_inserir-valor = 180.
*ls_inserir-STATUS  = 'B'.
*APPEND ls_inserir to lt_inserir.
*
*INSERT zproduto FROM TABLE lt_inserir.

*DELETE FROM zproduto.

DATA: lt_inserir TYPE STANDARD TABLE OF zproduto.

APPEND VALUE zproduto( id = 1 produto = 'teclado'         quantidade = 2  valor = 150 status = 'A' )  to lt_inserir.
APPEND VALUE zproduto( id = 2 produto = 'mouse'           quantidade = 5  valor = 80 status = 'A' )   to lt_inserir.
APPEND VALUE zproduto( id = 3 produto = 'monitor'         quantidade = 11 valor = 900 status = 'C' )  to lt_inserir.
APPEND VALUE zproduto( id = 4 produto = 'cabo HDMI'       quantidade = 10 valor = 25 status = 'A' )   to lt_inserir.
APPEND VALUE zproduto( id = 5 produto = 'notebook'        quantidade = 3  valor = 3500 status = 'A' ) to lt_inserir.
APPEND VALUE zproduto( id = 6 produto = 'impressora'      quantidade = 2  valor = 1200 status = 'C' ) to lt_inserir.
APPEND VALUE zproduto( id = 7 produto = 'webcam'          quantidade = 8  valor = 220 status = 'B' )  to lt_inserir.
APPEND VALUE zproduto( id = 8 produto = 'fone de ouvido'  quantidade = 6  valor = 180 status = 'B' )  to lt_inserir.

INSERT zproduto FROM TABLE lt_inserir.
