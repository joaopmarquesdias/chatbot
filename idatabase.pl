/* input database */

% The structure repeate(X) as the same semantic value as X

% input semantic values
% "Small talk"
isemval([iam, repeate(_)]).
isemval([you]).
isemval([greet]).
isemval([goodbye]).
isemval([yes]).
isemval([no]).
isemval([question]).
isemval([know]).
isemval([are]).
% Sepecific topics
isemval([themes]).
isemval([movements]).
isemval([painters]).
isemval([styles]).
isemval([musicians]).
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
%Musicians
isemval([pink_floyd]).
isemval([the_beatles]).
isemval([nirvana]).
isemval([queen]).
isemval([led_zepplin]).
isemval([ramones]).
isemval([michael_jackson]).
isemval([ray_charles]).
isemval([bob_dylan]).
isemval([metallica]).
isemval([megadeth]).
isemval([black_sabbath]).


% input sentence list
% "Small talk"
isl([iam, repeate(X)],[["i","am",X],["my","name","is",X]]).
isl([you],[["you"]]).
isl([greet],[["hello"], ["hi"], ["hey"]]).
isl([goodbye], [["Goodbye"],["Bye"],["goodbye"],["bye"]]).
isl([yes], [["yes"],["Yes"],["y"],["Y"]]).
isl([no], [["no"],["No"],["n"],["N"]]).
isl([question],[
  ["how"],["where"],["what"],["why"],["when"],["can"],["do", "you"]]).
isl([know],[["know"],["realize"],["notice"],["recognize"]]).
isl([are],[["are"]]).
% Sepecific topics
isl([themes],[["themes"]]).
isl([painters],[["painters"]]).
isl([movements],[["movements"]]).
isl([musicians],[["musicians"]]).
isl([styles],[["styles"]]).
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
%Musicians
isl([pink_floyd],[["Pink", "Floyd"],["pink","floyd"]]).
isl([the_beatles],[["Beatles"],["beatles"]]).
isl([nirvana],[["Nirvana"],["nirvana"]]).
isl([queen],[["Queen"],["queen"]]).
isl([led_zepplin],[["Led", "Zepplin"],["led","zepplin"]]).
isl([ramones],[["Ramones"],["ramones"]]).
isl([michael_jackson],[["Michael","Jackson"],["michael","jackson"]]).
isl([ray_charles],[["Ray", "Charles"],["ray","charles"]]).
isl([bob_dylan],[["Bob","Dylan"],["bob", "dylan"]]).
isl([metallica],[["Metallica"],["metallica"]]).
isl([megadeth],[["Megadeth"],["megadeth"]]).
isl([black_sabbath],[["Black","Sabbath"],["black", "sabbath"]]).

% input sentence list generator
islgen(SL, S) :- member(S, SL).

% input semsin relations
isemsin(S, P) :- isl(S, SL), islgen(SL, P), !.
