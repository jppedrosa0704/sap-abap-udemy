📘 ZCLASSE_010 — Conversão de Classes Globais para Arquitetura com Classe Abstrata e Subclasses Locais
Este projeto demonstra como converter duas classes globais independentes em uma arquitetura mais limpa, reutilizável e orientada a objetos, utilizando classe abstrata + subclasses locais dentro de um report ABAP.

O objetivo é reduzir duplicação, centralizar comportamentos comuns e permitir que cada implementação trate sua lógica específica através de polimorfismo.

🎯 Objetivo
Substituir duas classes globais (ZSUBCLASSE01 e ZSUBCLASSE02) por uma estrutura mais organizada.

Criar uma classe abstrata que define a interface comum.

Implementar subclasses locais que tratam comportamentos diferentes.

Selecionar dinamicamente qual classe será usada através de radiobuttons.

Manter o report simples, limpo e orientado a objetos.

🧱 Arquitetura
1. Classe Abstrata (zclasse_abstrata)
Define o método EXIBIR, que deve ser implementado pelas subclasses.

2. Subclasses Locais
Cada uma implementa sua própria lógica para o método EXIBIR:

zsubclasse01 → retorna o tipo do pedido

zsubclasse02 → retorna o centro do pedido

3. Report ZCLASSE_010
Recebe o número do pedido.

Usuário escolhe qual implementação usar via radiobutton.

Instancia dinamicamente a classe correta.

Exibe o resultado retornado pelo método EXIBIR.

📄 Código do Report (versão final)

REPORT ZCLASSE_010.

PARAMETERS: p_pedido TYPE ebeln.
PARAMETERS: p_r1 TYPE c RADIOBUTTON GROUP r1,
            p_r2 TYPE c RADIOBUTTON GROUP r1.

DATA lo_object TYPE REF TO zclasse_abstrata.

IF p_r1 = 'X'.
  lo_object = NEW zsubclasse01( ).
ELSE.
  lo_object = NEW zsubclasse02( ).
ENDIF.

lo_object->EXIBIR(
  EXPORTING
    iv_pedido = p_pedido
  IMPORTING
    ev_tipopedido = DATA(lv_resultado)
).

WRITE: / |Tipo do pedido: { lv_resultado }|.


🔍 Como funciona
O usuário informa o número do pedido.

Escolhe qual regra aplicar:

R1 → lógica da Subclasse 01

R2 → lógica da Subclasse 02

O report instancia a classe correta usando polimorfismo.

O método EXIBIR retorna o valor desejado.

O report exibe o resultado.

🧠 Benefícios da Conversão
✔ Código mais limpo e organizado

✔ Redução de duplicação

✔ Fácil manutenção

✔ Polimorfismo aplicado corretamente

✔ Substituição simples de implementações

✔ Report mais enxuto e desacoplado

📌 Quando usar este padrão
Use esta abordagem quando:

Você tem múltiplas implementações diferentes para a mesma operação.

Quer evitar IF / CASE espalhados pelo código.

Precisa trocar comportamentos dinamicamente.

Deseja manter o report simples e orientado a objetos.
