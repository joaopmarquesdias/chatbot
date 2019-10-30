:- ['database.pl'].
:- ['semantic.pl'].
:- ['relations.pl'].

/* PREDICATES */

% Predicate 1 : answers(S, AS)
%   AS is the list of all answers to the sentence S
% TODO: make sure all predicates work if S is a list of terms insted of strings
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

chat(E) :-
  write("\n"),
  read_sentence(S, E),
  write("debug ->> "),
  print_sentence(S),
  write("\n"),
  semantics(S, SM), not(member(goodbye, SM)), % change to check if they really want end
  bestanswer(S, A),
  write("Bot: "),
  print_answer(A),
  chat(E).

% Predicate 6 : stats(C)
%   C is a conversation.
%   displays stats such as:
%     length  of  the  conversation;
%     average number of words in each intervention;
%     frequency of words used, etc.

/* AUXILIARY IO PREDICATES */
read_sentence(S, E) :-
  read_string(user_input, "\n", "\r", E, S1),
  split_string(S1, " ", "", S).

print_sentence([]).
print_sentence([W|S]) :- write(W), write(" "), print_sentence(S).

print_sentences([]).
print_sentences([S|SS]) :- print_sentence(S), write("\n"), print_sentences(SS).

print_answer(ans(S,_)) :- print_sentence(S).

print_answers([]).
print_answers([A|AS]) :- print_answer(A), print_answers(AS).
