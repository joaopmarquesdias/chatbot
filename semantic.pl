% Sugestion: seperate semantics by input, output or both
%            normalize must replace (question, X) by (answer, X)

% SM is a list of all semantic values in S
semantics([],[]).
% specific unification
semantics(["i", "am", X|WS], [greet, repeat(X)|SM]) :- semantics(WS, SM), !.
% generic semantic unification
semantics([W|WS], [S|SM]) :- semsin(S, [W]), semantics(WS, SM), !.
semantics([W|WS], SM)     :- not(semsin(_, W)), semantics(WS, SM), !.

% NSM is the list normalized list of SM
normalize(SM, NSM) :- SM = NSM.

% Auxiliary predicates
% list(L) is true when L is a list
list([]).
list([_|T]) :- list(T).

% sublist(SL, L) is true when SL is a sublist of L
sublist([],L)          :- list(L).
sublist([X|TX],[X|TY]) :- sublist(TX,TY).
sublist(X,[_|TY])      :- X = [_|_], sublist(X,TY).
