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
