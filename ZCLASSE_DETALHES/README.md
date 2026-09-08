📘 README — Projeto ABAP: Consulta de Pedidos de Compra (EKKO/EKPO)
📌 Sobre o Projeto
Este repositório contém um exemplo funcional de consulta de documentos de compras (EKKO/EKPO) utilizando ABAP OO e ABAP moderno.
O objetivo é demonstrar boas práticas na construção de classes, métodos e relatórios que realizam leitura de dados no SAP de forma performática e organizada.

🧩 Estrutura do Projeto
1. Classe ZCLASSE_DETALHES
A classe contém o método público BUSCAR_DADOS, responsável por:

Receber um número de pedido (EBELN)

Consultar o cabeçalho (EKKO)

Consultar os itens (EKPO)

Retornar uma tabela interna com todos os dados consolidados

Método BUSCAR_DADOS (ABAP moderno)

SELECT cabecalho~EBELN,
       cabecalho~BSART,
       cabecalho~BUKRS,
       cabecalho~AEDAT,
       cabecalho~LIFNR,
       item~EBELP,
       item~MATNR,
       item~MENGE,
       item~MEINS
  FROM EKKO AS cabecalho
    INNER JOIN EKPO AS item
      ON item~EBELN = cabecalho~EBELN
  WHERE cabecalho~EBELN = @iv_pedido
  ORDER BY cabecalho~EBELN, item~EBELP
  INTO CORRESPONDING FIELDS OF TABLE @ET_PEDIDOS.

✔ Sem loops
✔ Sem FOR ALL ENTRIES
✔ Sem estruturas auxiliares
✔ Código limpo e performático

2. Relatório ZPEDIDOS_COMPRA
O relatório executa a classe e exibe os dados retornados.

Fluxo:

Usuário informa o número do pedido (p_pedido)

O relatório instancia a classe

Chama o método BUSCAR_DADOS

Exibe os dados no WRITE ou ALV

DATA(lo_object) = NEW ZCLASSE_DETALHES( ).

lo_object->buscar_dados(
  EXPORTING iv_pedido  = p_pedido
  IMPORTING et_pedidos = DATA(lt_pedidos)
).

IF lt_pedidos IS INITIAL.
  MESSAGE 'Documento não encontrado' TYPE 'I' DISPLAY LIKE 'E'.
ELSE.
  LOOP AT lt_pedidos INTO DATA(lwa_pedidos).
    WRITE: / lwa_pedidos-ebeln,
             lwa_pedidos-ebelp,
             lwa_pedidos-bsart,
             lwa_pedidos-bukrs,
             lwa_pedidos-aedat,
             lwa_pedidos-lifnr,
             lwa_pedidos-matnr,
             lwa_pedidos-menge,
             lwa_pedidos-meins.
  ENDLOOP.
ENDIF.

🏗️ Tecnologias e Recursos Utilizados
ABAP OO

ABAP SQL moderno

INNER JOIN

INTO CORRESPONDING FIELDS OF TABLE

DATA(...) inline declarations

Relatório executável (REPORT)

Classe global (SE24)

🎯 Objetivo Didático
Este projeto demonstra:

Como substituir código ABAP antigo por ABAP moderno

Como estruturar consultas limpas e performáticas

Como retornar dados via classes e métodos

Como separar lógica de negócio (classe) da apresentação (report)

🚀 Melhorias Futuras
Exibir resultados em SALV Table

Criar unit tests com ABAP Unit

Adicionar tratamento de exceções customizadas

Criar interface para reutilização do método em outros relatórios

👨‍💻 Autor
Paulo  
Desenvolvedor ABAP e estudante de programação
Porto, Portugal
