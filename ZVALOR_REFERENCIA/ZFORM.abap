REPORT ZFORM.

DATA: lv_output TYPE p DECIMALS 2.


PARAMETERS: p_input1 TYPE numc3,
            p_input2 TYPE numc3.

PERFORM: soma USING p_input1 p_input2 CHANGING lv_output.

WRITE: / lv_output.

FORM soma USING VALUE(pv_input1)
                VALUE(pv_input2)
          CHANGING pv_output.

      pv_input1 = 10.
      pv_input2 = 7.

  pv_output = pv_input1 + pv_input2.

ENDFORM.
