# ZSOMA_NUMEROS – Exemplo de Function Module com validação e exceção

Este programa demonstra como chamar um *Function Module* criado na SE37, utilizando parâmetros de entrada, saída e tratamento de exceções.  
O Function Module utilizado chama-se **ZSOMA**, responsável por validar os valores recebidos e somar dois números do tipo `NUMC`.

---

## 📌 Objetivo do Programa
O report **ZSOMA_NUMEROS** lê dois valores numéricos informados pelo utilizador, valida se ambos são diferentes de zero e envia esses valores ao Function Module **ZSOMA**, que retorna a soma através do parâmetro `E_OUTPUT`.  
Caso algum dos valores seja zero, o FM dispara a exceção **NOT_ZERO**.

---

## 🧩 Estrutura do Function Module ZSOMA

### **IMPORTING**
- `I_INPUT1` – Número de dois dígitos (`NUMC2`)
- `I_INPUT2` – Número de dois dígitos (`NUMC2`)

### **EXPORTING**
- `E_OUTPUT` – Resultado da soma (`NUMC3`)

### **EXCEPTIONS**
- `NOT_ZERO` – Disparada quando algum dos inputs é igual a zero

---

## 🧠 Lógica interna do FM

```abap
IF I_INPUT1 = 0 OR I_INPUT2 = 0.
  RAISE NOT_ZERO.
ELSE.
  E_OUTPUT = I_INPUT1 + I_INPUT2.
ENDIF.

REPORT ZSOMA_NUMEROS.

DATA: lv_output TYPE numc3.

PARAMETERS: p_input1 TYPE numc2,
            p_input2 TYPE numc2.

CALL FUNCTION 'ZSOMA'
  EXPORTING
    I_INPUT1       = p_input1
    I_INPUT2       = p_input2
  IMPORTING
    E_OUTPUT       = lv_output
  EXCEPTIONS
    NOT_ZERO       = 1
    OTHERS         = 2.

IF sy-subrc = 1.
  WRITE: 'Erro: algum dos valores é zero.'.
ELSEIF sy-subrc = 0.
  WRITE lv_output.
ELSE.
  WRITE: 'Erro inesperado.'.
ENDIF.

🎯 O que este exemplo ensina
Como criar um Function Module com validação

Como definir e disparar exceções na SE37

Como capturar exceções no report via sy-subrc

Como trabalhar com tipos NUMC

Como retornar resultados ao utilizador


