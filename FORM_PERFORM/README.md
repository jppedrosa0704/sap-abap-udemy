# 📘 ABAP – Exemplo de Modularização com PERFORM IN PROGRAM

Este repositório demonstra como dividir lógica ABAP em múltiplos programas usando
**PERFORM IN PROGRAM**, permitindo reutilização de rotinas (`FORM`) entre relatórios
diferentes.

O projeto contém dois programas:

- **ZFORMSOMA** → Programa principal que chama uma rotina externa.
- **ZCALC_FORM** → Programa auxiliar contendo o `FORM SOMA`.

---

## 📌 Objetivo

Mostrar como:

- Criar uma rotina (`FORM`) em um programa separado.
- Chamá-la a partir de outro programa usando:
  ```abap
  PERFORM soma IN PROGRAM ZCALC_FORM USING ... CHANGING ... IF FOUND.

🧩 Estrutura dos Programas
1️⃣ Programa Principal – ZFORMSOMA
Este programa recebe dois números, tenta executar o FORM SOMA localizado em outro
programa e exibe o resultado.

Trecho principal:

PERFORM soma IN PROGRAM ZCALC_FORM USING p_input1 p_input2 CHANGING lv_output IF FOUND.

IF lv_output IS NOT INITIAL.
  WRITE: / |Resultado { lv_output }|.
ELSE.
  WRITE: / 'Não foi possível executar o programa.'.
ENDIF.

2️⃣ Programa Auxiliar – ZCALC_FORM
Este programa contém a rotina FORM SOMA, responsável por somar os dois valores.

FORM soma USING pv_input1
                pv_input2
          CHANGING pv_output.

  pv_output = pv_input1 + pv_input2.

ENDFORM.


🔧 Funcionamento
O usuário informa dois números.

O programa ZFORMSOMA tenta chamar o FORM soma dentro de ZCALC_FORM.

Se o FORM existir:

A soma é realizada.

O resultado é exibido.

Se o FORM não existir:

A mensagem de erro é exibida.

O uso de IF FOUND evita dumps caso o FORM não esteja disponível.

🎯 Benefícios da Abordagem
Reutilização de código entre múltiplos programas.

Separação clara entre lógica e interface.

Facilita manutenção e expansão futura.

Demonstra boas práticas de modularização em ABAP.

📎 Requisitos
SAP NetWeaver AS ABAP

Acesso ao ABAP Editor (SE38 / SE80)

Autorização para criar programas Z

📚 Aprendizados
Este exemplo ensina:

Modularização com FORM.

Uso de PERFORM IN PROGRAM.

Boas práticas de organização de código ABAP.

Tratamento seguro com IF FOUND.

🧑‍💻 Autor
Paulo – Estudante de ABAP e Programação
Porto, Portugal
