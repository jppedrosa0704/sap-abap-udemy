*&---------------------------------------------------------------------*
*& Report ZIF_002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZIF_002.

*data lv_resultado type abap_bool.
*
*lv_resultado = xsdbool( 5 < 3 ).
*
*write: / 'Resultado:', lv_resultado.

data: lv_a type i value 10,
      lv_b type i value 20,
      lv_bool type abap_bool.

lv_bool = xsdbool( lv_a = lv_b ).

IF lv_bool = abap_true.
  write: 'São iguais'.
else.
  write: 'São diferentes'.
ENDIF.
