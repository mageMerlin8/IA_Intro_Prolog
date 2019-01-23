grande(bisonte).
grande(oso).
grande(elefante).

chico(gato).

cafe(oso).
cafe(bisonte).

negro(gato).

gris(elefante).

oscuro(Z) :-
    cafe(Z).

oscuro(Z) :-
    negro(Z).

/*
oscuro(X),grande(X),write(X),nl,fail.

*/

/*
--Debugger--
?- trace.
true.

[trace]  ?- oscuro(X),grande(X),write(X).
   Call: (9) oscuro(_664) ? creep
   Call: (10) cafe(_664) ? creep
   Exit: (10) cafe(oso) ? creep
   Exit: (9) oscuro(oso) ? creep
   Call: (9) grande(oso) ? creep
   Exit: (9) grande(oso) ? creep
   Call: (9) write(oso) ? creep
oso
   Exit: (9) write(oso) ? creep
X = oso ;
   Redo: (10) cafe(_664) ? creep
   Exit: (10) cafe(bisonte) ? creep
   Exit: (9) oscuro(bisonte) ? creep
   Call: (9) grande(bisonte) ? creep
   Exit: (9) grande(bisonte) ? creep
   Call: (9) write(bisonte) ? creep
bisonte
   Exit: (9) write(bisonte) ? creep
X = bisonte ;
   Redo: (9) oscuro(_664) ? creep
   Call: (10) negro(_664) ? creep
   Exit: (10) negro(gato) ? creep
   Exit: (9) oscuro(gato) ? creep
   Call: (9) grande(gato) ? creep
   Fail: (9) grande(gato) ? creep
false.*/

/*
IGUAL QUE =:=
DIFERENTE D E =\=
MENOR QUE <
MAYOR QUE >
MENOR 0 IGUAL QUE =<
MAYOR 0 IGUAL QUE >=

SUMA +
RESTA –
MULTIPLICACIÓN *
DIVISIÓN DE NÚMEROS REALES /
RESIDUO DE LA DIVISIÓN DE NÚMEROS ENTEROS rem
COCIENTE DE LA DIVISIÓN DE NÚMEROS ENTEROS //
EXPONENCIACIÓN **
*/
