/* relations database */

% semantic symmetries
% sym(Y,X)    X -> Y (swaped to be compatible with map)
sym([greet],[greet]).
sym([[answer,greet]],[question,you]).
sym([greet,repeate(X)],[iam,repeate(X)]).
