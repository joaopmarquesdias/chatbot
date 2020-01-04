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
listofpred([themes,painters,movements,musicians,styles,
  picasso,van_gogh,matisse,monet,malevich,rothko,pollock,
  kandinsky,kooning,mondrian,warhol,led_zepplin,
  pink_floyd,the_beatles,nirvana,queen,ramones,
  michael_jackson,ray_charles,bob_dylan,metallica,
  megadeth,black_sabbath,question_are_you,good,
  thank,greet,meaning_life,goodbye,yes,no,dont_know]).

normsem([],[]).
normsem([question,are,you|ISMS],[question_are_you|NSMS]) :-
  !, normsem(ISMS,NSMS).
normsem([know|ISMS],NSMS) :-
  !, normsem(ISMS,NSMS).
normsem([ISM|ISMS],[ISM|NSMS]) :-
  !, normsem(ISMS,NSMS).

trans(greet,question_are_you).
trans(question_are_you,answer_greet).
trans(answer_greet,themes).
trans(themes,know_themes).
trans(know_themes,picasso).
trans(know_themes,nirvana).
trans(picasso,know_picasso).
trans(nirvana,know_nirvana).
trans(know_picasso,goodbye).
trans(know_nirvana,goodbye).
