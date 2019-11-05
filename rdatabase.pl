/* relations database */

% semantic symmetries
% sym(Y,X)    X -> Y
sym([answer_greet],[question,you]) :- !.
sym([greet,repeate(X)],[iam,repeate(X)]) :- !.
sym([know_picasso],[know, picasso]) :- !.
% Id
sym(X,X) :- osemval(X), isemval(X), !.
