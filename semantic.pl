% teste branch merge
% Sugestion: remove q's semantics for the combination (question, X)
%            remove a's semantics for the combination (answer, X)
%            seperate semantics by input, output or both
%            normalize must replace (question, X) by (answer, X)

% SM is a list of all semantic values in S
semantics(S, SM)       :- findall(M, semantic(S, M), SM).

semantic(S, greet)     :- sublist([hello], S).
semantic(S, goodbye)   :- sublist([goodbye], S).
semantic(S, qgreet)    :- sublist([how, are, you], S).
semantic(S, approve)   :- sublist([approve], S).
semantic(S, reprove)   :- sublist([reprove], S).
semantic(S, thank)     :- sublist([thank], S).
semantic(S, know)      :- sublist([what, do, you, know, about], S).
semantic(S, opinion)   :- sublist([what, do, you, think, about], S).
semantic(S, agree)     :- sublist([do, you, agree], S).
semantic(S, good)      :- sublist([good], S).
semantic(S, bad)       :- sublist([bad], S).
semantic(S, right)     :- sublist([right], S).
semantic(S, wrong)     :- sublist([wrong], S).
semantic(S, repeat(X)) :- sublist([repeat, X], S).

% NSM is the normalized list of SM
normalize(SM,SMS) :- rep(SM, SMS), syn(SM, SMS).

rep([],[]).
rep([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), rep(Y,NSM),!.
rep([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), rep(SMN, NSM).

syn([],[]).
syn([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), syn(Y,NSM),!.
syn([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), syn(SMN, NSM).


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
