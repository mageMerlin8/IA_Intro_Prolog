
%tamaño de vectores (listas)
size([],0).
size([_|Lista1], Resp) :-
  size(Lista1, Z),
  Resp is (1 + Z).

escribe_renglon([]).
escribe_renglon([X|L1]) :-
  write(X),write(' '),
  escribe_renglon(L1).
escribe_matriz([]).
escribe_matriz([X|L1]) :-
  escribe_renglon(X), nl,
  escribe_matriz(L1).

%suma y resta de vectores
suma_lista([], [], []).
suma_lista([X|Lista1], [Y|Lista2], [Z|Resp]) :-
  Z is X+Y,
  suma_lista(Lista1, Lista2, Resp).

resta_lista([], [], []).
resta_lista([X|Lista1], [Y|Lista2], [Z|Resp]) :-
  Z is X-Y,
  resta_lista(Lista1, Lista2, Resp).

lista_val([X], 1, X) :- !.
lista_val([X|_], 1, X) :- !.
lista_val([_|Lista1], N, Resp) :-
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
  write('No se pueden sumar matrices de tamanios diferentes'), nl.

resta_matrices([], [], []).
resta_matrices([X|Rows1], [Y|Rows2], [Z|RowsResp]) :-
  resta_lista(X, Y, Z),
  resta_matrices(Rows1, Rows2, RowsResp),!.
resta_matrices(_,_,_) :-
  write('No se pueden restar matrices de tamanios diferentes'), nl.

matriz_col([],_,[]).
matriz_col([X|L1], N, [Y|Lr]) :-
  lista_val(X, N, Y),
  matriz_col(L1, N, Lr).

%multiplica_renglon_matriz(renglon, matriz, numero, lista_de_respuesta)
multiplica_renglon_matriz(_, _, -1, []):-!.
multiplica_renglon_matriz(X, Y, N, [Resp|Lresp]):-
  ((M is N+1, size(Y,Tam), M =< Tam);
  M is -1),
  multiplica_renglon_matriz(X, Y, M, Lresp),
  matriz_col(Y, N, Col),
  producto_punto(X, Col, Resp), !.

multiplica_matrices([], _, []).
multiplica_matrices([X|L1], L2, [Z|L3]) :-
  multiplica_renglon_matriz(X, L2, 1, Z),
  multiplica_matrices(L1, L2, L3),!.
multiplica_matrices(_,_,_) :-
  write('No se pueden multiplicar las dos matrices dadas'), nl.

main :-
  %se definen las matrices para las pruebas
  Mat_K = [[2,0,1,3],
          [-1,3,1,2],
          [5,1,0,-1]],
  Mat_L = [[0,2,3,-1],
          [-1,0,2,2],
          [-1,0,-1,1]],
  Mat_M = [[1,1],
           [2,1],
           [-1,0],
           [3,-2]],

  %se escriben para asegurar que sean las correctas
  escribe_matriz(Mat_K),nl,
  escribe_matriz(Mat_L),nl,
  escribe_matriz(Mat_M),nl,

  %se hacen 3 pruebas para la suma:
  % 1 y 2: K+L = L+K =  2  2  4  2
  %                    -2  3  3  4
  %                     4  1 -1  0
  % 3 K+M debe dar error ya que no son compatibles para sumar
  suma_matrices(Mat_K,Mat_L, S1), escribe_matriz(S1),nl,
  suma_matrices(Mat_L,Mat_K, S2), escribe_matriz(S2),nl,
  suma_matrices(Mat_K,Mat_M, S3), escribe_matriz(S3),nl,

  %se hacen 3 pruebas para la resta:
  % 1) K-L =  2 -2 -2  4
  %          0  3 -1  0
  %          6  1  1 -2
  %
  % 2) L-K = -2  2  2 -4
  %           0 -3  1  0
  %          -6 -1 -1  2
  % 3) K-M debe dar error ya que no son compatibles para la resta
  resta_matrices(Mat_K,Mat_L, R1), escribe_matriz(R1),nl,
  resta_matrices(Mat_L,Mat_K, R2), escribe_matriz(R2),nl,
  resta_matrices(Mat_K,Mat_M, R3), escribe_matriz(R3),nl,

  % Se hacen 3 pruebas para la multiplicacion:
  % 1) K*M = 10 -4
  %          10 -2
  %           4  8
  % 2) L*M = -2  4
  %           3 -5
  %           3 -3
  % 3) K*K debe dar error ya que no son compatibles para la multiplicacion
  multiplica_matrices(Mat_K, Mat_M, M1), escribe_matriz(M1),nl,
  multiplica_matrices(Mat_L, Mat_M, M2), escribe_matriz(M2),nl,
  multiplica_matrices(Mat_K, Mat_K, M3), escribe_matriz(M3),nl, !.


  %%%%%%%%%%%%%%%%%%Hasta aqui todo bien%%%%%%%%%%%%%%%%%%%%%%
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

multiplica_matrices([[1,1,1],[1,1,1],[1,1,1]], [[1,2,3],[4,5,6],[7,8,9]],Z)

*/
