fact(0,1).
fact(X,Y) :-
    Z is X-1,
    fact(Z,W),
    Y is X*W.

fibo(0,1) :- X is 1, !.
fibo(1,1) :- X is 1, !.
fibo(N,R) :-
    M1 is N-1,
    M2 is N-2,
    fibo(M1, R1),
    fibo(M2, R2),
    R is R1+R2,
    assert(fibo(N,R)).
