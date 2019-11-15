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

musicians("Pink Floyd").
musicians("The Beatles").
musicians("Nirvana").
musicians("Queen").
musicians("Led Zepplin").
musicians("Ramones").
musicians("Michael Jackson").
musicians("Ray Charles").
musicians("Bob Dylan").
musicians("Metallica").
musicians("Megadeth").
musicians("Black Sabbath").

style("Pink Floyd", "Rock").
style("The Beatles", "Rock").
style("Nirvana", "Rock").
style("Queen", "Rock").
style("Led Zepplin", "Rock").
style("Ramones", "Rock").
style("Michael Jackson", "Pop").
style("Ray Charles", "Jazz").
style("Bob Dylan", "Folk").
style("Metallica", "Heavy Metal").
style("Megadeth", "Heavy Metal").
style("Black Sabbath", "Heavy Metal").

styles(AMS) :- findall(M, style(_,M), MS), remove_repetitions(MS, AMS).

%writters(_).

% Semantic values

% "Small talk"
osemval([good]).
osemval([thank]).
osemval([greet]).
osemval([dknow]).
osemval([answer_greet]).
osemval([ask_end]).
osemval([else_end]).
osemval([is_end]).
% Specific topics
osemval([know_themes]).
osemval([know_painters]).
osemval([know_movements]).
osemval([know_musicians]).
osemval([know_styles]).

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
% Musicians
osemval([know_pink_floyd]).
osemval([know_the_beatles]).
osemval([know_nirvana]).
osemval([know_queen]).
osemval([know_led_zepplin]).
osemval([know_ramones]).
osemval([know_michael_jackson]).
osemval([know_ray_charles]).
osemval([know_bob_dylan]).
osemval([know_metallica]).
osemval([know_megadeth]).
osemval([know_black_sabbath]).

% Sintax generators

% output sentence list
% "Small talk"
osl([good], [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
osl([thank],[["thank", "you"],["thanks"]]).
osl([sgreet],[["hello"], ["hi"], ["hey"]]).
osl([dknow],[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
osl([ask_end],[
  ["Are", "you", "sure", "you", "do", "not", "have", "any", "other", "question?"]]).
osl([else_end],[
  ["What", "else", "do", "you", "want", "to", "know", "about?"]]).
osl([is_end],[
  ["Goodbye"],["Bye"],["Goodbye", "it", "was", "nice", "to", "talk", "to", "you"]]).
% Sepecific topics
osl([know_themes],[
  ["I", "can", "help", "you", "with", "painters", "and", "musicians"]]).

% Artists
% Impressionism +
osl([know_monet],[
  ["Oscar-Claude", "Monet", "was", "born", "on", "November", "14", "1840",
  "in", "France", "and", "died", "on", "December", "5", "1926", "at", "age", "86."],
  ["Monet", "was", "a", "founder", "of", "French", "Impressionist", "painting."],
  ["Monet's", "ambition", "of", "documenting", "the", "French", "countryside",
  "led", "him", "to", "adopt", "a", "method", "of", "painting", "the", "same",
  "scene", "many", "times", "in", "order", "to", "capture", "the", "changing",
  "of", "light", "and", "the", "passing", "of", "the", "seasons."]]).
% Post-impressionism +
osl([know_van_gogh],[
  ["Vincent", "Willem", "van", "Gogh", "was", "born", "on", "March", "30", "1853",
  "in", "the", "Netherlands", "and", "died", "on", "July", "29", "1890", "in",
  "France", "at", "age", "37"],
  ["Van", "Gogh", "was", "a", "Dutch", "post-impressionist", "painter", "who",
  "is", "among", "the", "most", "famous", "and", "influential", "figures",
  "in", "the", "history", "of", "Western", "art."],
  ["In", "just", "over", "a", "decade", "Van", "Gogh", "created", "about", "2,100",
  "artworks,", "including", "around", "860", "oil", "paintings,", "most", "of",
  "which", "date", "from", "the", "last", "two", "years", "of", "his", "life."]]).
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

% Musicians
osl([know_pink_floyd],[
  ["Pink", "Floyd", "were", "an", "English", "rock", "band", "formed", "in", "London", "in", "1965"]
  ]).
osl([know_the_beatles],[
  ["The", "Beatles", "were", "an", "English", "rock", "band", "formed", "in", "Liverpool", "1960"]
  ]).
osl([know_nirvana],[
  ["Nirvana", "was", "an", "American", "rock", "band", "formed", "in", "Aberdeen", "in", "1987"]
  ]).
osl([know_queen],[
  ["Queen", "are", "a", "British", "rock", "band", "formed", "in", "London", "in", "1970"]
  ]).
osl([know_led_zepplin],[
  ["Led", "Zeppelin", "were", "an", "English", "rock", "band", "formed", "in", "1968"]
  ]).
osl([know_ramones],[
  ["The", "Ramones", "were", "an", "American", "punk", "rock",
  "band", "that","formed", "in", "the", "New", "York", "City",
  "neighborhood", "of", "Forest", "Hills,", "Queens", "in", "1974"]
  ]).
osl([know_michael_jackson],[
  ["Michael", "Joseph", "Jackson", "was", "an",
  "American", "singer,", "songwriter,", "and", "dancer"]
  ]).
osl([know_ray_charles],[
  ["Ray", "Charles", "Robinson", "was", "an", "American",
  "singer,", "songwriter,", "musician,", "and", "composer"]
  ]).
osl([know_bob_dylan],[
  ["Bob", "Dylan", "is", "an", "American", "singer-songwriter,", "author,", "and",
  "visual", "artist", "who", "has", "been", "a", "major", "figure", "in", "popular",
  "culture", "for", "more", "than", "fifty", "years"]
  ]).
osl([know_metallica],[
  ["Metallica", "is", "an", "American", "heavy", "metal",
  "band", "formed", "in", "1981", "in", "Los", "Angeles"]
  ]).
osl([know_megadeth],[
  ["Megadeth", "is", "an", "American", "heavy",
  "metal", "band", "from", "Los", "Angeles,", "California"]
  ]).
osl([know_black_sabbath],[
  ["Black", "Sabbath", "were", "an", "English", "rock",
  "band", "formed", "in", "in", "Birmingham", "in", "1968"]
  ]).

%outupt Top-Down Lists
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
  AMS])
  :- movements(MS), enumerate(MS, AMS).
%em falta
osc([know_musicians],[["I", "know", "things", "about"], ES,
  ["wich","one","do","you","what","to","know","about?"]])
  :- findall(P, musicians(P), PS), enumerate(PS, ES).
osc([know_styles],[
  ["The", "musicians", "I", "know", "followed", "this", "styles:"], AMS])
  :- styles(MS), enumerate(MS, AMS).

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
