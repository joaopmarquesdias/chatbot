/* relations database */

%TODO: relations by member(X,S)!

% semantic symmetries
% sym(Y,X)    X -> Y
sym([answer_greet],[question,you]) :- !.
sym([greet,repeate(X)],[iam,repeate(X)]) :- !.
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

sym([know_themes],[themes, know]) :- !.
sym([know_themes],[themes]) :- !.
sym([know_painters],[painters]) :- !.
% Id
sym(X,X) :- osemval(X), isemval(X), !.
