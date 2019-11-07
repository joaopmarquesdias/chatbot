/* input database */

% The structure repeate(X) as the same semantic value as X

% input semantic values
% "Small talk"
isemval([iam, repeate(_)]).
isemval([you]).
isemval([greet]).
isemval([goodbye]).
isemval([question]).
isemval([know]).
% Sepecific topics
isemval([themes]).
isemval([movements]).
isemval([painters]).
isemval([more]).
% Artists
isemval([picasso]).
isemval([van_gogh]).
isemval([matisse]).
isemval([monet]).
isemval([malevich]).
isemval([rothko]).
isemval([pollock]).
isemval([kandinsky]).
isemval([kooning]).
isemval([mondrian]).
isemval([warhol]).

% input sentence list
% "Small talk"
isl([iam, repeate(X)],[["i","am",X],["my","name","is",X]]).
isl([you],[["you"]]).
isl([greet],[["hello"], ["hi"], ["hey"]]).
isl([goodbye], [["goodbye"],["bye"]]).
isl([question],[
  ["how"],["where"],["what"],["why"],["when"],["can"],["do", "you"]]).
isl([know],[["know"],["realize"],["notice"],["recognize"]]).
% Sepecific topics
isl([themes],[["themes"]]).
isl([painters],[["painters"]]).
isl([movements],[["movements"]]).
isl([more],[["more"]]).
% Artists
isl([picasso],[["Picasso"],["picasso"]]).
isl([van_gogh],[["Van", "Gogh"],["van", "gogh"]]).
isl([matisse],[["Matisse"],["matisse"]]).
isl([monet],[["Monet"],["monet"]]).
isl([malevich],[["Malevich"],["malevich"]]).
isl([rothko],[["Rothko"],["rothko"]]).
isl([pollock],[["Pollock"],["pollock"]]).
isl([kandinsky],[["Kandinsky"],["kandinsky"]]).
isl([kooning],[["Kooning"],["kooning"]]).
isl([mondrian],[["Mondrian"],["mondrian"]]).
isl([warhol],[["Warhol"],["warhol"]]).

% input sentence list generator
islgen(SL, S) :- member(S, SL).

% input semsin relations
isemsin(S, P) :- isl(S, SL), islgen(SL, P), !.
