📘 README — Projeto ABAP: Tabela ZPRODUTO + Operações SELECT/INSERT
📌 Sobre o projeto
Este repositório contém um conjunto de programas ABAP desenvolvidos para fins de estudo e prática, utilizando uma tabela customizada do SAP Data Dictionary chamada ZPRODUTO.
O objetivo é demonstrar:

Criação e estrutura de uma tabela Z

Inserção de registros via ABAP

Consultas avançadas com SELECT

Filtros, ordenações, agregações e contagens

Boas práticas de manipulação de dados internos

🗂️ Estrutura da Tabela ZPRODUTO
A tabela foi criada no SE11 com os seguintes campos:

Campo	Tipo DDIC	Tipo ABAP	Tamanho	Descrição
MANDT	CLNT	CLNT	3	Mandante
ID	CHAR1	CHAR	1	Código do produto
PRODUTO	CHAR20	CHAR	20	Nome do produto
QUANTIDADE	INT4	INT4	10	Quantidade em estoque
VALOR	DEC (ZVALOR)	DEC	10	Valor do produto
STATUS	CHAR1	CHAR	1	Status (A, B, C)


📥 Programa de Inserção — ZINSERT_ZPRODUTO
Este programa insere 8 registros na tabela ZPRODUTO utilizando a instrução INSERT.

Funcionalidades:
Preenchimento de estrutura ls_prod

Inserção sequencial de produtos

Commit final para gravação no banco

Produtos inseridos:
Teclado

Mouse

Monitor

Cabo HDMI

Notebook

Impressora

Webcam

Fone de Ouvido

🔍 Programa de Seleção — ZSELECT_001
Este programa demonstra diversos tipos de consultas ABAP utilizando a tabela ZPRODUTO.

Funcionalidades demonstradas:
✔ SELECT com múltiplos filtros
OR

AND

LIKE

Filtros por quantidade e status

✔ SELECT com lista de valores (IN)
Consulta por produtos específicos.

✔ SELECT DISTINCT
Status únicos

Quantidades únicas ordenadas

✔ ORDER BY
Ordenação por múltiplos campos.

✔ UP TO n ROWS
Limitação de linhas retornadas.

✔ COUNT(*)
Contagem de registros com filtros.

✔ SUM()
Soma de valores por status.

🧪 Exemplos de saída
O programa exibe no console SAP:

Listas de produtos filtrados

Quantidades e status distintos

Total de produtos com status específico

Soma dos valores de produtos ativos

📎 Objetivo educacional
Este projeto foi criado para:

Praticar manipulação de tabelas Z

Aprender comandos ABAP de seleção

Entender estruturas internas e loops

Criar documentação profissional para portfólio

🚀 Como executar
Importar os programas no SE38

Garantir que a tabela ZPRODUTO está ativa

Executar primeiro ZINSERT_ZPRODUTO

Depois executar ZSELECT_001 para visualizar os resultados

📄 Licença
Este projeto é de uso livre para fins educacionais.
