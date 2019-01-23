%valor_max(i[instantiated/input],i,o[output/open]):

valor_max(X,Y,X) :-
    X>Y,!.
valor_max(X,Y,Y) :-
    X=<Y.
