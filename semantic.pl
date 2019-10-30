/* SEMANTICS */
% TODO: create a list of specific unifications [su(Patter, Semantic)]
%       so we can just say
%       semantics([X,Y,Z,W|WS], [S|SM]) :- member(MM, su), unify(X,Y,Z,W, MM)...

% SM is a list of all semantic values in S
semantics([],[]).
% specific unification
semantics(["good", "morning"|WS], [greet|SM])                :- semantics(WS, SM), !.
semantics(["good", "afternoon"|WS], [greet|SM])              :- semantics(WS, SM), !.
semantics(["good", "evening"|WS], [greet|SM])                :- semantics(WS, SM), !.
semantics(["i", "am", X|WS], [greet, repeat(X)|SM])          :- semantics(WS, SM), !.
semantics(["my", "name", "is", X|WS], [greet, repeat(X)|SM]) :- semantics(WS, SM), !.
semantics(["do","you"|WS], [question|SM])     :- semantics(WS, SM), !.
% generic semantic unification
semantics([W|WS], [S|SM]) :- semsin(S, [W]), not(S = repeat(_)), semantics(WS, SM), !.
semantics([W|WS], SM)     :- not(semsin(_, W)), semantics(WS, SM), !.
semantics([W|WS], SM)     :- semsin(S, W), S = repeat(_), semantics(WS, SM), !.

/* NORMALIZE */
% NSM is the normalized list of SM
normalize([],[dknow]).
normalize(SM,NSM) :- rmrep(SM, SMR), combine(SMR, NSM).

% rmrep(SM, SMR) true when l2 is l1 without repeating elements
rmrep([],[]).
rmrep([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), rmrep(Y,NSM),!.
rmrep([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), rmrep(SMN, NSM).

% combine(SMR, SMC) is true when SMC is SMR with combined semantics
combine([],[]).
combine([question, know],[dknow]):- !.
combine([question, you|SMR],[[answer, greet]|SMC]) :- combine(SMR,SMC), !.
combine([question|SMR],[[answer, greet]|SMC]) :- combine(SMR,SMC), !.
combine([X|SMR],[X|SMC]) :- combine(SMR,SMC), !.

/* ANALISE */
% True when AAS is a list of answers with scores
analyze([],[]).
analyze([A|AS], [ans(A,0)|AAS]) :- analyze(AS,AAS).

/* PRODUCTIONS */
% True when PS is the list of all productions of SM
productions(SM, PS) :- findall(P, production(SM, P), PS).

% True when P is a semantic production of SM
production([],[]).
production([S|SM], P) :- semsin(S, P1), production(SM, P2), append(P1,P2,P).

/* AUXILIARY PREDICATES */

% delMember(X, XS, Y), True when Y is the list XS without the element X
delMember(_, [], []) :- !.
delMember(X, [X|Xs], Y) :- !, delMember(X, Xs, Y).
delMember(X, [T|Xs], Y) :- !, delMember(X, Xs, Y2), append([T], Y2, Y).

% list(L), True when L is a list
list([]).
list([_|T]) :- list(T).

% sublist(SL, L), True when SL is a sublist of L
sublist([],L)          :- list(L).
sublist([X|TX],[X|TY]) :- sublist(TX,TY).
sublist(X,[_|TY])      :- X = [_|_], sublist(X,TY).
