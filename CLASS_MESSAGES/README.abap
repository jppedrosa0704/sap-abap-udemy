📘 README – ZMESSAGES
Este report demonstra o uso dos diferentes tipos de mensagens disponíveis na linguagem ABAP, incluindo mensagens simples, mensagens com variáveis e mensagens que interrompem a execução do programa. O objetivo é apresentar, de forma prática, como cada tipo funciona e em quais situações são normalmente utilizadas.

🎯 Objetivo do Programa
O report ZMESSAGES serve como referência para iniciantes e praticantes de ABAP que desejam entender:

Como exibir mensagens de informação, sucesso, aviso e erro

Como utilizar mensagens que abortam ou encerram o programa

Como montar mensagens dinâmicas contendo variáveis

Como validar parâmetros e retornar mensagens adequadas ao usuário

🧩 Tipos de Mensagens Demonstradas
1. Mensagem de Informação (TYPE 'I')
Exibe uma mensagem simples ao usuário, sem impacto no fluxo do programa.

2. Mensagem de Sucesso (TYPE 'S')
Indica que uma operação foi concluída corretamente.

3. Mensagem de Erro (TYPE 'E')
Interrompe o processamento atual e retorna o usuário ao ponto de entrada (como a tela de seleção).
Usada para validações obrigatórias.

4. Mensagem de Aviso (TYPE 'W')
Exibe um alerta, mas permite que o programa continue.

5. Mensagem de Abortamento (TYPE 'A')
Encerra imediatamente o programa e retorna ao SAP Easy Access.

6. Mensagem de Exit (TYPE 'X')
Interrompe o programa gerando um short dump.
Usada apenas em cenários muito específicos.

🔤 Mensagens com Variáveis
O programa também demonstra como montar mensagens dinâmicas utilizando string templates, permitindo exibir valores informados pelo usuário:

produto: { p_prod } / Quantidade: { p_qtd } / Valor: { p_valor } cadastrado com sucesso!

Esse formato é útil para mensagens mais completas e informativas.

📌 Parâmetros Utilizados
p_prod – Nome do produto

p_qtd – Quantidade informada

p_valor – Valor monetário com duas casas decimais

Esses parâmetros são usados para validar dados e construir mensagens dinâmicas.

🖥️ Resumo do Funcionamento
O report apresenta, de forma simples e direta, como trabalhar com mensagens no ABAP, cobrindo desde mensagens básicas até mensagens críticas que encerram o programa.
É um exemplo prático para quem está aprendendo a lidar com interação e feedback ao usuário dentro do SAP.
