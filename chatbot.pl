:- ['logic.pl'].
:- ['idatabase.pl'].
:- ['odatabase.pl'].
:- ['rdatabase.pl'].
:- ['utils.pl'].
:- ['outputDGC.pl'].

/* PREDICATES */

% Predicate 1 : answers(S, AS)
%   AS is the list of all answers to the sentence S
%   True when words W are strings
answers([W|S], AAS) :- string(W), !,
  answers_internal([W|S], AAS).
%   True when words W are atoms
answers([W|S], AAS) :- not(string(W)), !,
  atoml_sentence([W|S], IS), answers_internal(IS, AAS).

% same as answers but S as the internal representation of sentence
answers_internal(S, AAS) :-
  semantics(S, SM),
  normalize(SM, NSM),
  productions(NSM, AS),
  analyze(AS, AAS).

% Predicate 2 : bestanswer(S, A)
% A is the answer to S with highest score
bestanswer(S, A) :-
  answers(S, AS),
  max_score(AS, A).

% Predicate 3 : runifanswer(S, A)
%   A is a random answer to S
runifanswer(S, A) :-
  answers(S, AS),
  random_member(A, AS).

% Predicate 4 : rpropanswer(S, A)
%   A is a random answer to S taking in to account scores
rpropanswer(S, A) :-
  answers(S, AS),
  sum(AS,N),
  random(0,N,X),
  answer_score(X,0,AS,A).

% Predicate 5 : chat(X)
%   produces an interactive conversation
%   it ends when the user types “bye” or something similar
%   before closing, the bot should check if that ending is really wanted

% h(QS,AS) is the chat history
% QS is the list of questions and AS is the list of answers
chat(h([S|QS],[A|AS])) :- read_sentence(S), interact(h([S|QS],[A|AS])).

interact(h([S|QS],[A|AS])) :-
  continue(S,A), !, chat(h(QS,AS)).
interact(h([S1,S2|QS],[A1,A2|AS])) :-
  ask_quit(S1,A1), !, read_sentence(S2),
  (is_quit(S2,A2), !, QS = [], AS = [];
   not_quit(S2,A2), chat(h(QS,AS))).

continue(S,A) :-
  semantics(S,SM), not(member(goodbye,SM)), runifanswer(S, A),
  write("Bot: "), print_answer(A), nl.

ask_quit(S,A) :-
  semantics(S,SM), member(goodbye,SM),
  osemsin(P,[ask_end]), analyze([P],[A]),
  write("Bot: "), print_answer(A), nl.

is_quit(S,A) :-
  semantics(S,SM), member(yes,SM),
  osemsin(P,[is_end]), analyze([P],[A]),
  write("Bot: "), print_answer(A), nl.

not_quit(S,A) :-
  semantics(S,SM), not(member(yes,SM)),
  osemsin(P,[else_end]), analyze([P],[A]),
  write("Bot: "), print_answer(A), nl.

% Predicate 6 : stats(H)
%   H is a conversation.
%   displays stats such as:
%     number of interventions
%     total number of words in the conversation
%     average number of words in each intervention
%     10 most frequently used words

stats(H) :-
  nl, writeln("Stats:"), nl, normalizeH(H,C), append(C,L), !, numberinterventions(C),
  lengthconversation(L), averagewords(C), mostfreqwords(L), nl, nl.

  %   Assignment 2 predicates

  % Predicate 1: sentence_type(S,SM)
  %   SM is the semantic of sentence S

sentence_type(S,SM) :-
  semantics(S,ISM), symmetries(ISM,OSM), listofpred(X), pred(OSM,X,SM).

pred(OSM,[X|_],X) :- member(X,OSM), !.
pred(OSM,[_|Xs],SM) :- pred(OSM,Xs,SM), !.
pred(_,_,dont_know) :- !.



listofpred([know_picasso,know_van,know_matisse,know_monet,know_malevich,
know_rothko,know_pollock,know_kandinsky,know_kooning,know_mondrian,
know_warhol,know_pink_floyd,know_the_beatles,know_nirvana,know_queen,
know_led_zepplin,know_ramones,know_michael_jackson,know_ray_charles,
know_bob_dylan,know_metallica,know_megadeth,know_black_sabbath,know_themes,
know_painters,know_movements,know_musicians,know_styles,good,thank,greet,
answer_greet,ask_end,else_end,is_end,meaning_life,dont_know]).
