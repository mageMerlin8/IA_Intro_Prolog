%?-s pertenece_a(i, i).
pertenece_a(X, [X|_]) :-
  !.
pertenece_a(X, [_|Z]) :-
  pertenece_a(X,Z).
