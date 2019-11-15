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

% same as answers but S as the internal representation of sentence
answers_internal(S, AAS) :-
  semantics(S, SM),
  normalize(SM, NSM),
  productions(NSM, AS),
  analyze(AS, AAS).

% Predicate 2 : bestanswer(S, A)
% A is the answer to S with highest score
bestanswer(S, A) :- answers(S, AS), max_score(AS, A).

% Predicate 3 : runifanswer(S, A)
%   A is a random answer to S
runifanswer(S, A) :- answers(S, AS), random_member(A, AS).

% Predicate 4 : rpropanswer(S, A)
%   A is a random answer to S taking in to account scores
rpropanswer(S, A) :- answers(S, AS), expand_all(AS, EAS), random_member(A, EAS).

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

/*
list_difference([],_,[]).
list_difference([X|L1],L2,[X|D]) :-
  not(member(X,L2)), !,
  list_difference(L1,L2,D).
list_difference([_|L1],L2,D) :- !, list_difference(L1,L2,D).

remove_open_end([],[]).
remove_open_end([X|T],[X|L]) :- not(var(X)), !, remove_open_end(T,L).
remove_open_end(_,L) :- list(L).

more(h([S1,S2|_],[A|AS])) :-
  semantics(S1,SM), member(more,SM),
  answers(S2,AS1), remove_open_end(AS,AS2),
  list_difference(AS1,AS2,AS3), max_score(AS3, A),
  write("Bot: "), print_answer(A), nl.
*/

% Predicate 6 : stats(C)
%   C is a conversation.
%   displays stats such as:
%     length  of  the  conversation;
%     average number of words in each intervention;
%     frequency of words used, etc.

stats(H) :- nl, nl, normalizeH(H,C), append(C,L), !, numberinterventions(C), lengthconversation(L), averagewords(C), mostfreqwords(L), nl, nl.


numberinterventions(C) :- length(C,Len), write("There were "), write(Len), write(" interventions in this conversation"), nl.

atoml_sentence_list([X],[C]) :- atoml_sentence(X,C), !.
atoml_sentence_list([X|Xs],[C|Cs]) :- atoml_sentence(X,C), atoml_sentence_list(Xs,Cs).

normalizeH(H,C) :- removetuple(H,H1), removeans(H1,H2), atoml_sentence_list(H2,C).

removetuple(h(Q,A),[Q,A]).

removeans([[Q],[ans(X,_)]],[Q,X]) :- !.
removeans([[Q|Qs],[ans(X,_)|As]],[Q,X|Done]) :- removeans([Qs,As], Done).

lengthconversation(L) :-
  length(L, Len), write("Total number of words in the conversation is: "), write(Len), nl.

averagewords(C) :-
  countwords(C,Count), sum_list(Count, Sum), length(Count, Len),
  write("Average number os words in each intervention is: "),
  Number is Sum/Len, write(Number), nl.

countwords([],[]).
countwords([X|Xs],[C|Cs]) :-
  length(X,C), countwords(Xs,Cs),!.
countwords([X],[C]) :-
  length(X,C).

mostfreqwords(L) :-
  sort(L, L1), countlist(L1, L, O), sortfreq(O, S), printtop5(S).

sortfreq([],[]) :- !.
sortfreq([X],[X]) :- !.
sortfreq([X|Xs],[M|S]) :- max([X|Xs],M), delMember(M,[X|Xs],X1), sortfreq(X1,S).

max([(S,X)|Xs], M):- max(Xs, (S,X), M),!.
max([], M, M).
max([(S,X)|Xs], (_, PM), M):- X >  PM, max(Xs, (S, X), M),!.
max([(_,X)|Xs], (S1, PM), M):- X =< PM, max(Xs, (S1, PM), M),!.

countlist([X], L,[(X,Y)]) :-
  count(X,L,Y), !.
countlist([X|Xs], L, [(X,Y)|I]) :-
  count(X,L,Y), countlist(Xs,L,I),!.

count(_,[],0).
count(X,[X|Xs],Y):-
  count(X,Xs,Z), Y is 1+Z,!.
count(X,[_|Xs],Z):-
  count(X,Xs,Z).

printtop5(S) :- length(S,Len),
  (Len =< 5
  -> write("Top "), write(Len), write(" words in the conversation:"), nl, printtop(S,Len)
  ;  write("Top 5 words in the conversation:"), nl, printtop(S,5)
  ).

printtop([(W,N)|S],X) :-
  (X =:= 1
  -> write(W), write(" appears "),
     write(N), write(" time(s)."), nl
  ;  write(W), write(" appears "), write(N),
     write(" time(s)."), nl, Y is X-1, printtop(S,Y)
  ).
