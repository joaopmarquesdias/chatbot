/* input database */

% The structure repeate(X) as the same semantic value as X

% input semantic values
% "Small talk"
isemval(iam(_)).
isemval(you).
isemval(greet).
isemval(goodbye).
isemval(yes).
isemval(no).
isemval(question).
isemval(know).
isemval(are).
% Sepecific topics
isemval(themes).
isemval(movements).
isemval(painters).
isemval(style).
isemval(musicians).
isemval(meaning_life).
% Artists
isemval(picasso).
isemval(van_gogh).
isemval(matisse).
isemval(monet).
isemval(malevich).
isemval(rothko).
isemval(pollock).
isemval(kandinsky).
isemval(kooning).
isemval(mondrian).
isemval(warhol).
%Musicians
isemval(pink_floyd).
isemval(the_beatles).
isemval(nirvana).
isemval(queen).
isemval(led_zepplin).
isemval(ramones).
isemval(michael_jackson).
isemval(ray_charles).
isemval(bob_dylan).
isemval(metallica).
isemval(megadeth).
isemval(black_sabbath).


% input sentence list
% "Small talk"
isem(iam(X)) --> ["i","am",X]; ["my","name","is",X].
isem(you) --> ["you"].
isem(greet) --> ["hello"]; ["hi"]; ["hey"].
isem(goodbye) --> ["Goodbye"]; ["Bye"]; ["goodbye"]; ["bye"].
isem(yes) --> ["yes"]; ["Yes"]; ["y"]; ["Y"].
isem(no) --> ["no"]; ["No"]; ["n"]; ["N"].
isem(question) -->
  ["how"]; ["where"]; ["what"]; ["why"]; ["when"]; ["can"]; ["do", "you"].
isem(know) --> ["Know"]; ["know"]; ["realize"]; ["notice"]; ["recognize"].
isem(are) --> ["are"].
isem(meaning_life) --> ["life"]; ["Life"].
% Sepecific topics
isem(themes) --> ["themes"].
isem(painters) --> ["painters"].
isem(movements) --> ["movements"].
isem(musicians) --> ["musicians"].
isem(styles) --> ["styles"].
% Artists
isem(picasso) --> ["Picasso"]; ["picasso"].
isem(van_gogh) --> ["Van", "Gogh"]; ["van", "gogh"].
isem(matisse) --> ["Matisse"]; ["matisse"].
isem(monet) --> ["Monet"]; ["monet"].
isem(malevich) --> ["Malevich"]; ["malevich"].
isem(rothko) --> ["Rothko"]; ["rothko"].
isem(pollock) --> ["Pollock"]; ["pollock"].
isem(kandinsky) --> ["Kandinsky"]; ["kandinsky"].
isem(mondrian) --> ["Mondrian"]; ["mondrian"].
isem(warhol) --> ["Warhol"]; ["warhol"].
%Musicians
isem(pink_floyd) --> ["Pink", "Floyd"]; ["pink","floyd"].
isem(the_beatles)--> ["Beatles"]; ["beatles"].
isem(nirvana) --> ["Nirvana"]; ["nirvana"].
isem(queen) --> ["Queen"]; ["queen"].
isem(led_zepplin) --> ["Led", "Zepplin"]; ["led","zepplin"].
isem(ramones) --> ["Ramones"]; ["ramones"].
isem(michael_jackson) --> ["Michael","Jackson"]; ["michael","jackson"].
isem(ray_charles) --> ["Ray", "Charles"]; ["ray","charles"].
isem(bob_dylan) --> ["Bob","Dylan"]; ["bob", "dylan"].
isem(metallica) --> ["Metallica"]; ["metallica"].
isem(megadeth) --> ["Megadeth"]; ["megadeth"].
isem(black_sabbath) --> ["Black","Sabbath"]; ["black", "sabbath"].

% input sentence list generator
islgen(SL, S) :- member(S, SL).

% input semsin relations
isemsin(S, P) :- isl(S, SL), islgen(SL, P), !.
