% output sentence combination
% "Small talk"
sem(answer_greet) --> ["I", "am"], sem(good), sem(thank), ["for", "asking"].
% Sepecific topics
osc([know_painters],[
  ["I", "know", "things", "about"], ES,
  ["wich","one","do","you","what","to","know","about?"]])
  :- findall(P, painters(P), PS), enumerate(PS, ES).
osc([know_movements],[
  ["The", "painters", "I", "know", "followed", "this", "art", "movements:"],
  AMS])
  :- movements(MS), enumerate(MS, AMS).
%em falta
osc([know_musicians],[["I", "know", "things", "about"], ES,
  ["wich","one","do","you","what","to","know","about?"]])
  :- findall(P, musicians(P), PS), enumerate(PS, ES).
osc([know_styles],[
  ["The", "musicians", "I", "know", "followed", "this", "styles:"], AMS])
  :- styles(MS), enumerate(MS, AMS).

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
