REPORT ZABAP_106.

TABLES: mara, sscrfields.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.

  SELECTION-SCREEN COMMENT /1(70) text-003.
* parãmetros - são filtros únicos, quando queremos filtrar algo em específico
PARAMETERS: p_mtart TYPE mara-mtart DEFAULT 'FERT' OBLIGATORY.

*Range - Faixa de valores
SELECT-OPTIONS: s_matnr for mara-matnr OBLIGATORY NO-EXTENSION. "desabilitar a seleção multipla. tb 'e pode usar o no intervals - sem intervalos retirando o no extension ou tb pode usar oos dois

SELECTION-SCREEN END OF BLOCK b2.

* quebra de linha
SELECTION-SCREEN skip 1.

SELECTION-SCREEN BEGIN OF BLOCk b1 WITH FRAME TITLE text-001.

  SELECTION-SCREEN COMMENT /1(70) text-004.
* uma das opções
PARAMETERS: rb_ativo RADIOBUTTON GROUP rgb1,
            rb_inat RADIOBUTTON GROUP rgb1,
            rb_ambos RADIOBUTTON GROUP rgb1 DEFAULT 'X'.

* quebra de linha
SELECTION-SCREEN skip 1.

*CHECKBOx - verdadeiro ou falso
PARAMETERS: cx_ativo as CHECKBOX DEFAULT 'X',
            cx_inat as CHECKBOX,
            cx_ambos as CHECKBOX.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN skip 1.

* LISTA de seleção
PARAMETERS: lb_sit as LISTBOX VISIBLE LENGTH 15 MODIF ID sit OBLIGATORY.

SELECTION-SCREEN skip 1.

*botão em tela
SELECTION-SCREEN PUSHBUTTON /35(15) p_but1 USER-COMMAND but1.

* botão da barra de tarefas.
SELECTION-SCREEN FUNCTION KEY 1.


INITIALIZATION.
  s_matnr-sign = 'I'. "incluir
  s_matnr-option = 'BT'. "between
  s_matnr-low = '1000'.
  s_matnr-high = '5000'.
  APPEND s_matnr.

  lb_sit = 3.
  p_but1 = '@39@Clique aqui!'.
  sscrfields-FUNCTXT_01 = '@4S@Processar'.


AT SELECTION-SCREEN.
  if sy-ucomm = 'BUT1'.
    MESSAGE 'Clicou no botão' TYPE 'S'.
  ELSEIF sscrfields-ucomm = 'FC01'.
    MESSAGE 'Clicou na barra' TYPE 'I'.
  ENDIF.

AT SELECTION-SCREEN OUTPUT.
  DATA(lt_values) = VALUE vrm_values(
  ( key = '1' text =  'ativo' )
  ( key = '2' text =  'inativo' )
  ( key = '3' text =  'em andamento' )
  ( key = '4' text =  'finalizado' )
  ).

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      ID                    = 'LB_SIT'
      VALUES                = lt_values
   EXCEPTIONS
     ID_ILLEGAL_NAME       = 1
     OTHERS                = 2
            .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.
