*&---------------------------------------------------------------------*
*& Report ZABAP_101
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_101.

DATA: a         TYPE p DECIMALS 2 VALUE 10,
      b         TYPE p DECIMALS 2 VALUE 3,
      resultado TYPE p DECIMALS 2.

resultado = a + b. " Adição
WRITE: / 'Adição', resultado.

resultado = a - b. " Subtração
WRITE: / 'Subtração', resultado.

resultado = a * b. "Multiplicação
WRITE: / 'Multiplicação', resultado.

resultado = a / b. "Divisão
WRITE: / 'Divisão', resultado.

resultado = a ** b. "Potência
WRITE: / 'Potência', resultado.

resultado = a MOD b. "Resto da divisão
WRITE: / 'Resto da divisão', resultado.

resultado = a DIV b. "Divisão inteira
WRITE: / 'Divisão inteira', resultado.
