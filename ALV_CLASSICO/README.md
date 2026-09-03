📌 Descrição Geral
O programa ZRELATORIO_PRODUTO tem como objetivo listar produtos cadastrados na tabela ZPRODUTO, permitindo filtragem por ID e STATUS.
Os dados são exibidos em um ALV List, com colunas configuradas manualmente via field catalog e layout com linhas zebradas.

🧱 Estrutura do Programa
1. Declaração da Tabela Base

TABLES: zproduto.

Permite acesso aos campos da tabela ZPRODUTO no report.

2. Tipo da Tabela Interna (ty_produto)
Estrutura local que representa um registro da tabela ZPRODUTO.

TYPES: BEGIN OF ty_produto,
  id                TYPE zproduto-ID,
  produto           TYPE zproduto-PRODUTO,
  quantidade        TYPE zproduto-QUANTIDADE,
  valor             TYPE zproduto-VALOR,
  status            TYPE zproduto-STATUS,
  usuario_criacao   TYPE zproduto-USUARIO_CRIACAO,
  data_criacao      TYPE zproduto-DATA_CRIACAO,
END OF ty_produto.

3. Tabela Interna e Work Area

DATA: lt_produto TYPE TABLE OF ty_produto,
      ls_produto TYPE ty_produto.

lt_produto → tabela interna que receberá os dados do SELECT

ls_produto → estrutura auxiliar (work area)

4. Tela de Seleção com BLOCK

DATA: lt_fieldcat TYPE slis_t_fieldcat_alv,
      ls_fieldcat TYPE slis_fieldcat_alv,
      ls_layout   TYPE slis_layout_alv.

🔍 Lógica do Programa
🔹 1. Buscar Dados — f_busca_dados
Executa o SELECT na tabela ZPRODUTO conforme os filtros da tela.

SELECT id produto valor quantidade status usuario_criacao data_criacao
  FROM zproduto
  INTO TABLE lt_produto
  WHERE id IN s_id
    AND status IN s_status.

Se não houver registros, exibe mensagem e interrompe o report.

🔹 2. Montar Field Catalog — f_monta_fieldcat
Define manualmente cada coluna do ALV.

Exemplo:

CLEAR ls_fieldcat.
ls_fieldcat-fieldname = 'ID'.
ls_fieldcat-seltext_m = 'ID do Produto'.
ls_fieldcat-col_pos   = '1'.
APPEND ls_fieldcat TO lt_fieldcat.

O programa cria todas as colunas: ID, PRODUTO, VALOR, QUANTIDADE, STATUS, USUARIO_CRIACAO, DATA_CRIACAO.

🔹 3. Layout do ALV — define_layout

ls_layout-zebra = 'X'.
ls_layout-colwidth_optimize = 'X'.

Linhas zebradas

Ajuste automático da largura das colunas

🔹 4. Exibir ALV — f_exibe_alv
Chamada da função clássica:

CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
  EXPORTING
    I_CALLBACK_PROGRAM = sy-repid
    IS_LAYOUT          = ls_layout
    IT_FIELDCAT        = lt_fieldcat
  TABLES
    T_OUTTAB           = lt_produto.
    
sy-repid garante que o ALV saiba qual report está chamando a função.

📊 Fluxo Completo
Tela de seleção

Busca dados

Monta field catalog

Define layout

Exibe ALV

🧪 Tecnologias Utilizadas
ABAP Report

ALV List (REUSE_ALV_LIST_DISPLAY)

Field Catalog manual

Estruturas locais (TY)

Tabela interna tipada

SELECT-OPTIONS

Mensagens SAP

🧑‍💻 Autor
Paulo — IEFP / Curso Técnico de Informática – Sistemas
Relatório desenvolvido para prática de ABAP e ALV.
