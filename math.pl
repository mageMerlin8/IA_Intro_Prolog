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
    asserta((fibo(N,X) :- X is R,!)).

/*
Este programa calcula fibonacci y lo guarda en su base dinámica
para no reptetir operaciones.

[trace]  ?- fibo(5,X).
   Call: (8) fibo(5, _852) ? creep
   Call: (9) _1076 is 5+ -1 ? creep
   Exit: (9) 4 is 5+ -1 ? creep
   Call: (9) _1082 is 5+ -2 ? creep
   Exit: (9) 3 is 5+ -2 ? creep
   Call: (9) fibo(4, _1084) ? creep
   Call: (10) _1088 is 4+ -1 ? creep
   Exit: (10) 3 is 4+ -1 ? creep
   Call: (10) _1094 is 4+ -2 ? creep
   Exit: (10) 2 is 4+ -2 ? creep
   Call: (10) fibo(3, _1096) ? creep
   Call: (11) _1100 is 3+ -1 ? creep
   Exit: (11) 2 is 3+ -1 ? creep
   Call: (11) _1106 is 3+ -2 ? creep
   Exit: (11) 1 is 3+ -2 ? creep
   Call: (11) fibo(2, _1108) ? creep
   Call: (12) _1106 is 2 ? creep
   Exit: (12) 2 is 2 ? creep
   Exit: (11) fibo(2, 2) ? creep
   Call: (11) fibo(1, _1108) ? creep
   Call: (12) _1106 is 1 ? creep
   Exit: (12) 1 is 1 ? creep
   Exit: (11) fibo(1, 1) ? creep
   Call: (11) _1112 is 2+1 ? creep
   Exit: (11) 3 is 2+1 ? creep
^  Call: (11) asserta((fibo(3, _1106):-_1106 is 3, !)) ? creep
^  Exit: (11) asserta((fibo(3, _1106):-_1106 is 3, !)) ? creep
   Exit: (10) fibo(3, 3) ? creep
   Call: (10) fibo(2, _1138) ? creep
   Call: (11) _1136 is 2 ? creep
   Exit: (11) 2 is 2 ? creep
   Exit: (10) fibo(2, 2) ? creep
   Call: (10) _1142 is 3+2 ? creep
   Exit: (10) 5 is 3+2 ? creep
^  Call: (10) asserta((fibo(4, _1136):-_1136 is 5, !)) ? creep
^  Exit: (10) asserta((fibo(4, _1136):-_1136 is 5, !)) ? creep
   Exit: (9) fibo(4, 5) ? creep
   Call: (9) fibo(3, _1168) ? creep
   Call: (10) _1166 is 3 ? creep
   Exit: (10) 3 is 3 ? creep
   Exit: (9) fibo(3, 3) ? creep
   Call: (9) _852 is 5+3 ? creep
   Exit: (9) 8 is 5+3 ? creep
^  Call: (9) asserta((fibo(5, _1166):-_1166 is 8, !)) ? creep
^  Exit: (9) asserta((fibo(5, _1166):-_1166 is 8, !)) ? creep
   Exit: (8) fibo(5, 8) ? creep
X = 8.

[trace]  ?- fibo(5,X).
   Call: (8) fibo(5, _1356) ? creep
   Call: (9) _1356 is 8 ? creep
   Exit: (9) 8 is 8 ? creep
   Exit: (8) fibo(5, 8) ? creep
X = 8.



*/
