
%tamaño de vectores (listas)
size([],Resp) :- Resp is 0.
size([Y|Lista1], Resp) :-
  size(Lista1, Z),
  Resp is (1 + Z).

%suma y resta de vectores
suma_lista([], [], []).
suma_lista([X|Lista1], [Y|Lista2], [Z|Resp]) :-
  Z is X+Y,
  suma_lista(Lista1, Lista2, Resp).

resta_lista([], [], []).
resta_lista([X|Lista1], [Y|Lista2], [Z|Resp]) :-
  Z is X-Y,
  resta_lista(Lista1, Lista2, Resp).

lista_val([X|Lista], 1, X) :- !.
lista_val([X|Lista1], N, Resp) :-
  M is N-1,
  lista_val(Lista1, M, Resp).

producto_punto([], [], 0).
producto_punto([X|Lista1], [Y|Lista2], Resp) :-
  producto_punto(Lista1, Lista2, Mini_Resp),
  Resp is Mini_Resp + X*Y.

suma_matrices([], [], []).
suma_matrices([X|Rows1], [Y|Rows2], [Z|RowsResp]) :-
  suma_lista(X, Y, Z),
  suma_matrices(Rows1, Rows2, RowsResp),!.
suma_matrices(_,_,_) :-
  write('error').

matriz_col([],_,[]).
matriz_col([X|L1], N, [Y|Lr]) :-
  lista_val(X, N, Y),
  matriz_col(L1, N, Lr).





multiplica_renglon_matriz(X, Y, N, Resp):-
  matriz_col(Y, N, Col),
  producto_punto(X, Col, Resp).

/*
multiplica_matrices([], [], []).
multiplica_matrices([X|Rows1], Y, [Z|RowsResp]) :-
*/

transpuesta([X|L1],[X|L2]) :-
  transpuesta(L1, L2).
  /*
transpuesta([], []).
transpuesta(X,[Y|L2]) :-
  matriz_col(X, , Y)

[[2,2],[2,2]]

[[2,2],[2,2]]
[[1,2],[3,4]]

*/
