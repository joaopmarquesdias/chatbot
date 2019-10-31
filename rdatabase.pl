/* relations database */

% TODO: create a collector sym -> sym([],[_])
% that turns any unknown semantic in to empty semantic
% currently not working because semantics with 2 objects
% are tested after semantics with 1 object

% semantic symmetries
% sym(Y,X)    X -> Y (swaped to be compatible with map)
sym([[answer,greet]],[question,you]) :- !.
sym([greet,repeate(X)],[iam,repeate(X)]) :- !.
% Id
sym(X,X) :- osemval(X), isemval(X), !.
% no sym
%sym([],[_]).
