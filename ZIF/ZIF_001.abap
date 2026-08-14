"&---------------------------------------------
*& REPORT ZIF_001
*& Author: João Paulo Pedrosa Soares
"&---------------------------------------------

REPORT ZIF_001.

DATA lv_numero TYPE i VALUE 9.

*IF SIMPLES
*IF lv_numero = 10.
*  WRITE 'O número é igual 10'.
*ENDIF.


  "IF com ELSE
*if LV_NUMERO >= 18.
*  write 'mAIOR DE IDADE'.
*else.
*  write 'mENOR DE IDADE'.
*endif.


"    IF com ELSEIF e com ELSE

*DATA lv_nota TYPE i VALUE 6.
*
*IF lv_nota >= 9.
*  WRITE 'Excelente'.
*ELSEIF lv_nota >= 7.
*  WRITE 'Aprovado'.
*ELSEIF lv_nota >= 5.
*  WRITE 'Precisa estudar'.
*ELSE.
*  WRITE 'Reprovado'.
*ENDIF.



" Condicionais com operadores lógicos
*DATA lv_altura TYPE p DECIMALS 2.
*
*lv_altura = '1.40'.
*IF lv_altura < '1.60'.
*  WRITE 'Baixo'.
*ELSEIF lv_altura >= '1.60' and lv_altura <= '1.80'.
*  WRITE 'Mediana'.
*ELSE.
*  WRITE 'Alto'.
*ENDIF.

"  Condicionais com Bool
*DATA: lv_idade TYPE i VALUE 30,
*      lv_cnh TYPE abap_bool VALUE abap_true.
*
*IF lv_idade >= 18 and lv_cnh = abap_true.
*  WRITE 'Pode Dirigir'.
*ELSE.
*  WRITE 'Não pode dirigir'.
*
*ENDIF.

"  condicionais usando o OR

*DATA lv_status TYPE c LENGTH 10 VALUE 'liberado'.
*
*IF lv_status = 'liberado' or lv_status = 'Ativo'.
*  WRITE 'Pode Processar'.
*ELSE.
*  WRITE 'Não pode processar'.
*
*ENDIF.

DATA lv_material TYPE mara-matnr.

lv_material = '123'.

IF lv_material is INITIAL.
  WRITE 'Material não informado'.
ELSE.
  WRITE: 'Material informado é', lv_material .

ENDIF.

lv_material = ''.

IF lv_material is not INITIAL.
  WRITE: / 'Material informado é', lv_material .
ELSE.
  WRITE: / 'Material não informado'.
ENDIF.
