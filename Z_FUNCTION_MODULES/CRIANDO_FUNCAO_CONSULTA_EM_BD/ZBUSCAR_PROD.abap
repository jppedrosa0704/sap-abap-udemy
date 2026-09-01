REPORT ZBUSCAR_PROD.

DATA: lt_output TYPE ZTTPROD,
      lwa_output TYPE zproduto.


PARAMETERS: p_id TYPE zeid.

CALL FUNCTION 'ZBUSCAR_PRODUTO'
  EXPORTING
    P_ID           = p_id
 IMPORTING
   ET_FINAL       = lt_output
          .

LOOP AT lt_output into lwa_output.
  WRITE: / lwa_output-ID,
           lwa_output-PRODUTO,
           lwa_output-QUANTIDADE,
           lwa_output-VALOR,
           lwa_output-STATUS,
           lwa_output-USUARIO_CRIACAO,
           lwa_output-DATA_CRIACAO.
ENDLOOP.
