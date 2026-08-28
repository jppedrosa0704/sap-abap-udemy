REPORT ZFORMSOMA.

data: lv_output TYPE numc3,
      lv_executou TYPE abap_bool.

PARAMETERS: p_input1 TYPE numc2,
            p_input2 TYPE numc2.

*PERFORM soma(ZCALC_FORM) USING p_input1 p_input2 CHANGING lv_output.
*PERFORM soma  IN PROGRAM ZCALC_FORM USING p_input1 p_input2 CHANGING lv_output.
PERFORM soma IN PROGRAM ZCALC_FORM USING p_input1 p_input2 CHANGING lv_output IF FOUND.


IF lv_output IS not INITIAL.
   lv_executou = abap_true.
   WRITE: / |Resultado { lv_output }|.
else.
  WRITE: / 'Não foi possível executar o programa.'.
ENDIF.

