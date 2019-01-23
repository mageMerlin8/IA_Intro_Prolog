saludos :-
    prolg_pais(Pais1),
    write(Pais1),
    write(" saluda a: "),nl,!,
    prolg_pais(Pais2),
    Pais1 \= Pais2,
    write(Pais2),nl,
    fail.
saludos.
prolg_pais(japon).
prolg_pais(francia).
prolg_pais(hungria).
prolg_pais(bhutan).
prolg_pais(colombia).
prolg_pais(espania).
