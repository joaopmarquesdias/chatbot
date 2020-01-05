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


% Semantic values

% "Small talk"
osemval(good).
osemval(thank).
osemval(greet).
osemval(dont_know).
osemval(answer_greet).
osemval(ask_end).
osemval(else_end).
osemval(is_end).
osemval(sudden_bye).
% Specific topics
osemval(know_themes).
osemval(know_movements).
osemval(know_styles).
osemval(know_painters).
osemval(know_musicians).
osemval(meaning_life).
% Artists
osemval(know_picasso).
osemval(know_van_gogh).
osemval(know_matisse).
osemval(know_monet).
osemval(know_malevich).
osemval(know_rothko).
osemval(know_pollock).
osemval(know_kandinsky).
osemval(know_kooning).
osemval(know_mondrian).
osemval(know_warhol).
% Musicians
osemval(know_pink_floyd).
osemval(know_the_beatles).
osemval(know_nirvana).
osemval(know_queen).
osemval(know_led_zepplin).
osemval(know_ramones).
osemval(know_michael_jackson).
osemval(know_ray_charles).
osemval(know_bob_dylan).
osemval(know_metallica).
osemval(know_megadeth).
osemval(know_black_sabbath).

%class(question) -->
% Sintax grammars
% "Small talk"
osem(good) --> ["good"]; ["great"]; ["superb"]; ["excellent"]; ["marvelous"].
osem(thank) --> ["thank", "you"]; ["thanks"].
osem(short_greet) --> ["hello"]; ["hi"]; ["hey"].
osem(long_greet) --> osem(long_greet0), ["to"], osem(long_greet1), ["you"].
osem(long_greet0) --> ["it", "is", "good"]; ["it is nice"]; ["i am pleased"].
osem(long_greet1) --> ["meet"]; ["see"].
osem(greet) --> osem(short_greet).
osem(greet) --> osem(short_greet), osem(long_greet).
osem(greetl) --> osem(short_greet), osem(long_greet).
osem(answer_greet) --> ["I", "am"], osem(good), osem(thank), ["for", "asking"].
osem(dont_know) -->
  ["I", "can't", "help", "you", "there."];
  ["I", "do", "not", "know", "that."].
osem(ask_end) -->
  ["Are", "you", "sure", "you", "do", "not",
  "have", "any", "other", "question?"].
osem(else_end) -->
  ["What", "else", "do", "you", "want", "to", "know", "about?"].
osem(is_end) -->
  ["Goodbye"]; ["Bye"];
  ["Goodbye", "it", "was", "nice", "to", "talk", "to", "you"].
osem(sudden_bye) -->
  ["Thank", "you", "but", "I", "have", "to", "go,", "goodbye!"].
% Sepecific topics
osem(know_themes) -->
  ["I", "can", "help", "you", "with", "painters", "and", "musicians."].
osem(know_painters, S, []) :-
  findall(P, painters(P), PS), enumerate(PS, ES),
  append([["I", "know", "things", "about"],ES,
    ["wich","one","do","you","what","to","know","about?"]],S).
osem(know_movements, S, []) :-
  movements(MS), enumerate(MS, AMS),
  append(
    [["The", "painters", "I", "know", "followed", "this", "art", "movements:"],
    AMS], S).
osem(know_musicians, S, []) :-
  findall(P, musicians(P), PS), enumerate(PS, ES),
  append([["I", "know", "things", "about"], ES,
    ["wich","one","do","you","what","to","know","about?"]], S).
osem(know_styles, S, []) :-
  styles(MS), enumerate(MS, AMS),
  append([["The", "musicians", "I", "know", "followed", "this", "styles:"],
    AMS],S).
osem(meaning_life) --> ["42"].
% Artists
osem(know_monet) -->
  ["Oscar-Claude", "Monet", "was", "born", "on", "November",
  "14", "1840","in", "France", "and", "died", "on", "December", "5",
  "1926", "at", "age", "86."];
  ["Monet", "was", "a", "founder", "of", "French",
  "Impressionist", "painting."];
  ["Monet's", "ambition", "of", "documenting", "the", "French", "countryside",
  "led", "him", "to", "adopt", "a", "method", "of", "painting", "the", "same",
  "scene", "many", "times", "in", "order", "to", "capture", "the", "changing",
  "of", "light", "and", "the", "passing", "of", "the", "seasons."].
osem(know_van_gogh) -->
  ["Vincent", "Willem", "van", "Gogh", "was", "born", "on", "March", "30",
  "1853","in", "the", "Netherlands", "and", "died", "on", "July", "29",
  "1890", "in","France", "at", "age", "37."];
  ["Van", "Gogh", "was", "a", "Dutch", "post-impressionist", "painter", "who",
  "is", "among", "the", "most", "famous", "and", "influential", "figures",
  "in", "the", "history", "of", "Western", "art."];
  ["In", "just", "over", "a", "decade", "Van", "Gogh", "created",
  "about", "2100", "artworks,", "including", "around", "860", "oil",
  "paintings,", "most", "of","which", "date", "from", "the", "last",
  "two", "years", "of", "his", "life."].
osem(know_matisse) -->
  ["Henri", "Émile Benoît", "Matisse", "was", "born", "on", "December",
  "31", "1869", "in", "France", "and", "died", "on", "November", "3",
  "1954", "at", "age", "84."];
  ["Matisse", "was", "a", "French", "artist,", "known", "for", "both",
  "his", "use", "of", "colour", "and", "his", "fluid", "and",
  "original", "draughtsmanship."];
  ["Matisse", "is", "commonly", "regarded,", "along", "with",
  "Pablo", "Picasso,","as", "one", "of", "the", "artists", "who",
  "best", "helped", "to", "define","the", "revolutionary", "developments",
  "in", "the", "visual", "arts."].
osem(know_kandinsky) -->
  ["Wassily", "Wassilyevich", "Kandinsky", "was", "born", "on",
  "December", "16", "1866", "in", "the", "Russian", "Empire",
  "and", "died", "on", "December", "13", "1944", "in", "France",
  "at", "age", "77."];
  ["Kandinsky", "is", "generally", "credited", "as", "the", "pioneer", "of",
  "abstract", "art."];
  ["Kandinsky", "began", "painting", "studies", "(life-drawing,", "sketching",
  "and", "anatomy)", "at", "the", "age", "of", "30."].
osem(know_picasso) -->
  ["Picasso", "full", "name", "was",
  "Pablo", "Diego", "José", "Francisco", "de", "Paula", "Juan",
  "Nepomuceno", "María", "de", "los", "Remedios", "Cipriano",
  "de", "la", "Santísima", "Trinidad", "Ruiz", "y", "Picasso."];
 ["Picasso","was","born","in", "1881", "and", "died", "in", "1973."];
 ["Picasso", "is", "know", "has", "the", "co-founder", "of", "cubism."].
osem(know_malevich) -->
  ["Kazimir", "Severinovich", "Malevich", "was", "born", "on",
  "February", "23", "1879", "in", "the", "Russian", "Empire","and",
  "died", "on", "May", "15","1935", "in", "the", "Soviet", "Union",
  "at", "age", "56"];
  ["Malevich", "was", "a", "Russian", "avant-garde", "artist", "and", "art",
   "theorist", "whose", "pioneering", "work", "and", "writing", "had", "a",
   "profound", "influence", "on", "the", "development", "of", "non-objective,",
   "or", "abstract", "art,", "in", "the", "20th", "century."];
  ["Malevich", "his", "art", "and", "his", "writing", "influenced",
   "contemporaries", "such", "as", "El", "Lissitzky,", "Lyubov", "Popova",
   "and", "Alexander", "Rodchenko."].
osem(know_rothko) -->
  ["Markus", "Yakovlevich", "Rothkowitz", "was", "born", "on",
  "September,", "25", "1903", "in", "the", "Russian", "Empire",
  "and", "died", "on", "February,", "25", "1970", "in", "the", "U.S",
  "at", "age", "66"];
  ["Although", "Rothko", "himself", "refused", "to", "adhere",
  "to", "any", "art","movement,", "he", "is", "generally", "identified",
  "as", "an", "abstract","expressionist."];
  ["Rothko's", "move", "to", "New", "York", "landed", "him", "in", "a",
  "fertile", "artistic", "atmosphere."].
osem(know_pollock) -->
  ["Paul", "Jackson", "Pollock", "was", "born", "on",
  "January,", "28", "1912", "in", "the", "U.S",
  "and", "died", "on", "August,", "11", "1956", "at", "age", "44"];
  ["Pollock", "was", "widely", "noticed", "for", "his", "technique", "of", "pouring",
  "or", "splashing", "liquid", "household", "paint", "onto", "a", "horizontal",
  "surface."];
  ["Pollock's", "extreme", "form", "of", "abstraction", "divided", "the", "critics:",
  "some", "praised", "the", "immediacy", "and", "fluency", "of", "the", "creation,",
  "while", "others", "derided", "the", "random", "effects."].
osem(know_kooning) -->
  ["Willem", "de", "Kooning", "was", "born", "on",
  "April,", "24", "1904", "in", "the", "Netherlands",
  "and", "died", "on", "March,", "19", "1997", "in", "the", "U.S",
  "at", "age", "92."];
  ["Kooning", "was", "a", "Dutch-American", "abstract",
  "expressionist", "artist."];
  ["In", "the", "years", "after", "World", "War", "II,", "de", "Kooning",
  "painted", "in", "a", "style", "that", "came", "to", "be", "referred",
  "to", "as", "abstract", "expressionism", "or", "action", "painting."].
osem(know_mondrian) -->
  ["Piet", "Cornelis", "Mondriaan", "was", "born", "on",
  "March,", "7", "1872", "in", "the", "Netherlands",
  "and", "died", "on", "February,", "1", "1944", "in", "the", "U.S",
  "at", "age", "71."];
  ["Mondrian", "was", "a", "Dutch", "painter", "and", "theoretician", "who",
  "is", "regarded","as", "one", "of", "the", "greatest", "artists", "of", "the",
  "20th", "century."];
  ["Mondrian's", "art", "was", "highly", "utopian", "and", "was", "concerned",
  "with", "a", "search", "for", "universal", "values", "and", "aesthetics."].
osem(know_warhol) -->
  ["Andrew", "Warhola", "was", "born", "on",
  "August,", "6", "1928", "in", "the", "U.S",
  "and", "died", "on", "February,", "22", "1987", "at", "age", "58."];
  ["Andy", "Warhol", "was", "a", "leading", "figure", "in", "the", "visual",
  "art", "movement", "known", "as", "pop", "art."];
  ["Warhol", "works", "explore", "the", "relationship", "between", "artistic",
  "expression,", "advertising,", "and", "celebrity", "culture."].
%Musicians
osem(know_pink_floyd) -->
  ["Pink", "Floyd", "were", "an", "English", "rock", "band", "formed",
  "in", "London", "in", "1965"];
  ["Pink", "Floyd", "were", "founded", "by", "students", "Syd", "Barrett,",
  "Nick","Mason,", "Roger", "Waters", "and", "Richard", "Wright."];
  ["Gaining", "a", "following", "as", "a", "psychedelic", "band,",
  "Pink", "Pink", "were", "distinguished", "for", "their", "extended",
  "compositions,", "sonic", "experimentation,", "philosophical",
  "lyrics", "and", "elaborate", "live", "shows,", "and", "became",
  "a", "leading", "band", "of", "the", "progressive", "rock", "genre."].
osem(know_the_beatles) -->
  ["The", "Beatles", "were", "an", "English", "rock", "band",
  "formed", "in", "Liverpool", "1960."];
  ["With", "a", "line-up", "comprising", "John", "Lennon,",
  "Paul", "McCartney,", "George", "Harrison", "and", "Ringo", "Starr,",
  "the", "Beatles", "are", "generally", "regarded", "as", "the", "most",
  "influential", "band", "of", "all", "time."];
  ["Led", "by", "the", "band's", "primary", "songwriters,", "Lennon",
  "and", "McCartney,","the", "Beatles", "built", "their",
  "reputation", "playing","clubs", "in", "Liverpool", "and",
  "Hamburg", "over", "a", "three-year", "period", "from", "1960."].
osem(know_nirvana) -->
  ["Nirvana", "was", "an", "American", "rock", "band", "formed",
  "in", "Aberdeen", "in", "1987."];
  ["Nirvana", "was", "founded", "by", "lead", "singer", "and", "guitarist",
  "Kurt", "Cobain", "and", "bassist", "Krist", "Novoselic."];
  ["Nirvana", "went", "through", "a", "succession", "of", "drummers,",
  "the", "longest-lasting", "and", "best-known", "being", "Dave",
  "Grohl,", "who", "joined", "in", "1990."].
osem(know_queen) -->
  ["Queen", "are", "a", "British", "rock", "band", "formed",
  "in", "London", "in", "1970."];
  ["Queen", "classic", "line-up", "was", "Freddie", "Mercury,",
  "Brian", "May,", "Roger", "Taulor", "and", "John", "Deacon."];
  ["Queen's", "earliest", "works", "were", "influenced", "by",
  "progressive", "rock,", "hard", "rock", "and", "heavy", "metal."].
osem(know_led_zepplin) -->
  ["Led", "Zeppelin", "were", "an", "English", "rock", "band",
  "formed", "in", "1968."];
  ["Led", "Zepplin", "line-up", "consisted", "of", "vocalist", "Robert",
  "Plant,", "guitarist", "Jimmy", "Page,", "bassist/keyboardist",
  "John", "Paul", "Jones,", "and", "drummer", "John", "Bonham."];
  ["With", "their", "heavy,", "guitar-driven", "sound,", "Led",
  "Zeppelin", "are", "regularly", "cited", "as", "one", "of",
  "the", "progenitors", "of", "heavy", "metal"].
osem(know_ramones) -->
  ["The", "Ramones", "were", "an", "American", "punk", "rock",
  "band", "that","formed", "in", "the", "New", "York", "City",
  "neighborhood", "of", "Forest", "Hills,", "Queens", "in", "1974."];
  ["Despite", "achieving", "only", "limited", "commercial", "success",
  "initially,", "the", "Ramones", "were", "highly", "influential", "in",
  "the", "United", "States", "and", "the", "United", "Kingdom."];
  ["All", "of", "Ramones'", "members", "adopted",
  "pseudonyms", "ending", "with","the", "surname", "\"Ramone\"."].
osem(know_michael_jackson) -->
  ["Michael", "Joseph", "Jackson", "was", "an",
  "American", "singer,", "songwriter,", "and", "dancer."];
  ["Michael", "Jackson", "is", "regarded", "as", "one", "of", "the", "most", "significant",
  "cultural", "figures", "of", "the", "20th", "century", "and", "one", "of",
  "the", "greatest", "entertainers."];
  ["Jackson's", "contributions", "to", "music,", "dance,", "and", "fashion,",
  "along", "with", "his", "publicized", "personal", "life,", "made", "him",
  "a", "global", "figure", "in", "popular", "culture", "for", "over", "four",
  "decades."].
osem(know_ray_charles) -->
  ["Ray", "Charles", "Robinson", "was", "an", "American",
  "singer,", "songwriter,", "musician,", "and", "composer."];
  ["Ray", "Charles", "was", "often", "referred", "to", "as", "\"The", "Genius\"."];
  ["Charles", "started", "losing", "his", "vision", "at", "the", "age", "of",
  "5,", "and", "by", "7", "he", "was", "blind."].
osem(know_bob_dylan) -->
  ["Bob", "Dylan", "is", "an", "American", "singer-songwriter,", "author,", "and",
  "visual", "artist", "who", "has", "been", "a", "major", "figure", "in", "popular",
  "culture", "for", "more", "than", "fifty", "years."];
  ["Since", "1994,", "Dylan", "has", "published",
  "eight", "books", "of", "paintings", "and", "drawings."].
osem(know_metallica) -->
  ["Metallica", "is", "an", "American", "heavy", "metal",
  "band", "formed", "in", "1981", "in", "Los", "Angeles."];
  ["Metallica's", "fast", "tempos,", "instrumentals", "and", "aggressive",
  "musicianship", "made", "them", "one", "of", "the", "founding",
  "\"big", "four\"", "bands", "of", "thrash", "metal,", "alongside",
  "Megadeth,", "Anthrax", "and", "Slayer."];
  ["Metalica's", "third", "album,", "Master", "of", "Puppets", "(1986),",
  "was", "described", "as", "one", "of", "the", "heaviest", "and", "most",
  "influential","thrash", "metal", "albums."].
osem(know_megadeth) -->
  ["Megadeth", "is", "an", "American", "heavy",
  "metal", "band", "from", "Los", "Angeles,", "California."];
  ["Along", "with", "Metallica,", "Anthrax,", "and", "Slayer,",
  "Megadeth", "is", "one", "one", "of", "the", "\"big", "four\"",
  "of", "American", "thrash", "metal."];
  ["In", "1985,", "Megadeth", "released", "its", "debut", "album,",
  "Killing", "Is", "My", "Business...", "and", "Business", "Is",
  "Good!,", "on", "the", "independent", "record", "label",
  "Combat", "Records."].
osem(know_black_sabbath) -->
  ["Black", "Sabbath", "were", "an", "English", "rock",
  "band", "formed", "in", "in", "Birmingham", "in", "1968."];
  ["Black", "Sabbath", "had", "multiple", "line-up", "changes,", "with",
  "Iommi", "being", "the", "only", "constant", "member", "throughout",
  "its", "history."];
  ["Black", "Sabbath", "helped", "define", "the", "genre", "with",
  "releases", "such", "as", "Black", "Sabbath", "(1970),", "Paranoid",
  "(1970),", "and", "Master", "of", "Reality", "(1971)."].
osem(repeate(X), [X], []).
