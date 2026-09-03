REPORT ZMESSAGES.

*" Mensagem simples de informação
*MESSAGE 'Olá mundo ABAP' TYPE 'I'.
*
*" Mensagem simples de sucesso
*MESSAGE 'Dados gravado com sucesso' TYPE 'S'.
*
*" mensagem do tipo erro
*PARAMETERS: p_id TYPE i.
*
*IF p_id is INITIAL.
*  MESSAGE 'Informe o ID do produto' TYPE 'E'.
*ENDIF.
*
*" Mensagem do tipo aviso.
*PARAMETERS: p_qtd TYPE i.
*
*  IF p_qtd > 100.
*    MESSAGE 'Quantidade muito alta, revise o valor informado.' TYPE 'W'.
*  ENDIF.
*
*
*" Mensagem de abortar - fecha o programa.
*MESSAGE 'erro crítico no processo.' TYPE 'A'.
*
*"mensagem do tipo exit
*MESSAGE 'Encerrando o programa.' TYPE 'X'.


*& ----------------------------------------
*& MENSAGENS COM VARIÁVEIS
*& ----------------------------------------

*DATA: lv_produto TYPE char20 VALUE 'Notebook'.

*PARAMETERS: p_prod TYPE char20.
*
*MESSAGE |produto: { p_prod } cadastrado com sucesso! | TYPE 'I'.


PARAMETERS: p_prod  TYPE char20,
            p_qtd   TYPE i,
            p_valor TYPE p DECIMALS 2.

MESSAGE:  |produto: { p_prod } / Quantidade: { p_qtd } / Valor: { p_valor } cadastrado com sucesso!| TYPE 'I'.
