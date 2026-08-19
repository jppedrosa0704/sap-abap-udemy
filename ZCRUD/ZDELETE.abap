REPORT ZDELETE_001.


* DELETE com condição é a mais segura.
DELETE FROM zproduto
where id = '9'.

* caso não ponha condição com o DELETE, todos os registros são apagados. siag o exemplo abaixo:

DELETE FROM zproduto.
