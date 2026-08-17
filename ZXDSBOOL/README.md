🇵🇹 README – ZIF_002
markdown
# ZIF_002 – Uso de xsdbool e Comparações Booleanas em ABAP

Este programa demonstra o uso da função `xsdbool` para converter expressões lógicas em valores booleanos (`abap_true` ou `abap_false`) e aplicar essas comparações dentro de estruturas condicionais.

## 📌 Objetivo do Código
O propósito do relatório **ZIF_002** é apresentar, de forma simples e prática, como trabalhar com:

- Conversão de expressões lógicas para booleanos usando `xsdbool`
- Comparações entre variáveis inteiras
- Estruturas condicionais baseadas em valores booleanos (`IF ... ELSE`)
- Impressão de resultados no output do ABAP

## 🧩 Conteúdo Demonstrado

### ✔️ Conversão lógica com `xsdbool`
Transforma uma expressão como `lv_a = lv_b` em um valor booleano:

```abap
lv_bool = xsdbool( lv_a = lv_b ).
✔️ Uso de abap_true e abap_false
Compara o resultado booleano para decidir qual mensagem exibir:

abap
IF lv_bool = abap_true.
  WRITE: 'São iguais'.
ELSE.
  WRITE: 'São diferentes'.
ENDIF.
✔️ Variáveis utilizadas
lv_a – inteiro com valor inicial 10

lv_b – inteiro com valor inicial 20

lv_bool – variável booleana do tipo abap_bool


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 🇺🇸 **README – ZIF_002 (English Version)**

```markdown
# ZIF_002 – Using xsdbool and Boolean Comparisons in ABAP

This report demonstrates how to use the `xsdbool` function to convert logical expressions into boolean values (`abap_true` or `abap_false`) and apply these results inside conditional structures.

## 📌 Purpose of the Code
The goal of **ZIF_002** is to show how to work with:

- Logical expression conversion using `xsdbool`
- Integer variable comparison
- Conditional structures based on boolean values (`IF ... ELSE`)
- Output printing in ABAP

## 🧩 Demonstrated Concepts

### ✔️ Logical conversion with `xsdbool`
Converts an expression such as `lv_a = lv_b` into a boolean value:

```abap
lv_bool = xsdbool( lv_a = lv_b ).
✔️ Using abap_true and abap_false
Evaluates the boolean result to decide which message to display:

abap
IF lv_bool = abap_true.
  WRITE: 'São iguais'.
ELSE.
  WRITE: 'São diferentes'.
ENDIF.
✔️ Variables used
lv_a – integer with initial value 10

lv_b – integer with initial value 20

lv_bool – boolean variable of type abap_bool
