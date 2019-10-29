:- ['database.pl'].
:- ['semantic.pl'].
:- ['relations.pl'].

/* INFO */

% A sentence is a list of atoms (words) [atom1, atom2, atom3, ...]
%   ex:. [good, morning, sir]

% An answer is a functor ans(sentence, score),
% score is a number between 0 and 1

/* PREDICATES */

print_sentence([]).
print_sentence([W|S]) :- write(W), write(" "), print_sentence(S).

print_sentences([]).
print_sentences([S|SS]) :- print_sentence(S), write("\n"), print_sentences(SS).

% Predicate 1 : answers(S, AS)
%   AS is the list of all answers to the sentence S

% redefine produce and productions
produce([],[]).
produce([S|NSM], P) :- semsin(S, P1), produce(NSM, P2), append(P1,P2,P).

% All productions of a NSM
productions(NSM, PS) :- findall(P, produce(NSM, P), PS).

answers(S, AAS) :-
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

% Predicate 6 : stats(C)
%   C is a conversation.
%   displays stats such as:
%     length  of  the  conversation;
%     average number of words in each intervention;
%     frequency of words used, etc.
