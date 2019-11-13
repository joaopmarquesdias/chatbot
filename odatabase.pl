/* output database */

painters("Pablo Picasso").
painters("Vincent Van Gogh").
painters("Henri Matisse").
painters("Claude Monet").
painters("Kazimir Malevich").
painters("Mark Rothko").
painters("Jackson Pollock").
painters("Wassily Kandinsky").
painters("Willem de Kooning").
painters("Piet Mondrian").
painters("Andy Warhol").

movement("Pablo Picasso", "Cubism").
movement("Pablo Picasso", "Surrealism").
movement("Vincent Van Gogh", "Post-Impressionism").
movement("Henri Matisse", "Post-Impressionism").
movement("Henri Matisse", "Fauvism").
movement("Henri Matisse", "Modernism").
movement("Claude Monet", "Impressionism").
movement("Kazimir Malevich", "Suprematism").
movement("Mark Rothko", "Abstract expressionism").
movement("Mark Rothko", "Color Field").
movement("Jackson Pollock", "Abstract expressionism").
movement("Wassily Kandinsky", "Expressionism").
movement("Wassily Kandinsky", "Abstract art").
movement("Willem de Kooning", "Abstract expressionism").
movement("Piet Mondrian", "De Stijl").
movement("Piet Mondrian", "Abstract art").
movement("Andy Warhol", "Pop art").

movements(AMS) :- findall(M, movement(_,M), MS), remove_repetitions(MS, AMS).

%musicians(_).

%writters(_).

% Semantic values

% "Small talk"
osemval([good]).
osemval([thank]).
osemval([greet]).
osemval([dknow]).
osemval([nopinion]).
osemval([answer_greet]).
osemval([ask_end]).
osemval([else_end]).
osemval([is_end]).
% Specific topics
osemval([know_themes]).
osemval([know_painters]).
osemval([know_movements]).
% Artists
osemval([know_picasso]).
osemval([know_van_gogh]).
osemval([know_matisse]).
osemval([know_monet]).
osemval([know_malevich]).
osemval([know_rothko]).
osemval([know_pollock]).
osemval([know_kandinsky]).
osemval([know_kooning]).
osemval([know_mondrian]).
osemval([know_warhol]).

% Sintax generators

% output sentence list
% "Small talk"
osl([good], [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
osl([thank],[["thank", "you"],["thanks"]]).
osl([sgreet],[["hello"], ["hi"], ["hey"]]).
osl([dknow],[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
osl([nopinion],[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).
osl([ask_end],[
  ["Are", "you", "sure", "you", "do", "not", "have", "any", "other", "question?"]]).
osl([else_end],[
  ["What", "else", "do", "you", "want", "to", "know", "about?"]]).
osl([is_end],[
  ["Goodbye"],["Bye"],["Goodbye", "it", "was", "nice", "to", "talk", "to", "you"]]).
% Sepecific topics
osl([know_themes],[
  ["I", "can", "help", "you", "with", "painters", "musicians", "and", "writers"]]).
% Artists
% Impressionism +
osl([know_monet],[
  ["Oscar-Claude", "Monet", "was", "born", "on", "14", "November", "1840",
  "in", "France", "and", "died", "on", "5", "December", "1926", "at", "age", "86"]]).
% Post-impressionism +
osl([know_van_gogh],[
  ["Vincent", "Willem", "van", "Gogh", "was", "born", "on", "30", "March", "1853",
  "in", "the", "Netherlands", "and", "died", "on", "29", "July", "1890",
  "at", "age", "37"]]).
osl([know_matisse],[
  ["Henri", "Émile Benoît", "Matisse", "was", "born", "on", "31", "December", "1869",
  "in", "France", "and", "died", "on", "3", "November", "1954", "at", "age", "84"]]).
% Expressionism +
osl([know_kandinsky],[
  ["Wassily", "Wassilyevich", "Kandinsky", "was", "born", "on",
  "16", "December", "1866", "in", "the", "Russian", "Empire",
  "and", "died", "on", "13", "December", "1944", "in", "France",
  "at", "age", "77"]]).
% Cubism +
osl([know_picasso],[
  ["Picasso", "full", "name", "was",
  "Pablo", "Diego", "José", "Francisco", "de", "Paula", "Juan",
  "Nepomuceno", "María", "de", "los", "Remedios", "Cipriano",
  "de", "la", "Santísima", "Trinidad", "Ruiz", "y", "Picasso"],
 ["Picasso","was","born","in", "1881", "and", "died", "in", "1973"],
 ["He", "is", "know", "has", "the", "co-founder", "of", "cubism"]]).
% Suprematism +
osl([know_malevich],[
  ["Kazimir", "Severinovich", "Malevich", "was", "born", "on",
  "23", "February", "1879", "in", "the", "Russian", "Empire",
  "and", "died", "on", "15", "May", "1935", "in", "the", "Soviet", "Union",
  "at", "age", "56"]]).
% Abstract expressionism +
osl([know_rothko],[
  ["Markus", "Yakovlevich", "Rothkowitz", "was", "born", "on",
  "September,", "25", "1903", "in", "the", "Russian", "Empire",
  "and", "died", "on", "February,", "25", "1970", "in", "the", "U.S",
  "at", "age", "66"]]).
osl([know_pollock],[
  ["Paul", "Jackson", "Pollock", "was", "born", "on",
  "January,", "28", "1912", "in", "the", "U.S",
  "and", "died", "on", "August,", "11", "1956", "at", "age", "44"]]).
osl([know_kooning],[
  ["Willem", "de", "Kooning", "was", "born", "on",
  "April,", "24", "1904", "in", "the", "Netherlands",
  "and", "died", "on", "March,", "19", "1997", "in", "the", "U.S",
  "at", "age", "92"]]).
osl([know_mondrian],[
  ["Piet", "Cornelis", "Mondriaan", "was", "born", "on",
  "March,", "7", "1872", "in", "the", "Netherlands",
  "and", "died", "on", "February,", "1", "1944", "in", "the", "U.S",
  "at", "age", "71"]]).
% Pop art
osl([know_warhol],[
  ["Andrew", "Warhola", "was", "born", "on",
  "August,", "6", "1928", "in", "the", "U.S",
  "and", "died", "on", "February,", "22", "1987", "at", "age", "58"],
  ["Andy", "Warhol", "was", "a", "leading", "figure", "in", "the", "visual",
  "art", "movement", "known", "as", "pop", "art"]]).

% outupt Top-Down Lists
% "Small talk"
otdl([lgreet],[
  ["it is good", "it is nice", "i am pleased"],
  ["to"],
  ["meet", "see"],
  ["you"]]).

% output sentence combination
% "Small talk"
osc([answer_greet],[["i", "am"],X,Y,["for", "asking"]]) :-
  osemsin(X, [good]), osemsin(Y,[thank]).
% Sepecific topics
osc([know_painters],[
  ["I", "know", "things", "about"], ES,
  ["wich","one","do","you","what","to","know","about?"]])
  :- findall(P, painters(P), PS), enumerate(PS, ES).
osc([know_movements],[
  ["The", "painters", "I", "know", "followed", "this", "art", "movements:"],
  AMS, ["are", "you", "interested", "in", "any", "of", "them?"]])
  :- movements(MS), enumerate(MS, AMS).

% outupt Top-Down generator
% True when S is a possible combination of words in TDL
otdgen([],[]).
otdgen([X|BS], S) :-
  member(W, X), split_string(W, " ", "", W1),
  otdgen(BS, S1),
  append(W1, S1, S).
% output sentence list generator
oslgen(SL, S) :- member(S, SL).
% output sentence combination generator
oscgen([],[]).
oscgen([X|SC], S) :- oscgen(SC, S1), append(X, S1, S).

% output semantic-sintax relations
% combined relations
osemsin(P, [greet]) :- osl([sgreet], SL), oslgen(SL, P).
osemsin(P, [greet]) :- otdl([lgreet], TDL), otdgen(TDL, P).
osemsin(P, [greet]) :-
  osl([sgreet], SL), oslgen(SL, P1),
  otdl([lgreet], TDL), otdgen(TDL, P2),
  append(P1,P2,P).
% defined relations
osemsin(P, S)       :- osl(S, SL), oslgen(SL, P).
osemsin(P, S)       :- osc(S, SL), oscgen(SL, P).
osemsin([X], [repeate(X)]).
