% teste branch merge
% Sugestion: remove q's semantics for the combination (question, X)
%            remove a's semantics for the combination (answer, X)
%            seperate semantics by input, output or both
% Sugestion: seperate semantics by input, output or both

%            normalize must replace (question, X) by (answer, X)

% SM is a list of all semantic values in S
semantics([],[]).
% specific unification
semantics(["i", "am", X|WS], [greet, repeat(X)|SM]) :- semantics(WS, SM), !.
% generic semantic unification
semantics([W|WS], [S|SM]) :- semsin(S, [W]), not(S = repeat(_)), semantics(WS, SM), !.
semantics([W|WS], SM)     :- not(semsin(_, W)), semantics(WS, SM), !.
semantics([W|WS], SM)     :- semsin(S, W), S = repeat(_), semantics(WS, SM), !.

% NSM is the normalized list of SM
normalize(SM,SMS) :- rep(SM, SMS), syn(SM, SMS).

rep([],[]).
rep([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), rep(Y,NSM),!.
rep([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), rep(SMN, NSM).

syn([],[]).
syn([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), syn(Y,NSM),!.
syn([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), syn(SMN, NSM).


% Analise the score of answers
analyze(AS, AAS) :- AS = AAS.

% Auxiliary predicates

delMembers(_, [], []) :- !.
delMembers([X|XS], [Y|YS], Z)

delMember(_, [], []) :- !.
delMember(X, [X|Xs], Y) :- !, delMember(X, Xs, Y).
delMember(X, [T|Xs], Y) :- !, delMember(X, Xs, Y2), append([T], Y2, Y).

% list(L) is true when L is a list
list([]).
list([_|T]) :- list(T).

% sublist(SL, L) is true when SL is a sublist of L
sublist([],L)          :- list(L).
sublist([X|TX],[X|TY]) :- sublist(TX,TY).
sublist(X,[_|TY])      :- X = [_|_], sublist(X,TY).
