📘 ABAP Selection Screen Demo
Exemplo completo de criação e manipulação de telas de seleção no SAP ABAP
Este repositório contém um programa ABAP demonstrando a construção de uma tela de seleção (selection screen) utilizando diversos elementos disponíveis no SAP GUI, incluindo parâmetros, ranges, radiobuttons, checkboxes, listbox, botões e manipulação de eventos como AT SELECTION-SCREEN e AT SELECTION-SCREEN OUTPUT.

O objetivo é servir como referência prática para estudantes e profissionais que desejam compreender como montar telas de seleção dinâmicas e interativas em ABAP.

📑 Funcionalidades Implementadas
🔹 1. Parâmetros (PARAMETERS)
Utilizados para filtros simples e valores únicos.
Exemplo:

abap
PARAMETERS: p_mtart TYPE mara-mtart DEFAULT 'FERT' OBLIGATORY.
🔹 2. Faixa de valores (SELECT-OPTIONS)
Permite seleção por intervalos, múltiplos valores ou padrões.

abap
SELECT-OPTIONS: s_matnr FOR mara-matnr OBLIGATORY NO-EXTENSION.
O bloco INITIALIZATION define valores padrão para o range.

🔹 3. Radiobuttons
Permitem selecionar apenas uma opção dentro de um grupo.

abap
PARAMETERS: rb_ativo RADIOBUTTON GROUP rgb1,
            rb_inat  RADIOBUTTON GROUP rgb1,
            rb_ambos RADIOBUTTON GROUP rgb1 DEFAULT 'X'.
🔹 4. Checkboxes
Usados para seleções múltiplas independentes.

abap
PARAMETERS: cx_ativo AS CHECKBOX DEFAULT 'X',
            cx_inat  AS CHECKBOX,
            cx_ambos AS CHECKBOX.
🔹 5. Listbox (VRM_SET_VALUES)
Lista de seleção preenchida dinamicamente no AT SELECTION-SCREEN OUTPUT.

abap
CALL FUNCTION 'VRM_SET_VALUES'
🔹 6. Botões na tela e na barra de funções
Inclui:

Botão customizado na tela (PUSHBUTTON)

Botão na barra de ferramentas (FUNCTION KEY 1)

Eventos capturados via:

abap
AT SELECTION-SCREEN.
  IF sy-ucomm = 'BUT1'.
🎯 Eventos Utilizados
AT SELECTION-SCREEN
Captura ações do usuário, como clique em botões.

AT SELECTION-SCREEN OUTPUT
Usado para modificar elementos da tela dinamicamente (ex.: preencher listbox).

INITIALIZATION
Define valores iniciais para ranges, botões e textos.

🧩 Estrutura da Tela
O programa utiliza blocos com FRAME TITLE, comentários, espaçamentos e organização visual para tornar a tela mais clara e profissional.

📂 Objetivo do Programa
Este exemplo demonstra:

Construção completa de uma tela de seleção ABAP

Uso de diferentes tipos de input

Manipulação de eventos de interface

Preenchimento dinâmico de listbox

Interação com botões e códigos de função (sy-ucomm)

Ideal para quem está aprendendo ABAP ou deseja ter um template reutilizável para futuros projetos.

🚀 Como Executar
Copie o código para um programa Z no SAP GUI.

Ative e execute (F8).

Interaja com os elementos da tela para visualizar o comportamento dos eventos.

📎 Autor
Paulo — Estudante de Técnico de Informática – Sistemas (IEFP)
Apaixonado por ABAP, Python e desenvolvimento SAP.
