*&---------------------------------------------------------------------*
*& Report ZABAP_102
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_102.

DATA lv_letra01 TYPE c. " Forma Clássica (Tradicional)
DATA lv_letra02 TYPE c LENGTH 10. " Forma Clássica (Tradicional)
DATA lv_letra03(10) TYPE c. " Forma antiga (obsoleto) de declaração
DATA(lv_letra04) = 'Paulo'. " Forma moderna de declaração (I

lv_letra01 = 'Paulo'.
lv_letra02 = 'Paulo'.
lv_letra03 = 'Paulo'.

WRITE: / 'lv_letra01', lv_letra01.
WRITE: / 'lv_letra02', lv_letra02.
WRITE: / 'lv_letra03', lv_letra03.
WRITE: / 'lv_letra04', lv_letra04.
