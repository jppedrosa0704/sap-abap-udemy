*&---------------------------------------------------------------------*
*&  Include           ZCALCULA2
*&---------------------------------------------------------------------*

IF r1 = 'X'.
  lv_resultado = p_input1 + p_input2.
  lv_operacao = 'Adição'.

ELSEIF r2 = 'X'.
  lv_resultado = p_input1 - p_input2.
  lv_operacao = 'Subtração'.
ELSEIF r3 = 'X'.
  lv_resultado = p_input1 * p_input2.
  lv_operacao = 'Multiplicação'.
ELSEIF r4 = 'X'.
  lv_resultado = p_input1 / p_input2.
  lv_operacao = 'Divisão'.
ENDIF.

WRITE: / |Resultado da { lv_operacao } = { lv_resultado }|.
