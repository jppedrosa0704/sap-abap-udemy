📘 ZJOINS_001 — Exemplo de INNER JOIN no ABAP
Este repositório contém um relatório ABAP simples demonstrando como realizar operações de JOIN entre tabelas padrão SAP (MARA e MAKT) e exibir os resultados em tela.

📌 Objetivo
O programa ZJOINS_001 tem como finalidade:

Declarar uma estrutura interna para armazenar dados combinados de MARA e MAKT.

Executar um INNER JOIN entre as tabelas:

MARA → Dados gerais do material

MAKT → Descrições do material

Filtrar pela língua do usuário (sy-langu).

Exibir os resultados no formato de lista.

🧱 Estrutura de Dados
O relatório define um tipo composto contendo:

MATNR — Código do material

ERSDA — Data de criação

MTART — Tipo de material

MATKL — Grupo de mercadoria

MAKTX — Texto descritivo do material

🔍 Lógica do INNER JOIN
O SELECT faz a junção entre MARA e MAKT:

abap
SELECT a~matnr,
       a~ersda,
       a~mtart,
       a~matkl,
       b~maktx
  FROM mara AS a
  INNER JOIN makt AS b
          ON a~matnr = b~matnr
 WHERE b~spras = @sy-langu
  INTO TABLE @lt_resultado.
Obs.: No código original havia um erro:
a~matnr = b~maktx → isso está incorreto.
O correto é:
a~matnr = b~matnr.

🖥️ Saída do Programa
Se houver registros, o relatório exibe:

Código
MATNR | MAKTX | ERSDA | MTART | MATKL
Caso contrário:

Código
Nenhum registro encontrado
