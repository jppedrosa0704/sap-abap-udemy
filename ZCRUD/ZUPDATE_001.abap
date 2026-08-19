REPORT ZUPDATE_001.

" UPDATE - modificar - atualizar dados no banco de dados
*UPDATE zproduto
*  SET status = 'B'
*WHERE status = 'C'.

*UPDATE zproduto
*  set status = 'C'
*      quantidade = 3
*WHERE id = '3'.

*UPDATE zproduto
*  set status = 'A'
*  WHERE valor >= 500.

update zproduto
  set status = 'B'
WHERE status  = 'Z'.

IF sy-dbcnt = 0.
*  WRITE 'Nenhum registo alterado'.
  MESSAGE 'Nenhum registo alterado' TYPE 'I'.
ElSE.
  COMMIT WORK.
ENDIF.
