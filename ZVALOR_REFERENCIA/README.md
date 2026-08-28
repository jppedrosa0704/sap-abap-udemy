# 📘 ABAP – Exemplo de Passagem por Valor e Referência em FORM

Este repositório demonstra como funciona a passagem de parâmetros em rotinas ABAP
(`FORM`), destacando a diferença entre **USING VALUE(...)** e **USING ...** (referência),
além do uso de **CHANGING**.

O programa utilizado é **ZFORM**, que executa uma soma simples.

---

## 📌 Objetivo

Explicar:

- Como parâmetros são recebidos dentro de um FORM.
- Diferença entre **passagem por valor** e **passagem por referência**.
- Como o ABAP trata alterações internas nos parâmetros.
- Como o resultado é retornado ao programa chamador.

---

## 🧩 Estrutura do Programa

### 1️⃣ **Programa ZFORM**

O programa recebe dois números e chama o FORM `soma`:

```abap
REPORT ZFORM.

DATA: lv_output TYPE p DECIMALS 2.

PARAMETERS: p_input1 TYPE numc3,
            p_input2 TYPE numc3.

PERFORM soma USING p_input1 p_input2 CHANGING lv_output.

WRITE: / lv_output.

2️⃣ Rotina FORM SOMA

🔍 Entendendo o Comportamento
✔ USING VALUE(pv_input1)
Passagem por valor → o ABAP cria cópias internas dos parâmetros.

Isso significa:

pv_input1 e pv_input2 não são os valores originais.

Alterações dentro do FORM não afetam p_input1 e p_input2.

Por isso, mesmo que o usuário digite:

p_input1 = 123
p_input2 = 456

O FORM vai usar:

pv_input1 = 10
pv_input2 = 7

✔ CHANGING pv_output
Passagem por referência → o valor calculado retorna ao programa chamador.

🔄 Como usar passagem por referência
Se quiser que o FORM altere os valores originais, basta remover VALUE(...):

FORM soma USING pv_input1
                pv_input2
          CHANGING pv_output.

📚 Aprendizados
Este exemplo ensina:

Diferença entre passagem por valor e referência.

Como o ABAP trata parâmetros em FORM.

Como retornar valores com CHANGING.

Boas práticas de modularização simples.

🧑‍💻 Autor
Paulo – Estudante de ABAP e Programação
Porto, Portugal


