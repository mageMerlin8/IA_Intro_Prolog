% combina([a,b,c], [1,2], X).
% combina(i,i,o).
% combina(i,i,i).
% combina(o,i,i).
% combina(i.o.i).
% combina([3,2,4], X, Y).
combina([], Lista, Lista) :-
  !.

combina([X|Lista1], Lista2, [X|Lista3]) :-
  combina(Lista1, Lista2, Lista3).
