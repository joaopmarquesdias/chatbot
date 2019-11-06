/* output database */

% TODO: defenir mais relações...

painters([
  "Pablo Picasso, Vincent Van Gogh, Henri Matisse, Claude Monet,
   Kazimir Malevich, Mark Rothko, Jackson Pollock, Wassily Kandinsky,
   Willem de Kooning, Piet Mondrian, Andy Warhol"]).

%musicians(_).

%writters(_).

% Semantic values

% "Small talk"
osemval([good]).
osemval([thank]).
osemval([greet]).
osemval([dknow]).
osemval([nopinion]).
osemval([answer_greet]).
% Specific topics
osemval([know_themes]).
osemval([know_painters]).
% Artists
osemval([know_picasso]).
osemval([know_van_gogh]).
osemval([know_matisse]).
osemval([know_monet]).
osemval([know_malevich]).
osemval([know_rothko]).
osemval([know_pollock]).
osemval([know_kandinsky]).
osemval([know_kooning]).
osemval([know_mondrian]).
osemval([know_warhol]).

% Sintax generators

% output sentence list
% "Small talk"
osl([good], [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
osl([thank],[["thank", "you"],["thanks"]]).
osl([sgreet],[["hello"], ["hi"], ["hey"]]).
osl([dknow],[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
osl([nopinion],[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).
% Sepecific topics
osl([know_themes],[
  ["I", "can", "help", "you", "with", "painters", "musicians", "and", "writers"]]).
% Artists
% Post-impressionism +
osl([know_van_gogh],[
  ["Vincent", "Willem", "van", "Gogh", "was", "born", "on", "30", "March", "1853",
  "in", "the", "Netherlands", "and", "died", "on", "29", "July", "1890",
  "in", "France", "at", "aged", "37"]]).
osl([know_matisse],[
  ["Henri", "Émile Benoît", "Matisse", "was", "born", "on", "31", "December", "1869",
  "in", "France", "and", "died", "on", "3", "November", "1954", "at", "aged", "84"]]).
% Cubism +
osl([know_picasso],[
  ["Picasso", "full", "name", "was",
  "Pablo", "Diego", "José", "Francisco", "de", "Paula", "Juan",
  "Nepomuceno", "María", "de", "los", "Remedios", "Cipriano",
  "de", "la", "Santísima", "Trinidad", "Ruiz", "y", "Picasso"],
 ["Picasso","was","born","in", "1881", "and", "died", "in", "1973"],
 ["He", "is", "know", "has", "the", "co-founder", "of", "cubism"]]).
osl([know_monet],[["empty"]]).
osl([know_malevich],[["empty"]]).
osl([know_rothko],[["empty"]]).
osl([know_pollock],[["empty"]]).
osl([know_kandinsky],[["empty"]]).
osl([know_kooning],[["empty"]]).
osl([know_mondrian],[["empty"]]).
osl([know_warhol],[["empty"]]).

% outupt Top-Down Lists
% "Small talk"
otdl([lgreet],[
  ["it is good", "it is nice", "i am pleased"],
  ["to"],
  ["meet", "see"],
  ["you"]]).

% output sentence combination
% "Small talk"
osc([answer_greet],[["i", "am"],X,Y,["for", "asking"]]) :-
  osemsin(X, [good]), osemsin(Y,[thank]).
% Sepecific topics
osc([know_painters],[
  ["i", "know", "things", "about"], X,
  ["wich","one","do","you","what","to","know","about?"]])
  :- painters(X).

% outupt Top-Down generator
% True when S is a possible combination of words in TDL
otdgen([],[]).
otdgen([X|BS], S) :-
  member(W, X), split_string(W, " ", "", W1),
  otdgen(BS, S1),
  append(W1, S1, S).
% output sentence list generator
oslgen(SL, S) :- member(S, SL).
% output sentence combination generator
oscgen([],[]).
oscgen([X|SC], S) :- oscgen(SC, S1), append(X, S1, S).

% output semantic-sintax relations
% combined relations
osemsin(P, [greet]) :- osl([sgreet], SL), oslgen(SL, P).
osemsin(P, [greet]) :- otdl([lgreet], TDL), otdgen(TDL, P).
osemsin(P, [greet]) :-
  osl([sgreet], SL), oslgen(SL, P1),
  otdl([lgreet], TDL), otdgen(TDL, P2),
  append(P1,P2,P).
% defined relations
osemsin(P, S)       :- osl(S, SL), oslgen(SL, P).
osemsin(P, S)       :- osc(S, SL), oscgen(SL, P).
osemsin([X], [repeate(X)]).
