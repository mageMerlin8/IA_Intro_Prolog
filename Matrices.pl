/*
Manejador de matrices numericas. Suma, resta, multipilica y traspone matrices
si es posible y escribe un mensaje de error cuando no puede. Las matrices
son representadas como listas anidadas. Una matriz es una lista donde cada
elemento es una lista y representa cada renglon.
*/


/*
size(i,o) :- funcion que encuentra el tamanio de una lista.
            el primer argumento es la lista a medir y el segundo es un argumento
            de salida.
*/
size([],0).
size([_|Lista1], Resp) :-
  size(Lista1, Z),
  Resp is (1 + Z).

/*
escribe_renglon(i) :- toma una lista y la imprime. Se usa para imprimir matrices.
*/
escribe_renglon([]).
escribe_renglon([X|L1]) :-
  write(X),write(' '),
  escribe_renglon(L1).
/*
escribe_matriz(i) :- toma una matriz y la imprime renglon por renglon.
*/
escribe_matriz([]).
escribe_matriz([X|L1]) :-
  escribe_renglon(X), nl,
  escribe_matriz(L1).

/*
suma_lista(i, i, o) :- Toma dos listas como argumentos y las suma entrada por
resta_lista(i, i, o)   entrada. Las listas deben ser del mismo tamanio ya que no
                       existe definicion para la suma de vectores de tamanios diferentes.
                       Esto se utiliza para marcar error cuando no se pueden sumar o
                       restar matrices. La resta funciona igual. Estas dos funciones
                       se utilizan para sumar y restar matrices renglon por renglon.
*/
suma_lista([], [], []).
suma_lista([X|Lista1], [Y|Lista2], [Z|Resp]) :-
  Z is X+Y,
  suma_lista(Lista1, Lista2, Resp).
resta_lista([], [], []).
resta_lista([X|Lista1], [Y|Lista2], [Z|Resp]) :-
  Z is X-Y,
  resta_lista(Lista1, Lista2, Resp).

/*
suma_matrices(i, i, o) :- Funcion para sumar matrices. Usa la funcion suma_lista/3.
resta_matrices(i, i, o)   primer y segundo argumento son matrices del mismo tamanio
                          (si no son del mismo tamanio no las puede sumar y escribe
                          mensaje de error). El tercer argumento es de salida y es
                          una matriz del mismo tamanio. La resta funciona igual.
*/
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


/*
lista_val(i,i,o) :- Funcion para acceder a algun elemento en particular de una lista.
                    Toma una lista como primer argumento y un numero de elemento. Regresa
                    el valor del elemento en la lista. El primer elemento es 1
*/
lista_val([X], 1, X) :- !.
lista_val([X|_], 1, X) :- !.
lista_val([_|Lista1], N, Resp) :-
  M is N-1,
  lista_val(Lista1, M, Resp).
/*
matriz_col(i, i, o) :- Toma una matriz como primer argumento y un numero(n) como el
                       segundo. Regresa la columna n de la matriz. La primera columna
                       es la 1. Se apoya de la funcion lista_val/3.
*/
matriz_col([],_,[]).
matriz_col([X|L1], N, [Y|Lr]) :-
  lista_val(X, N, Y),
  matriz_col(L1, N, Lr).

/*
producto_punto(i, i, o) :- Funcion para calcular el producto punto entre dos
                           vectores. Los primeros dos argumentos son vectores
                           y el tercero es el producto punto entre ellos. Esta
                           funcion se utiliza para la multiplicacion de matrices.
*/
producto_punto([], [], 0).
producto_punto([X|Lista1], [Y|Lista2], Resp) :-
  producto_punto(Lista1, Lista2, Mini_Resp),
  Resp is Mini_Resp + X*Y.


/*
multiplica_renglon_matriz(i,i,i,o) :- Funcion auxiliar para la multiplicacion
                                      de matrices. Toma un renglon y una matriz
                                      y un numero (variable auxiliar) y regresa
                                      una lista del producto punto entre el renglon
                                      y cada uno de las columnas de la matriz.
*/
multiplica_renglon_matriz(_, _, -1, []):-!.
multiplica_renglon_matriz(X, Y, N, [Resp|Lresp]):-
  ((M is N+1, size(Y,Tam), M =< Tam);
  M is -1),
  multiplica_renglon_matriz(X, Y, M, Lresp),
  matriz_col(Y, N, Col),
  producto_punto(X, Col, Resp), !.
/*
multiplica_matrices(i, i, o) :- Multiplica las dos matrices dadas apoyandose de
                                las funciones anteriores. Los primeros dos argumentos
                                son matrices y el tercero regresa la matriz. Las
                                matrices deben ser compatibles para multiplicar. Si
                                no lo son, escribe un mensaje de error.
*/
multiplica_matrices([], _, []).
multiplica_matrices([X|L1], L2, [Z|L3]) :-
  multiplica_renglon_matriz(X, L2, 1, Z),
  multiplica_matrices(L1, L2, L3),!.
multiplica_matrices(_,_,_) :-
  write('No se pueden multiplicar las dos matrices dadas'), nl.

/*
transpuesta(i,o) :- Toma una matriz como primer argumento y regresa la transpuesa.
                    Unicamente hace una llamada a la funcion a_transpuesta/3 ya que
                    esta toma una variable extra para utilizarla como auxiliar.

a_transpuesta(i,i,o) :- Hace el trabajo de trasponer una matriz convirtiendo cada
                        columna de la matriz original en renglon de la nueva. El
                        primer argumento es una matriz y el segundo un numero (variable
                        auxiliar) que sirve para llevar la cuenta de la columna en la que va.
*/
transpuesta(X,Y) :-
  a_transpuesta(X,1,Y).
a_transpuesta(_,-1,[]) :- !.
a_transpuesta([X|L1],N,[Y|L2]) :-
  ((M is N+1, size(X, Tam), M =< Tam);
    M is -1),
  a_transpuesta([X|L1], M, L2),
  matriz_col([X|L1],N,Y),!.

/*
main :- Funcion para hacer todas las pruebas desde una sola consulta.
        Se encarga de declarar las matrices para pruebas (mismas pruebas y comentarios
        que en el ejecutable de java).
*/
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
  multiplica_matrices(Mat_K, Mat_K, M3), escribe_matriz(M3),nl,
  %  Two transposition tests:
  % 1) K(T) =  2 -1  5
  %            0  3  1
  %            1  1  0
  %            3  2 -1
  % 2) M(T) =  1  2 -1  3
  %            1  1  0 -2
  transpuesta(Mat_K, T1), escribe_matriz(T1),nl,
  transpuesta(Mat_M, T2), escribe_matriz(T2),nl,!.




/*
main. <----- Consulta sugerida.
*/
