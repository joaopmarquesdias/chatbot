/* SINTAX-SEMANTIC ANALYSIS */
% True when SM is a list of all semantic values (idatabase) in S
semantics([],[]).
semantics(S, SM) :-
  headsublist(P, TS, S), isemsin(SS, P),
  semantics(TS, SM1), append(SS, SM1, SM), !.
semantics([_|S], SM) :- semantics(S,SM).

/* SEMANTIC ANALYSIS */
/* NORMALIZE */
% NSM is the normalized list, based on relations (rdatabase) of SM
normalize(SM,NSM) :- rmrep(SM, SMR), combine(SMR, NSM).

% rmrep(SM, SMR) true when l2 is l1 without repeating elements
rmrep([],[]).
rmrep([SM|SMS],[SM|NSM]) :- member(SM,SMS), delMember(SM,SMS,Y), rmrep(Y,NSM),!.
rmrep([SM|SMN],[SM|NSM]) :- not(member(SM,SMN)), rmrep(SMN, NSM).

% combine(SMR, SMC) is true when SMC is SMR with combined semantics
combine([],[]).
combine(SM, SMC) :-
  headsublist(X, T, SM), sym(X, Y),
  combine(T,SMC1), append(Y, SMC1, SMC), !.
combine([_|SM], SMC) :- combine(SM, SMC).

/* ? ANALYSIS */
/* ANALYSE */
% True when AAS is a list of answers with scores
analyze([],[]).
analyze([A|AS], [ans(A,0)|AAS]) :- analyze(AS,AAS).

/* SINTAX GENERATION */
/* PRODUCTIONS */
% True when PS is the list of all productions of SM
productions(SM, PS) :- findall(P, production(SM, P), PS).

% True when P is a semantic production of SM
production([],[]).
production([S|SM], P) :- osemsin(S, P1), production(SM, P2), append(P1,P2,P).

/* AUXILIARY PREDICATES */
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
