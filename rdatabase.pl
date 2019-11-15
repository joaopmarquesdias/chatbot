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
sym([know_styles],[styles]) :- !.
sym([know_musicians],[musicians]) :- !.
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

%Musicians
sym([know_pink_floyd],[know, pink_floyd]) :- !.
sym([know_the_beatles],[know, the_beatles]) :- !.
sym([know_nirvana],[know, nirvana]) :- !.
sym([know_queen],[know, queen]) :- !.
sym([know_led_zepplin],[know, led_zepplin]) :- !.
sym([know_ramones],[know, ramones]) :- !.
sym([know_michael_jackson],[know, michael_jackson]) :- !.
sym([know_ray_charles],[know, ray_charles]) :- !.
sym([know_bob_dylan],[know, bob_dylan]) :- !.
sym([know_metallica],[know, metallica]) :- !.
sym([know_megadeth],[know, megadeth]) :- !.
sym([know_black_sabbath],[know, black_sabbath]) :- !.
% Id
sym(X,X) :- osemval(X), isemval(X), !.
