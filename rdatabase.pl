/* relations database */

% semantic symmetries
% sym(Y,X)    X -> Y
% "Small talk"
sym([greet, repeate(X)],[iam(X)]) :- !.
sym([answer_greet],[question, are, you]) :- !.
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
sym([know_picasso],[picasso]) :- !.
sym([know_van_gogh],[van_gogh]) :- !.
sym([know_matisse],[matisse]) :- !.
sym([know_monet],[monet]) :- !.
sym([know_malevich],[malevich]) :- !.
sym([know_rothko],[rothko]) :- !.
sym([know_pollock],[pollock]) :- !.
sym([know_kandinsky],[kandinsky]) :- !.
sym([know_kooning],[kooning]) :- !.
sym([know_mondrian],[mondrian]) :- !.
sym([know_warhol],[warhol]) :- !.
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
sym([know_pink_floyd],[pink_floyd]) :- !.
sym([know_the_beatles],[the_beatles]) :- !.
sym([know_nirvana],[nirvana]) :- !.
sym([know_queen],[queen]) :- !.
sym([know_led_zepplin],[led_zepplin]) :- !.
sym([know_ramones],[ramones]) :- !.
sym([know_michael_jackson],[michael_jackson]) :- !.
sym([know_ray_charles],[ray_charles]) :- !.
sym([know_bob_dylan],[bob_dylan]) :- !.
sym([know_metallica],[metallica]) :- !.
sym([know_megadeth],[megadeth]) :- !.
sym([know_black_sabbath],[black_sabbath]) :- !.
% Id
sym([X],[X]) :- osemval(X), isemval(X), !.

% Assignment 2
listofpred([know_picasso,know_van,know_matisse,know_monet,know_malevich,
  know_rothko,know_pollock,know_kandinsky,know_kooning,know_mondrian,
  know_warhol,know_pink_floyd,know_the_beatles,know_nirvana,know_queen,
  know_led_zepplin,know_ramones,know_michael_jackson,know_ray_charles,
  know_bob_dylan,know_metallica,know_megadeth,know_black_sabbath,know_themes,
  know_painters,know_movements,know_musicians,know_styles,good,thank,greet,
  answer_greet,ask_end,else_end,is_end,meaning_life,dont_know]).
