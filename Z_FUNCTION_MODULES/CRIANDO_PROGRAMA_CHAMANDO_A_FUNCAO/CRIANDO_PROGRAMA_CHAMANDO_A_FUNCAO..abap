REPORT ZSOMA_NUMEROS.

DATA: lv_output TYPE numc3.

PARAMETERS: p_input1 TYPE numc2,
            p_input2 TYPE numc2.

*CALL FUNCTION 'ZSOMA'
*  EXPORTING
*    I_INPUTI       = p_input1
*    I_INPUT2       = p_input2
* IMPORTING
*   E_OUTPUT       = lv_output.

CALL FUNCTION 'ZSOMA'
  EXPORTING
    I_INPUT1       = p_input1
    I_INPUT2       = p_input2
 IMPORTING
   E_OUTPUT       = lv_output
 EXCEPTIONS
   NOT_ZERO       = 1
   OTHERS         = 2
          .
IF SY-SUBRC <> 0.
  MESSAGE 'A entrada deve ser diferente de zero' TYPE 'I' DISPLAY LIKE 'E'.
ENDIF.


WRITE lv_output.
