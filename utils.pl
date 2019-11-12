% M is the mapping of Goal to L (maps nothing when Goal fails)
% Single direction Goal(L) -> M
map(_, [],[]).
map(Goal, L, M) :-
  headsublist(X, T, L), not(X = []),
  call(Goal, Y, X),
  map(Goal, T, MT),
  append(Y, MT, M), !.
map(Goal, [_|T], M) :- map(Goal, T, M).

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
enumerate([A1, A2],[A1, "and", A2]).
enumerate([A|AS], [W|WS]) :- string_concat(A, ",", W), enumerate(AS, WS).

% True when M is the answer with max score
max_score([ans(S,X)|Xs], M):- max_score(Xs, ans(S,X), M).
max_score([], M, M).
max_score([ans(S,X)|Xs], ans(_, PM), M):- X >  PM, max_score(Xs, ans(S, X), M).
max_score([ans(_,X)|Xs], ans(S1, PM), M):- X =< PM, max_score(Xs, ans(S1, PM), M).

% True when AS AS1 is the expanded list of answers based on score
expand_all([],[]).
expand_all([A|AS], AS1) :- expand(A,AS3), expand_all(AS, AS2), append(AS3,AS2,AS1).
expand(ans(A,Score), AS) :- expand_aux(A, Score, AS).

expand_aux(A, N,[A]) :- N < 0.1.
expand_aux(A, N,[A|AS]) :- N >= 0.1, N2 is N - 0.1, expand_aux(A,N2,AS).

read_sentence(S) :-
  read_string(user_input, "\n", "\r", _, S1),
  split_string(S1, " ", "", S).

print_history(H) :-
  nl, write("<history>"), nl, nl,
  print_history_aux(H).

print_history_aux(h([],[])).
print_history_aux(h([S|Q],[ans(ANS,_)|A])) :-
  write("Human: "), print_sentence(S), write("\n"),
  write("Bot: "), print_sentence(ANS), write("\n"),
  print_history_aux(h(Q,A)).

print_sentence([]).
print_sentence([W|S]) :- write(W), write(" "), print_sentence(S).

print_sentences([]).
print_sentences([S|SS]) :- print_sentence(S), write("\n"), print_sentences(SS).

print_answer(ans(S,_)) :- print_sentence(S).

print_answers([]).
print_answers([A|AS]) :- print_answer(A), write('\n'), print_answers(AS).
