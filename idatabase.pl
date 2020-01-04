
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

%classes
class(icebreaker) --> themes; movements; style; painters; musicians.
class(painters) --> picasso; van_gogh; matisse; monet;
  malevich; rothko; pollock; kandinsky; kooning; mondrian; warhol.
class(musicians) --> pink_floyd; the_beatles; nirvana; queen; led_zepplin; ramones;
  michael_jackson; ray_charles; bob_dylan; metallica; megadeth; black_sabbath.

% input sentence list
% "Small talk"
isemtrigger(iam(X)) --> ["i","am",X]; ["my","name","is",X].
isemtrigger(you) --> ["you"].
isemtrigger(greet) --> ["hello"]; ["hi"]; ["hey"].
isemtrigger(goodbye) --> ["Goodbye"]; ["Bye"]; ["goodbye"]; ["bye"].
isemtrigger(yes) --> ["yes"]; ["Yes"]; ["y"]; ["Y"].
isemtrigger(no) --> ["no"]; ["No"]; ["n"]; ["N"].
isemtrigger(question) -->
  ["how"]; ["where"]; ["what"]; ["why"]; ["when"]; ["can"]; ["do", "you"].
isemtrigger(know) --> ["Know"]; ["know"]; ["realize"]; ["notice"]; ["recognize"].
isemtrigger(are) --> ["are"].
isemtrigger(meaning_life) --> ["life"]; ["Life"].
isemtrigger(question_are_you) --> ["How", "are", "you?"].
% Sepecific topics
isemtrigger(themes) --> ["themes"].
isemtrigger(painters) --> ["painters"].
isemtrigger(movements) --> ["movements"].
isemtrigger(musicians) --> ["musicians"].
isemtrigger(styles) --> ["styles"].
% Artists
isemtrigger(picasso) --> ["Picasso"]; ["picasso"].
isemtrigger(van_gogh) --> ["Van", "Gogh"]; ["van", "gogh"].
isemtrigger(matisse) --> ["Matisse"]; ["matisse"].
isemtrigger(monet) --> ["Monet"]; ["monet"].
isemtrigger(malevich) --> ["Malevich"]; ["malevich"].
isemtrigger(rothko) --> ["Rothko"]; ["rothko"].
isemtrigger(pollock) --> ["Pollock"]; ["pollock"].
isemtrigger(kandinsky) --> ["Kandinsky"]; ["kandinsky"].
isemtrigger(mondrian) --> ["Mondrian"]; ["mondrian"].
isemtrigger(warhol) --> ["Warhol"]; ["warhol"].
%Musicians
isemtrigger(pink_floyd) --> ["Pink", "Floyd"]; ["pink","floyd"].
isemtrigger(the_beatles)--> ["Beatles"]; ["beatles"].
isemtrigger(nirvana) --> ["Nirvana"]; ["nirvana"].
isemtrigger(queen) --> ["Queen"]; ["queen"].
isemtrigger(led_zepplin) --> ["Led", "Zepplin"]; ["led","zepplin"].
isemtrigger(ramones) --> ["Ramones"]; ["ramones"].
isemtrigger(michael_jackson) --> ["Michael","Jackson"]; ["michael","jackson"].
isemtrigger(ray_charles) --> ["Ray", "Charles"]; ["ray","charles"].
isemtrigger(bob_dylan) --> ["Bob","Dylan"]; ["bob", "dylan"].
isemtrigger(metallica) --> ["Metallica"]; ["metallica"].
isemtrigger(megadeth) --> ["Megadeth"]; ["megadeth"].
isemtrigger(black_sabbath) --> ["Black","Sabbath"]; ["black", "sabbath"].
