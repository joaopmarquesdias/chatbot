/* relations database */

%TODO: relations by member(X,S)!

% semantic symmetries
% sym(Y,X)    X -> Y
% "Small talk"
sym([answer_greet],[question,you]) :- !.
sym([greet,repeate(X)],[iam,repeate(X)]) :- !.
% Sepecific topics
sym([know_themes],[themes]) :- !.
sym([know_movements],[movements]) :- !.
sym([know_painters],[painters]) :- !.
% Artists
sym([know_picasso],[know, picasso]) :- !.
sym([know_van_gogh],[know, van_gogh]) :- !.
sym([know_matisse],[know, matisse]) :- !.
sym([know_monet],[know, monet]) :- !.
sym([know_malevich],[know, malevich]) :- !.
sym([know_rothko],[know, rothko]) :- !.
sym([know_pollock],[know, pollock]) :- !.
sym([know_kandinsky],[know, kandinsky]) :- !.
sym([know_kooning],[know, kooning]) :- !.
sym([know_mondrian],[know, mondrian]) :- !.
sym([know_warhol],[know, warhol]) :- !.
% Id
sym(X,X) :- osemval(X), isemval(X), !.
