🇵🇹 README – ZABAP_102
markdown
# ZABAP_102 – Declaração de Variáveis do Tipo `c` em ABAP

Este programa demonstra diferentes formas de declarar variáveis do tipo caractere (`c`) na linguagem ABAP, incluindo estilos clássicos, antigos e modernos.  
O objetivo é apresentar como cada forma funciona e como os valores são exibidos no console.

## 📌 Objetivo do Código
O report **ZABAP_102** mostra quatro maneiras de declarar variáveis do tipo caractere:

- Declaração clássica sem comprimento explícito  
- Declaração clássica com comprimento definido  
- Declaração antiga usando sintaxe obsoleta  
- Declaração moderna usando `DATA(...) = value`

## 🧩 Variáveis Declaradas

### 1. **lv_letra01**
```abap
DATA lv_letra01 TYPE c.
Forma clássica.
Comprimento padrão: 1 caractere.

2. lv_letra02
abap
DATA lv_letra02 TYPE c LENGTH 10.
Forma clássica com comprimento definido.

3. lv_letra03
abap
DATA lv_letra03(10) TYPE c.
Forma antiga (obsoleta).
Ainda funciona, mas não deve ser usada em novos desenvolvimentos.

4. lv_letra04
abap
DATA(lv_letra04) = 'Paulo'.
Forma moderna de declaração com inferência de tipo.

🧮 Atribuição de Valores
Todas as variáveis recebem o valor 'Paulo':

abap
lv_letra01 = 'Paulo'.
lv_letra02 = 'Paulo'.
lv_letra03 = 'Paulo'.
A variável moderna já nasce com o valor 'Paulo'.

🖨️ Saída no Console
O programa exibe cada variável usando WRITE:

Código
lv_letra01  Paulo
lv_letra02  Paulo
lv_letra03  Paulo
lv_letra04  Paulo
