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
isemval(styles).
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
class(class,[icebreaker,painters,musicians]).
class(icebreaker,[themes,movements,styles,painters,musicians]).
class(painters,[picasso,van_gogh,matisse,monet,malevich,
rothko,pollock,kandinsky,kooning,mondrian,warhol]).
class(musicians,[led_zepplin,pink_floyd,the_beatles,
nirvana,queen,ramones,michael_jackson,ray_charles,
bob_dylan,metallica,megadeth,black_sabbath]).
class(know_icebreaker,[know_themes,know_movements,know_styles,know_painters,know_musicians]).
class(know_painters,[know_picasso,know_van_gogh,know_matisse,know_monet,know_malevich,
know_rothko,know_pollock,know_kandinsky,know_kooning,know_mondrian,know_warhol]).
class(know_musicians,[know_led_zepplin,know_pink_floyd,know_the_beatles,
know_nirvana,know_queen,know_ramones,know_michael_jackson,know_ray_charles,
know_bob_dylan,know_metallica,know_megadeth,know_black_sabbath]).

%input sentence list
isem(icebreaker,Phrase) --> ["What", Phrase, "do", "you", "know", "about?"].
isem(painters,Painter) --> ["What", "do", "you", "know", "about", Painter, "?"].
isem(musicians,Musician) --> ["What", "do", "you", "know", "about", Musician, "?"].
isem(X,P2,[]) :-
  class(painters,L), member(X,L),
  isemtrigger(X,Y,[]), isem(painters,Y,P,[]), decons(P,P2), !.
isem(X,P2,[]) :-
  class(musicians,L), member(X,L),
  isemtrigger(X,Y,[]), isem(musicians,Y,P,[]), decons(P,P2), !.
isem(X,P2,[]) :-
  class(icebreaker,L), member(X,L),
  isemtrigger(X,Y,[]), isem(icebreaker,Y,P,[]), decons(P,P2), !.
isem(greet,P,[]) :- osem(greetl,P,[]), !.
isem(goodbye,P,[]) :- osem(sudden_bye,P,[]), !.
isem(X,P,[]) :- isemtrigger(X,P,[]).

decons([],[]).
decons([X|XS],[X|YS]) :- not(list(X)), !, decons(XS,YS).
decons([X|XS],ZS) :- list(X), !, decons(XS,YS), append(X,YS,ZS).

% input trigger list
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
isemtrigger(kooning) --> ["Kooning"]; ["kooning"].
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
