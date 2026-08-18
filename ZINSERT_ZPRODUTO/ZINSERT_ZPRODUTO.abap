REPORT zinsert_zproduto.

DATA: ls_prod TYPE zproduto.

" Produto 1
ls_prod-id         = '0001'.
ls_prod-produto    = 'Teclado'.
ls_prod-quantidade = 2.
ls_prod-valor      = 150.
ls_prod-status     = 'A'.

INSERT zproduto FROM ls_prod.

" Produto 2
ls_prod-id         = '0002'.
ls_prod-produto    = 'Mouse'.
ls_prod-quantidade = 5.
ls_prod-valor      = 80.
ls_prod-status     = 'A'.

INSERT zproduto FROM ls_prod.

" Produto 3
ls_prod-id         = '0003'.
ls_prod-produto    = 'Monitor'.
ls_prod-quantidade = 1.
ls_prod-valor      = 900.
ls_prod-status     = 'C'.

INSERT zproduto FROM ls_prod.

" Produto 4
ls_prod-id         = '0004'.
ls_prod-produto    = 'Cabo HDMI'.
ls_prod-quantidade = 10.
ls_prod-valor      = 25.
ls_prod-status     = 'A'.

INSERT zproduto FROM ls_prod.

" Produto 5
ls_prod-id         = '0005'.
ls_prod-produto    = 'Notebook'.
ls_prod-quantidade = 3.
ls_prod-valor      = 3500.
ls_prod-status     = 'A'.

INSERT zproduto FROM ls_prod.

" Produto 6
ls_prod-id         = '0006'.
ls_prod-produto    = 'Impressora'.
ls_prod-quantidade = 2.
ls_prod-valor      = 1200.
ls_prod-status     = 'C'.

INSERT zproduto FROM ls_prod.

" Produto 7
ls_prod-id         = '0007'.
ls_prod-produto    = 'Webcam'.
ls_prod-quantidade = 8.
ls_prod-valor      = 220.
ls_prod-status     = 'B'.

INSERT zproduto FROM ls_prod.

" Produto 8
ls_prod-id         = '0008'.
ls_prod-produto    = 'Fone de Ouvido'.
ls_prod-quantidade = 6.
ls_prod-valor      = 180.
ls_prod-status     = 'B'.

INSERT zproduto FROM ls_prod.

COMMIT WORK.

WRITE: 'Registros inseridos com sucesso!'.
