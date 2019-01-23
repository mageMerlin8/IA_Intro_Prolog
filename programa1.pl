hombre(jose).
hombre(juan).
mujer(maria).

papa(juan, jose).
papa(juan, maria).

valioso(dinero).
dificilDeObtener(dinero).
le_da(pedro, libro, antonio).

hermana(X, Y) :-
    papa(Z, X),
    mujer(X),
    papa(Z, Y),
    X\==Y.

humano(X) :-
    mujer(X).

humano(X) :-
    hombre(X).


/*
hombre(maria), mujer(maria).
papa(X, _),write(X),nl,fail.
hermana(maria,_).
hermana(_,jose).
hombre(_).
papa(jose,_).
*/
