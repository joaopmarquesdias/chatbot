/* input database */

% The structure repeate(X) as the same semantic value as X

% input semantic values
isemval([iam, repeate(_)]).
isemval([you]).
isemval([greet]).
isemval([goodbye]).
isemval([question]).
isemval([know]).
%isemval([question, greet]).

% input sentence list
isl([iam, repeate(X)],[["i","am",X],["my","name","is",X]]).
isl([you],[["you"]]).
isl([greet],[["hello"], ["hi"], ["hey"]]).
isl([goodbye], [["goodbye"],["bye"]]).
isl([question],[
  ["how"],["where"],["what"],["why"],["when"],["can"],["do", "you"]]).
isl([know],[["know"],["realize"],["notice"],["recognize"]]).

% input sentence list generator
islgen(SL, S) :- member(S, SL).

% input semsin relations
isemsin(S, P) :- isl(S, SL), islgen(SL, P), !.
