REPORT ZCALC_FORM.

data: lv_output TYPE numc3.

PARAMETERS: p_input1 TYPE numc2,
            p_input2 TYPE numc2.

PERFORM soma USING p_input1 p_input2 CHANGING lv_output.

WRITE: / lv_output.

FORM soma USING pv_input1
                pv_input2
          CHANGING pv_output.

  pv_output = pv_input1 + pv_input2.

ENDFORM.
