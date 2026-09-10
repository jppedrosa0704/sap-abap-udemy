📘 README — Exemplo de Herança em ABAP OO
🐾 Sobre o Projeto
Este projeto demonstra um exemplo simples de Programação Orientada a Objetos em ABAP, utilizando:

Classes

Herança

Redefinição de métodos

Polimorfismo

Instanciação de objetos

Execução via REPORT

O objetivo é apresentar como diferentes animais podem “falar”, cada um com seu próprio comportamento, herdando de uma classe base.

🧱 Estrutura das Classes
🔹 Classe Pai: ZCL_ANIMAL
Representa um animal genérico.

Método:

FALAR → retorna um texto padrão: “O animal faz um som.”

🔹 Classe Filha: ZCL_CACHORRO
Herda de ZCL_ANIMAL.

Método redefinido:

FALAR → retorna: “O cachorro faz au au.”

🔹 Classe Filha: ZCL_GATO
Herda de ZCL_ANIMAL.

Método redefinido:

FALAR → retorna: “O gato faz miau.”

📄 Código Completo

REPORT zclasse_animal.

CLASS zcl_animal DEFINITION.
  PUBLIC SECTION.
    METHODS falar
      RETURNING VALUE(rv_texto) TYPE string.
ENDCLASS.

CLASS zcl_animal IMPLEMENTATION.
  METHOD falar.
    rv_texto = 'O animal faz um som'.
  ENDMETHOD.
ENDCLASS.

CLASS zcl_cachorro DEFINITION INHERITING FROM zcl_animal.
  PUBLIC SECTION.
    METHODS falar REDEFINITION.
ENDCLASS.

CLASS zcl_cachorro IMPLEMENTATION.
  METHOD falar.
    rv_texto = 'O cachorro faz au au.'.
  ENDMETHOD.
ENDCLASS.

CLASS zcl_gato DEFINITION INHERITING FROM zcl_animal.
  PUBLIC SECTION.
    METHODS falar REDEFINITION.
ENDCLASS.

CLASS zcl_gato IMPLEMENTATION.
  METHOD falar.
    rv_texto = 'O gato faz miau.'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA(lo_animal)   = NEW zcl_animal( ).
DATA(lo_cachorro) = NEW zcl_cachorro( ).
DATA(lo_gato)     = NEW zcl_gato( ).

WRITE: / lo_animal->falar( ).
WRITE: / lo_cachorro->falar( ).
WRITE: / lo_gato->falar( ).

🖥️ Saída Esperada

O animal faz um som
O cachorro faz au au.
O gato faz miau.


🎯 Conceitos Demonstrados
✔ Herança
As classes ZCL_CACHORRO e ZCL_GATO herdam de ZCL_ANIMAL.

✔ Redefinição (REDEFINITION)
Cada animal redefine o método FALAR para implementar seu próprio comportamento.

✔ Polimorfismo
O mesmo método (FALAR) produz resultados diferentes dependendo da classe instanciada.

✔ Instanciação de Objetos
Uso de NEW zcl_cachorro( ), NEW zcl_gato( ), etc.

📚 Ideal para:
Estudantes de ABAP OO

Exercícios de UFCD

Treinamento de herança e polimorfismo

Repositórios educacionais no GitHub
