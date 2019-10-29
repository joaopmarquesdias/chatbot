% SM is a list of all semantic values in S
semantics(S, SM) :- findall(M, semantic(S, M), SM).

semantic(S, greet)   :- sublist([hello], S).
semantic(S, goodbye) :- sublist([goodbye], S).
semantic(S, good)    :- sublist([good], S).
semantic(S, agree)   :- sublist([agree], S).

normalize(SM, NSM) :- SM = NSM.

% Auxiliary predicates

% list(L) is true when L is a list
list([]).
list([_|T]) :- list(T).

% sublist(SL, L) is true when SL is a sublist of L
sublist([],L)          :- list(L).
sublist([X|TX],[X|TY]) :- sublist(TX,TY).
sublist(X,[_|TY])      :- X = [_|_], sublist(X,TY).
