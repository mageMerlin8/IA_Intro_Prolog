fact(0,X) :- X is 1, !.
fact(X,Y) :-
  Z is X-1,
  fact(Z,W),
  Y is X*W.

fibo(0,X) :- X is 1, !.
fibo(1,X) :- X is 1, !.
fibo(N,R) :-
  M1 is N-1,
  M2 is N-2,
  fibo(M1, R1),
  fibo(M2, R2),
  R is R1+R2,
  write('Fib '),write(N), write(' = '),write(R),nl,
  asserta((fibo(N,X) :- X is R,!)).

/*
Este programa calcula fibonacci y lo guarda en su base dinámica
para no reptetir operaciones.
*/

%Un par de consultas sugeridas:

  /*
  ?- fibo(3,X).
  ?- fibo(10,X).
  */

  /*
  ?- fibo(100,X).
  ?- fibo(100,X).
  */
