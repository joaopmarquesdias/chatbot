% M is the mapping of Goal to L (maps nothing when Goal fails)
% Single direction Goal(L) -> M
map_sublist(_, [],[]).
map_sublist(Goal, L, M) :-
  headsublist(X, T, L), not(X = []),
  call(Goal, Y, X),
  map_sublist(Goal, T, MT),
  append(Y, MT, M), !.
map_sublist(Goal, [_|T], M) :- map_sublist(Goal, T, M).

% delMember(X, XS, Y), True when Y is the list XS without the element X
delMember(_, [], []) :- !.
delMember(X, [X|Xs], Y) :- !, delMember(X, Xs, Y).
delMember(X, [T|Xs], Y) :- !, delMember(X, Xs, Y2), append([T], Y2, Y).

% list(L), True when L is a list
list([]).
list([_|T]) :- list(T).

% sublist(SL, L), True when SL is a sublist of L
sublist([],L) :- list(L).
sublist([X|TX],[X|TY]) :- sublist(TX,TY).
sublist(X,[_|TY]) :- X = [_|_], sublist(X,TY).

% headsublist(SL, L), True when SL ++ TL is L,
% this means when SL is a head sublist of L
headsublist(HL, TL, L) :- append(HL, TL, L).

% True when S is the list of strings from atoms AS
atoml_sentence([],[]).
atoml_sentence([A|AS],[W|S]) :- atom_string(A, W), atoml_sentence(AS,S).

% enumerate(AS,WS). True when WS is the sintactical enumeration of AS
enumerate([],[]).
enumerate([A],[A]).
enumerate([A1, A2],[A1, "and", A2]) :- !.
enumerate([A|AS], [W|WS]) :- string_concat(A, ",", W), !, enumerate(AS, WS).

% True when M is the answer with max score
max_score([ans(S,X)|Xs], M):- max_score(Xs, ans(S,X), M).
max_score([], M, M).
max_score([ans(S,X)|Xs], ans(_, PM), M):- X >  PM, max_score(Xs, ans(S, X), M).
max_score([ans(_,X)|Xs], ans(S1, PM), M):- X =< PM, max_score(Xs, ans(S1, PM), M).

% % True when AS AS1 is the expanded list of answers based on score
% expand_all([],[]).
% expand_all([A|AS], AS1) :- expand(A,AS3), expand_all(AS, AS2), append(AS3,AS2,AS1).
% expand(ans(A,Score), AS) :- expand_aux(A, Score, AS).
%
% expand_aux(A, N,[A]) :- N < 0.1.
% expand_aux(A, N,[A|AS]) :- N >= 0.1, N2 is N - 0.1, expand_aux(A,N2,AS).

%reads the user input and transforms it into a list with the form ["word"|words]
read_sentence(S) :-
  read_string(user_input, "\n", "\r", _, S1),
  split_string(S1, " ", "", S).

%prints the history of the chat
%used for debugging only
print_history(H) :-
  nl, write("<history>"), nl, nl,
  print_history_aux(H).

%aux to print_history/1
print_history_aux(h([],[])).
print_history_aux(h([S|Q],[ans(ANS,_)|A])) :-
  write("Human: "), print_sentence(S), write("\n"),
  write("Bot: "), print_sentence(ANS), write("\n"),
  print_history_aux(h(Q,A)).

%prints a list in the form of ["word"|words].
print_sentence([]).
print_sentence([W|S]) :- write(W), write(" "), print_sentence(S).

%prints a list of list in the form of [["word"|words]|Sentences]
print_sentences([]).
print_sentences([S|SS]) :- print_sentence(S), write("\n"), print_sentences(SS).

%prints an answer in the form of ans(Answer,Score)
print_answer(ans(S,_)) :- print_sentence(S).

%prints multiple answers in the form of ans(Answer,Score)
print_answers([]).
print_answers([A|AS]) :- print_answer(A), write('\n'), print_answers(AS).

% Predicates used in stats/1

%normalizes de history of de chat from h(Qs,As) to [Q,A|QA]
normalizeH(H,C) :-
  removetuple(H,H1), removeans(H1,H2), atoml_sentence_list(H2,C).

%aux to normalizeH/2. transforms the history from h(Qs,As) to [Q,A|QA]
removetuple(h(Q,A),[Q,A]).

%aux to normalizeH/2. transforms the history from [Q,A|QA] to [Q,An|QAn]
%where A is in the form of ans(A,Score) and An in the form of A
removeans([[Q],[ans(X,_)]],[Q,X]) :- !.
removeans([[Q|Qs],[ans(X,_)|As]],[Q,X|Done]) :-
  removeans([Qs,As], Done).

%aux to normalizeH/2. transforms the list of interventions in wich the words are in the
%form of "word" to a list of interventions in wich the words are in the form of words
atoml_sentence_list([X],[C]) :-
  atoml_sentence(X,C), !.
atoml_sentence_list([X|Xs],[C|Cs]) :-
  atoml_sentence(X,C), atoml_sentence_list(Xs,Cs).

%Counts interventions in the normalized list of the history
numberinterventions(C) :-
  length(C,Len), write("There were "), write(Len),
  write(" interventions in this conversation"), nl.

%Counts the number of words in the conversation from the normalized history
lengthconversation(L) :-
  length(L, Len), write("Total number of words in the conversation is: "), write(Len), nl.

%calculates the average words per iteration
averagewords(C) :-
  countwords(C,Count), sum_list(Count, Sum), length(Count, Len),
  write("Average number os words in each intervention is: "),
  Number is Sum/Len, write(Number), nl.

%counts the words in each intervention
countwords([],[]).
countwords([X|Xs],[C|Cs]) :-
  length(X,C), countwords(Xs,Cs),!.
countwords([X],[C]) :-
  length(X,C).

%discovers the frequency of each word in the conversation and prints the top 10
mostfreqwords(L) :-
  sort(L, L1), countlist(L1, L, O), sortfreq(O, S), printtop10(S).

%counts the number of times that every word appears in the conversation
countlist([X],L,[(X,Y)]) :-
  count(X,L,Y), !.
countlist([X|Xs], L, [(X,Y)|I]) :-
  count(X,L,Y), countlist(Xs,L,I),!.

%aux to countlist/3. count the number of times a word appears in the conversation
count(_,[],0).
count(X,[X|Xs],Y):-
  count(X,Xs,Z), Y is 1+Z,!.
count(X,[_|Xs],Z):-
  count(X,Xs,Z).

%sorts the list of words using the frequency of each as parameter to the comparation
sortfreq([],[]) :- !.
sortfreq([X],[X]) :- !.
sortfreq([X|Xs],[M|S]) :-
  max([X|Xs],M), delMember(M,[X|Xs],X1), sortfreq(X1,S).

%aux to sortfreq/2. discovers the max of the remaing
%list using the frequency as parameter to the comparation
max([(S,X)|Xs], M):-
  max(Xs, (S,X), M),!.
max([], M, M).
max([(S,X)|Xs], (_, PM), M):-
  X >  PM, max(Xs, (S, X), M),!.
max([(_,X)|Xs], (S1, PM), M):-
  X =< PM, max(Xs, (S1, PM), M),!.

%prints the top10 most frequent words
printtop10(S) :-
  write("Top 10 most frequent words in the conversation:"), nl, printtop(S,10).

%aux to printtop10/1. prints one word of the top 10
printtop([(W,N)|_],1) :-
  write("-> \""), write(W), write("\""),
  write(" appears "), write(N), writeln(" time(s)."), !.

printtop([(W,N)|S],X) :-
  write("-> \""), write(W), write("\""),
  write(" appears "), write(N), writeln(" time(s)."), !,
  Y is X-1, printtop(S,Y).

% true when N is the sum of all scores of AS
sum([],0).
sum([ans(_,S)|T],N):-
  sum(T,NT), N is S + NT.

% true when A is the answer whose distribution is N, X is the accumulator
answer_score(N,X,[ans(_,S)|AS],A) :-
  Y is S + X, Y < N, !,
  answer_score(N, Y, AS, A).
answer_score(N,X,[ans(A,S)|_],ans(A,S)) :-
  Y is S + X, Y >= N.

% Assignment 2 predicates

bestFirst(Goal,[h([Goal|Path],_)|_],[Goal|Path]).
bestFirst(Goal,[h(Path,_)|Paths],Sol) :-
  expandh(Path,Goal,HExpPaths),
  insert(HExpPaths,Paths,Paths2),
  bestFirst(Goal,Paths2,Sol), !.

expandh([First|Path],Goal,ExpPaths) :-
  findall(h([Next,First|Path],H),
    (semtrans(First,Next,_),
    not(member(Next,[First|Path])),
    heuristics(Next,Goal,H)),
    ExpPaths).

heuristics(Next,Goal,H) :- hsemtrans(Next,Goal,H).

insert([],L,L).
insert([HPath|HPaths],HExpPaths,HExpPaths3) :-
  aux_insert(HPath,HExpPaths,HExpPaths2),
  insert(HPaths,HExpPaths2,HExpPaths3), !.

aux_insert(HPath,[],[HPath]).
aux_insert(h(Path,H),
  [h(Path2,H2)|HExpPaths],
  [h(Path,H),h(Path2,H2)|HExpPaths]) :-
    H>=H2, !.
aux_insert(h(Path,H),
  [h(Path2,H2)|HExpPaths],
  [h(Path2,H2)|HExpPaths2]) :-
    H<H2, aux_insert(h(Path,H),HExpPaths,HExpPaths2), !.
