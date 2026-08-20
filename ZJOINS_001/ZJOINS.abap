REPORT ZJOINS_001.


* declaração de tabela interna
TYPES: BEGIN OF ty_resultado,
       matnr TYPE mara-matnr,
       ersda TYPE mara-ersda,
       mtart TYPE mara-mtart,
       matkl TYPE mara-matkl,
       maktx TYPE makt-maktx,
       END OF ty_resultado.

DATA: lt_resultado TYPE STANDARD TABLE OF ty_resultado,
      ls_resultado TYPE ty_resultado.

* seleção com INNER JOIN.

SELECT a~matnr,
       a~ersda,
       a~mtart,
       a~matkl,
       b~maktx
FROM mara as a
 INNER JOIN MAKT as b
    on a~matnr = b~maktx
 WHERE b~spras = @sy-langu

  into TABLE @lt_resultado.
*BREAK-POINT.
IF lt_resultado IS INITIAL.
  WRITE 'Nenhum resgistro encontrado'.
ELSE.
  LOOP AT lt_resultado INTO ls_resultado.
    WRITE: / ls_resultado-MATNR, ls_resultado-MAKTX, ls_resultado-ERSDA, ls_resultado-MTART, ls_resultado-MATKL.

  ENDLOOP.
ENDIF.
