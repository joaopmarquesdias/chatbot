/* output database */

% TODO: defenir mais relações...

% output semantic values
osemval([good]).
osemval([thnak]).
osemval([greet]).
osemval([dknow]).
osemval([nopinion]).
osemval([answer, greet]).

% output sentance list
osl([good], [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
osl([thank],[["thank", "you"],["thanks"]]).
osl([greet],[["hello"], ["hi"], ["hey"]]).
osl([dknow],[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
osl([nopinion],[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).

% output sentence combination
osc([answer,greet],[["i", "am"],X,Y,["for", "asking"]]) :-
  osemsin(X, [good]), osemsin(Y,[thank]).

% output sentence list generator
oslgen(SL, S) :- member(S, SL).

% output sentence combination generator
oscgen([],[]).
oscgen([X|SC], S) :- oscgen(SC, S1), append(X, S1, S).

% input semsin relations
osemsin(P, S) :- osl(S, SL), oslgen(SL, P).
osemsin(P, S) :- osc(S, SL), oscgen(SL, P).
osemsin([X], [repeate(X)]).
