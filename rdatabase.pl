/* relations database */

% semantic symmetries
% sym(Y,X)    X -> Y
sym([answer,greet],[question,you]) :- !.
sym([greet,repeate(X)],[iam,repeate(X)]) :- !.
% Id
sym(X,X) :- osemval(X), isemval(X), !.
