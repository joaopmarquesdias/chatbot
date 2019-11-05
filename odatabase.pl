/* output database */

% TODO: defenir mais relações...

% output semantic values
osemval([good]).
osemval([thank]).
osemval([greet]).
osemval([dknow]).
osemval([nopinion]).
osemval([answer_greet]).
osemval([know_picasso]).

% output sentance list
osl([good], [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
osl([thank],[["thank", "you"],["thanks"]]).
osl([sgreet],[["hello"], ["hi"], ["hey"]]).
osl([dknow],[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
osl([nopinion],[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).
osl([know_picasso],[["Picasso", "full", "name", "was",
                "Pablo", "Diego", "José", "Francisco", "de", "Paula", "Juan",
                "Nepomuceno", "María", "de", "los", "Remedios", "Cipriano",
                "de", "la", "Santísima", "Trinidad", "Ruiz", "y", "Picasso"],
               ["Picasso","was","born","in", "1881", "and", "died", "in", "1973"],
               ["He", "is", "know", "has", "the", "co-founder", "of", "cubism"]]).

  /*osl([picasso],[]).
  osl([picasso],[]).
  osl([picasso],[]).
  osl([picasso],[]).*/

% outupt Top-Down Lists
otdl([lgreet],[
  ["it is good", "it is nice", "i am pleased"],
  ["to"],
  ["meet", "see"],
  ["you"]]).

% output sentence combination
osc([answer_greet],[["i", "am"],X,Y,["for", "asking"]]) :-
  osemsin(X, [good]), osemsin(Y,[thank]).

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

% input semsin relations
osemsin(P, [greet]) :- osl([sgreet], SL), oslgen(SL, P).
osemsin(P, [greet]) :- otdl([lgreet], TDL), otdgen(TDL, P).
osemsin(P, [greet]) :-
  osl([sgreet], SL), oslgen(SL, P1),
  otdl([lgreet], TDL), otdgen(TDL, P2),
  append(P1,P2,P).

osemsin(P, S)       :- osl(S, SL), oslgen(SL, P).
osemsin(P, S)       :- osc(S, SL), oscgen(SL, P).
osemsin([X], [repeate(X)]).
