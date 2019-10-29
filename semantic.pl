% Sugestion: remove q's semantics for the combination (question, X)
%            remove a's semantics for the combination (answer, X)
%            seperate semantics by input, output or both
% Sugestion: seperate semantics by input, output or both

%            normalize must replace (question, X) by (answer, X)

% SM is a list of all semantic values in S
semantics([],[]).
% specific unification
semantics(["good", "morning"|WS], [greet|SM]) :- semantics(WS, SM), !.
semantics(["good", "afternoon"|WS], [greet|SM]) :- semantics(WS, SM), !.
semantics(["good", "evening"|WS], [greet|SM]) :- semantics(WS, SM), !.
semantics(["i", "am", X|WS], [greet, repeat(X)|SM]) :- semantics(WS, SM), !.
% generic semantic unification
semantics([W|WS], [S|SM]) :- semsin(S, [W]), not(S = repeat(_)), semantics(WS, SM), !.
semantics([W|WS], SM)     :- not(semsin(_, W)), semantics(WS, SM), !.
semantics([W|WS], SM)     :- semsin(S, W), S = repeat(_), semantics(WS, SM), !.

% NSM is the normalized list of SM
normalize(SM,NSM) :- rmrep(SM, SMR), combine(SMR, NSM).

% combine(SMR, SMC) is true when SMC is SMR with combined semantics
combine([],[]).
combine([question, you|SMR],[[answer, greet]|SMC]) :- combine(SMR,SMC), !.
combine([question|SMR],[[answer, greet]|SMC]) :- combine(SMR,SMC), !.
combine([X|SMR],[X|SMC]) :- combine(SMR,SMC), !.

% rmrep(SM, SMR) true when l2 is l1 without repeating elements
rmrep([],[]).
rmrep([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), rmrep(Y,NSM),!.
rmrep([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), rmrep(SMN, NSM).

% Analise the score of answers
analyze(AS, AAS) :- AS = AAS.

% Auxiliary predicates
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
