%valor_max(i[instantiated/input],i,o[output/open]):
valor_max(X,Y,Z) :-
    X>Y, Z is X.

valor_max(X,Y,Z) :-
    X=<Y, Z is Y.
