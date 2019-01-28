/*

    Hechos son predicados de orden 0.
    Reglas son predicados de orden 1. (primer orden)
    Predicados que se usan como argumentos de otros predicados. (Functores)

*/


evento(siglo15,"Portugueses y españoles exploran África, América y
Asia").
evento(siglo16,"Leonardo da Vinci pinta la Mona Lisa").
evento(siglo17,"Construcción del Taj Mahal").
evento(siglo18,"Benjamin Franklin inventa lentes bifocales, estudia
electricidad").
evento(siglo19,"Independencia de México").
evento(siglo20,"Invención de Internet").
evento(siglo21,"Caída de las Torres del World Trade Center en Nueva
York").

% se usa el predicado evento(X, Y) como functor.
antes_de(evento(siglo15,_),evento(siglo16,_)).
antes_de(evento(siglo16,_),evento(siglo17,_)).
antes_de(evento(siglo17,_),evento(siglo18,_)).
antes_de(evento(siglo18,_),evento(siglo19,_)).
antes_de(evento(siglo19,_),evento(siglo20,_)).
antes_de(evento(siglo20,_),evento(siglo21,_)).
antes_de(X,Y):-
  antes_de(X,Z),
  antes_de(Z,Y).

% Posible consulta:
/*
?-antes_de(evento(siglo17,"Construcción del TajMahal"),evento(siglo20,"Invención de Internet")),!.
*/
