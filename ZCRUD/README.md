Este repositório contém um conjunto de programas ABAP desenvolvidos para treinar operações de banco de dados utilizando a tabela ZPRODUTO. Essa tabela foi criada para armazenar informações de produtos e possui a seguinte estrutura:

Campo	Tipo	Chave	Descrição
MANDT	CLNT	✔	Mandante
ID	CHAR1	✔	Código do produto
PRODUTO	CHAR20	✖	Nome do produto
QUANTIDADE	INT4	✖	Quantidade em estoque
VALOR	DEC	✖	Valor unitário
STATUS	CHAR1	✖	Status do produto


Os programas incluídos demonstram todas as operações CRUD no SAP. O programa ZINSERT_001 mostra como inserir registros na tabela, tanto manualmente quanto utilizando uma tabela interna preenchida com diversos produtos. Ele também demonstra como limpar a tabela antes da inserção para evitar erros de duplicação. Os dados utilizados nos exemplos incluem produtos como teclado, mouse, monitor, cabo HDMI, notebook, impressora, webcam e fone de ouvido, conforme a tabela abaixo:

ID	Produto	Quantidade	Valor	Status
1	teclado	2	150	A
2	mouse	5	80	A
3	monitor	11	900	C
4	cabo HDMI	10	25	A
5	notebook	3	3500	A
6	impressora	2	1200	C
7	webcam	8	220	B
8	fone de ouvido	6	180	B


O programa ZSELECT_001 demonstra diferentes formas de consultar dados na tabela, utilizando filtros com WHERE, operadores lógicos como AND e OR, buscas por padrões com LIKE, seleção de valores específicos com IN, remoção de duplicados com DISTINCT, ordenação com ORDER BY, limitação de resultados com UP TO ROWS, contagem de registros com COUNT e soma de valores com SUM. Esses comandos permitem visualizar produtos por status, quantidade, nome ou valor, além de gerar estatísticas como total de produtos com determinado status ou soma dos valores cadastrados.

O programa ZUPDATE_001 demonstra como atualizar registros existentes utilizando o comando UPDATE, modificando campos como status, quantidade ou valor. Ele também utiliza a variável sy-dbcnt para verificar se algum registro foi realmente alterado, exibindo mensagens quando nenhuma linha é afetada e realizando COMMIT WORK quando necessário.

O programa ZMODIFY_001 demonstra o uso do comando MODIFY, que insere um registro quando ele não existe ou atualiza quando já está presente, funcionando como uma operação de upsert. Esse comando é útil para garantir que os dados sejam sempre atualizados sem a necessidade de verificar previamente se o registro existe.

O programa ZDELETE_001 demonstra como remover registros específicos utilizando DELETE com condição ou como apagar toda a tabela quando DELETE é utilizado sem WHERE. O uso de DELETE com condição é a forma mais segura de evitar exclusões acidentais.

Em conjunto, estes programas oferecem uma visão completa e prática de como inserir, consultar, atualizar, modificar e excluir dados na tabela ZPRODUTO, servindo como um guia claro e acessível para quem está aprendendo ou revisando comandos Open SQL no ambiente ABAP. O repositório também reforça conceitos importantes como o uso de sy-dbcnt para verificar linhas afetadas, o funcionamento de SUM e COUNT e a importância da chave primária na prevenção de erros como DBSQL_DUPLICATE_KEY_ERROR. Este material funciona como um guia de estudo completo para iniciantes e praticantes de ABAP que desejam dominar operações de banco de dados no SAP.
