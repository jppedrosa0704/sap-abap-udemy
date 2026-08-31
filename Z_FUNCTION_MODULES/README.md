# ZSOMA_NUMEROS – Exemplo de chamada de Function Module no ABAP

Este programa demonstra como chamar um *Function Module* criado na SE37, utilizando parâmetros de entrada e saída.  
O Function Module utilizado chama-se **ZSOMA**, responsável por somar dois números do tipo `NUMC`.

---

## 📌 Objetivo do Programa
O report **ZSOMA_NUMEROS** lê dois valores numéricos informados pelo utilizador e envia esses valores ao Function Module **ZSOMA**, que retorna a soma através do parâmetro `E_OUTPUT`.

---

## 🧩 Estrutura do Function Module ZSOMA

### **IMPORTING**
- `I_INPUT1` – Número de dois dígitos (`NUMC2`)
- `I_INPUT2` – Número de dois dígitos (`NUMC2`)

### **EXPORTING**
- `E_OUTPUT` – Resultado da soma (`NUMC3`)

### **Lógica interna**
```abap
E_OUTPUT = I_INPUT1 + I_INPUT2.

REPORT ZSOMA_NUMEROS.

DATA: lv_output TYPE numc3.

PARAMETERS: p_input1 TYPE numc2,
            p_input2 TYPE numc2.

CALL FUNCTION 'ZSOMA'
  EXPORTING
    I_INPUTI       = p_input1
    I_INPUT2       = p_input2
 IMPORTING
   E_OUTPUT       = lv_output.
          
WRITE lv_output.

🎯 O que este exemplo ensina
Como criar um Function Module na SE37

Como definir parâmetros IMPORTING e EXPORTING

Como chamar o FM dentro de um report

Como trabalhar com tipos NUMC

Como retornar resultados ao utilizador
