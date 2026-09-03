REPORT ZRELATORIO_PRODUTO.

TABLES: zproduto.

* criando tabela interna - tipos de tabela
TYPES: BEGIN OF ty_produto,
          id                TYPE zproduto-ID,
          produto           TYPE zproduto-PRODUTO,
          quantidade        TYPE zproduto-QUANTIDADE,
          valor             TYPE zproduto-VALOR,
          status            TYPE zproduto-STATUS,
          usuario_criacao   TYPE zproduto-USUARIO_CRIACAO,
          data_criacao      TYPE zproduto-DATA_CRIACAO,
        END OF ty_produto.

* tabela interna e work area
SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE text-001.

DATA: lt_produto TYPE TABLE of ty_produto,  "Tabela interna
      ls_produto TYPE ty_produto. " work area

* TELA DE SELEÇÂO
select-options: s_id for zproduto-ID,
                s_status for zproduto-STATUS.

SELECTION-SCREEN END OF BLOCK b1.

* variáveis ALV
DATA: lt_fieldcat TYPE slis_t_fieldcat_alv,
      ls_fieldcat TYPE slis_fieldcat_alv,
      ls_layout   TYPE slis_layout_alv.



PERFORM f_busca_dados. "getdata
PERFORM f_monta_fieldcat.
PERFORM define_layout.
PERFORM f_exibe_alv.

FORM f_busca_dados.

  SELECT id produto valor quantidade status usuario_criacao data_criacao
    FROM zproduto
    INTO TABLE lt_produto
    WHERE id IN s_id
      AND status IN s_status.

  IF sy-subrc <> 0.
    MESSAGE 'Registros não encontrado' TYPE 'S' DISPLAY LIKE 'E'. "type pose ser 'I' popup
    STOP.
  ENDIF.

ENDFORM.

FORM f_monta_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'ID'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'ID do produto'.
  ls_fieldcat-col_pos = '1'.
  APPEND ls_fieldcat to lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'PRODUTO'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'Descrição do Produto'.
  ls_fieldcat-col_pos = '2'.
  APPEND ls_fieldcat to lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'VALOR'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'Valor do Produto'.
  ls_fieldcat-col_pos = '3'.
  APPEND ls_fieldcat to lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'QUANTIDADE'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'Quantidade'.
  ls_fieldcat-col_pos = '4'.
  APPEND ls_fieldcat to lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'STATUS'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'Status do Produto'.
  ls_fieldcat-col_pos = '5'.
  APPEND ls_fieldcat to lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'USUARIO_CRIACAO'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'Usuario de Criação'.
  ls_fieldcat-col_pos = '6'.
  APPEND ls_fieldcat to lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'DATA_CRIACAO'. "CAMPO DA TABELA
  ls_fieldcat-seltext_m = 'Data de Criação'.
  ls_fieldcat-col_pos = '7'.
  APPEND ls_fieldcat to lt_fieldcat.


ENDFORM.


FORM define_layout.
  clear ls_layout.
  ls_layout-zebra = 'X'. " linhas zebradas
  ls_layout-colwidth_optimize = 'X'. "otimiza largura das colunas.
ENDFORM.

FORM f_exibe_alv.

  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
   EXPORTING
      I_CALLBACK_PROGRAM             = sy-repid
      IS_LAYOUT                      = ls_layout
      IT_FIELDCAT                    = lt_fieldcat
    TABLES
      T_OUTTAB                       = lt_produto
   EXCEPTIONS
     PROGRAM_ERROR                  = 1
     OTHERS                         = 2
            .
  IF SY-SUBRC <> 0.
    MESSAGE 'Erro ao exibir o relatório' TYPE 'S' DISPLAY LIKE 'E'. "type pose ser 'I' popup
  ENDIF.


ENDFORM.
