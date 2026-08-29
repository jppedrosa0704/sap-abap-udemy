# ZTESTE_INCLUDE – Operações Aritméticas com Radio Buttons em ABAP

Este projeto demonstra como criar uma *selection screen* organizada com blocos, radio buttons e processamento modularizado usando `INCLUDE`.  
O programa permite ao usuário escolher uma operação matemática e executá-la sobre dois valores informados.

---

## 🎯 Objetivo do Programa

O relatório **ZTESTE_INCLUDE** realiza quatro operações aritméticas:

- Adição  
- Subtração  
- Multiplicação  
- Divisão  

A operação é escolhida pelo usuário através de **radio buttons**, e o cálculo é executado dentro do include **ZCALCULA2**.

---

## 🧱 Estrutura do Código

### 1. Entrada de Dados

O bloco de seleção contém dois parâmetros numéricos:

```abap
SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE text-001.

  PARAMETERS: p_input1 TYPE p DECIMALS 2,
              p_input2 TYPE p DECIMALS 2.

SELECTION-SCREEN END OF BLOCK b1.

2. Escolha da Operação
Os radio buttons definem qual operação será executada:

PARAMETERS: r1 RADIOBUTTON GROUP g1,
            r2 RADIOBUTTON GROUP g1,
            r3 RADIOBUTTON GROUP g1,
            r4 RADIOBUTTON GROUP g1.

3. Processamento no INCLUDE
O include ZCALCULA2 contém a lógica das operações:

IF r1 = 'X'.
  lv_resultado = p_input1 + p_input2.
  lv_operacao = 'Adição'.

ELSEIF r2 = 'X'.
  lv_resultado = p_input1 - p_input2.
  lv_operacao = 'Subtração'.

ELSEIF r3 = 'X'.
  lv_resultado = p_input1 * p_input2.
  lv_operacao = 'Multiplicação'.

ELSEIF r4 = 'X'.
  lv_resultado = p_input1 / p_input2.
  lv_operacao = 'Divisão'.
ENDIF.

📌 Pontos Importantes
Uso correto de SELECTION-SCREEN BLOCK para organizar a tela.

Radio buttons agrupados com GROUP g1.

Modularização com INCLUDE para separar lógica e manter o código limpo.

Saída formatada com string templates (| ... |).

📂 Arquivos do Projeto
ZTESTE_INCLUDE — Programa principal

ZCALCULA2 — Include com a lógica das operações

🧪 Exemplo de Execução
Entrada:

p_input1 = 10

p_input2 = 3

Operação: Multiplicação

Saída:

Resultado da Multiplicação = 30

📜 Licença
Este projeto pode ser utilizado para fins de estudo, demonstração ou referência em ABAP.





