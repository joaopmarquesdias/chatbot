/* output database */

% TODO: dependências good, thank
% TODO: defenir mais relações...

% output semantic values
osemval([greet]).
osemval([dknow]).
osemval([nopinion]).
osemval([answer, greet]).

% output sentance list
osl([greet],[["hello"], ["hi"], ["hey"]]).
osl([dknow],[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
osl([nopinion],[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).

% output sentence combination
osc([answer,greet],[["i", "am"],X,Y,["for", "asking"]]) :-
  osemsin(good, X), osemsin(thank, Y).

% output sentence list generator
oslgen(SL, S) :- member(S, SL).

% output sentence combination generator
oscgen([],[]).
oscgen([X|SC], S) :- oscgen(SC, S1), append(X, S1, S).

% input semsin relations
osemsin(S, P) :- osl(S, SL), oslgen(SL, P).
osemsin(S, P) :- osc(S, SL), oscgen(SL, P).
osemsin([repeate(X)], [X]).
