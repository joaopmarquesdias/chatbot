% SINTAX -> SEMANTIC
% True when SM is a list of all semantic values (idatabase) in S
semantics(S, SM) :- map(isemsin, S, SM).

/* SEMANTIC ANALYSIS */
% NSM is the normalized list, based on relations (rdatabase) of SM
normalize(SM,NSM) :-
  remove_repetitions(SM, SMR),
  symmetries(SMR, NSM).

% True when L2 is L1 without repeated elements
remove_repetitions([],[]).
remove_repetitions([SM|SMS],[SM|NSM]) :-
  member(SM,SMS), delMember(SM,SMS,Y), remove_repetitions(Y,NSM),!.
remove_repetitions([SM|SMN],[SM|NSM]) :-
  not(member(SM,SMN)), remove_repetitions(SMN, NSM).

% True when SMS is the symmetry of SM
symmetries(SM, SMS) :- map(sym, SM, SMS).

% SINTAX ANALYSIS
% True when AAS is a list of answers with scores
analyze([],[]).
analyze([A|AS], [ans(A,0)|AAS]) :- analyze(AS,AAS).

% SEMANTIC -> SINTAX GENERATION
% True when PS is the list of all productions of SM
productions(SM, PS) :- findall(P, production(SM, P), PS).

% True when P is a semantic production of SM
production([],[]).
production([S|SM], P) :- osemsin(S, P1), production(SM, P2), append(P1,P2,P).
