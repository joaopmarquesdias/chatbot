:- ['database.pl'].
:- ['logic.pl'].
:- ['idatabase.pl'].
:- ['odatabase.pl'].
:- ['rdatabase.pl'].
:- ['utils.pl'].

/* PREDICATES */

% Predicate 1 : answers(S, AS)
%   AS is the list of all answers to the sentence S
%   True when words W are strings
answers([W|S], AAS) :- string(W), !,
  answers_internal([W|S], AAS).
%   True when words W are atoms
answers([W|S], AAS) :- not(string(W)), !,
  atoml_sentence([W|S], IS), answers_internal(IS, AAS).

% S as the internal representation of sentence
answers_internal(S, AAS) :-
  semantics(S, SM),
  normalize(SM, NSM),
  productions(NSM, AS),
  analyze(AS, AAS).

% Predicate 2 : bestanswer(S, A)
%   A is the answer to S with highest score
% Not implemented
bestanswer(S, A) :- answers(S, [A|_]).

% Predicate 3 : runifanswer(S, A)
%   A is a random answer to S

% Predicate 4 : rpropanswe(S, A)
%   A is a random answer to S taking in to account scores

% Predicate 5 : chat(X)
%   produces an interactive conversation
%   it ends when the user types “bye” or something similar
%   before closing, the bot should check if that ending is really wanted

% VERY IMPORTANT BUG!!!
% QUANDO SE INSERE UMA FRASE DESCONHECIA EX:. "ABC" O "bye" deixa de funcionar!!!!!
chat(_) :-
  write("\n"),
  read_sentence(S, _),
  semantics(S, SM), not(member(goodbye, SM)), % change to check if they really want to end
  bestanswer(S, A),
  write("Bot: "),
  print_answer(A),
  chat(_).

% Predicate 6 : stats(C)
%   C is a conversation.
%   displays stats such as:
%     length  of  the  conversation;
%     average number of words in each intervention;
%     frequency of words used, etc.
