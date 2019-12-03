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
sem(iam(X)) --> ["i","am",X]; ["my","name","is",X].
sem(you) --> ["you"].
sem(greet) --> ["hello"]; ["hi"]; ["hey"].
sem(goodbye) --> ["Goodbye"]; ["Bye"]; ["goodbye"]; ["bye"].
sem(yes) --> ["yes"]; ["Yes"]; ["y"]; ["Y"].
sem(no) --> ["no"]; ["No"]; ["n"]; ["N"].
sem(question) -->
  ["how"]; ["where"]; ["what"]; ["why"]; ["when"]; ["can"]; ["do", "you"].
sem(know) --> ["Know"]; ["know"]; ["realize"]; ["notice"]; ["recognize"].
sem(are) --> ["are"].
sem(meaning_life) --> ["life"]; ["Life"].
% Sepecific topics
sem(themes) --> ["themes"].
sem(painters) --> ["painters"].
sem(movements) --> ["movements"].
sem(musicians) --> ["musicians"].
sem(styles) --> ["styles"].
% Artists
sem(picasso) --> ["Picasso"]; ["picasso"].
sem(van_gogh) --> ["Van", "Gogh"]; ["van", "gogh"].
sem(matisse) --> ["Matisse"]; ["matisse"].
sem(monet) --> ["Monet"]; ["monet"].
sem(malevich) --> ["Malevich"]; ["malevich"].
sem(rothko) --> ["Rothko"]; ["rothko"].
sem(pollock) --> ["Pollock"]; ["pollock"].
sem(kandinsky) --> ["Kandinsky"]; ["kandinsky"].
sem(mondrian) --> ["Mondrian"]; ["mondrian"].
sem(warhol) --> ["Warhol"]; ["warhol"].
%Musicians

sem(pink_floyd) --> ["Pink", "Floyd"]; ["pink","floyd"].
sem(the_beatles)--> ["Beatles"]; ["beatles"].
sem(nirvana) --> ["Nirvana"]; ["nirvana"].
sem(queen) --> ["Queen"]; ["queen"].
sem(led_zepplin) --> ["Led", "Zepplin"]; ["led","zepplin"].
sem(ramones) --> ["Ramones"]; ["ramones"].
sem(michael_jackson) --> ["Michael","Jackson"]; ["michael","jackson"].
sem(ray_charles) --> ["Ray", "Charles"]; ["ray","charles"].
sem(bob_dylan) --> ["Bob","Dylan"]; ["bob", "dylan"].
sem(metallica) --> ["Metallica"]; ["metallica"].
sem(megadeth) --> ["Megadeth"]; ["megadeth"].
sem(black_sabbath) --> ["Black","Sabbath"]; ["black", "sabbath"].

% input sentence list generator
islgen(SL, S) :- member(S, SL).

% input semsin relations
isemsin(S, P) :- isl(S, SL), islgen(SL, P), !.
