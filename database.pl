/*
The main data are the relations (semantic, sintax), where
  semantic is a defined value and
  sintax is a set of phrases that share the semantic value defined

We can store this relations using the predicate
->> semsin(semantic_value, [phrases]).

We can store semantic values using
->> sval(semantic_value).

We can have semantic relations such as
->> antonyms(V1, V2).
->> synonyms(V1, V2).     useful to find keywords
->> (maybe useful) meronym, holonym, hyponym, hyperonym

Semantic values:
  greet   | goodbye
  qgreet  | qgoodbye    (question_greet, question_goodbye)
  approve | reprove
  thank   | ?
  athank  | ?           (answer to thank)
  know    | dknow       (know, don't know) :: must be divided into subtopics ex:. know_niilism
  opinion | nopinion    (opinion, no opinion) :: must be divided into subtopics ex:. opinion_picasso
  agree   | disagree
  good    | bad         ex:. ("good", "great"), ("bad","terrible")
  right   | wrong       ex:. "right", "wrong"

  is(X, Y)              (X is Y) :: ex:. (we can use good) semsin(good, Y), is("That", Y) -> "That is great"
  am(X)                 (i am X) :: ex:. semsin(good, X), am(X) -> "i am great"
  are(X, Y)             (X are Y) :: ex:. semsin(wrong, Y), are("They", Y) -> "They are wrong"

  repeat(X)             (X) :: this semantic value is whatever is in X

Syntactic values:
  Sentences with a well defined semantic value
  ex:. semsin(greet, [["hello"],["it", "is", "nice", "to", "see", "you"]]).
*/

% Semantic Value
sval(greet).
sval(goodbye).
sval(qgreet).   % question_greet, ex: "how are you?"
sval(qgoodbye). % question_goodbye, ex: "are you sure you don't have any other question?"
sval(approve).  % ex: "i accept that"
sval(reprove).  % ex: "i censore that"
sval(thank).
sval(athank).   % answer_thank, ex: "no problem!"
sval(know).     % (must be divided into subtopics) ex: know_niilism
sval(dknow).    % don't_know, ex: "i can't help you there"
sval(opinion).  % (must be divided into subtopics) e: opinion_picasso
sval(nopinion). % ex: "i don't have an opinion about that"
sval(agree).
sval(disagree).
sval(good).
sval(bad).
sval(right).
sval(wrong).
sval(am(_)).
sval(is(_,_)).
sval(are(_,_)).
sval(repeat(_)).

% Semantic relations
antonyms(greet, goodbye).
antonyms(qgreet, qgoodbye).
antonyms(aprove, reprove).
antonyms(know, dknow).
antonyms(opinion, nopinion).
antonyms(agree, disagree).
antonyms(good, bad).
antonyms(right, wrong).

% Semantic-Sintax relations
% sugestion: define semsin(semantic_value, S), were S is a single sentence insted of a list of sentences
%            use an auxiliar predicate to generate multiple S's
semsin(greet, [["hello"]]).
semsin(goodbye, [["goodbye"]]).
semsin(qgreet, [["how", "are", "you?"]]).
semsin(qgoodbye, [["are", "you", "sure", "you", "don't", "have", "any", "other", "question?"]]).
semsin(approve, [["i", "accept", "that"]]).
semsin(reprove, [["i", "censore", "that"]]).
semsin(thank, [["i", "really", "apreciate", "it"]]).
semsin(athank, [["no", "problem"], ["my", "pleasure"]]).
semsin(know, [["i", "know", "that"]]).
semsin(dknow, [["i", "can't", "help", "you", "there"]]).
semsin(opinion, [["i", "think", "that", "..."]]).
semsin(nopinion, [["i've", "never", "given", "it", "much", "thought"]]).
semsin(agree, [["i", "agree"], ["exactly!"]]).
semsin(disagree, [["i", "am", "not", "sure", "about", "that"]]).
semsin(good, [["good"], ["great"]]).  % we can use synonyms(good, X), to define semsin(good, [X])
semsin(bad, [["bad"], ["terrible"]]). % we can use synonyms
semsin(right, ["right"]).           % we can use synonyms
semsin(wrong, ["wrong"]).           % we can use synonyms
semsin(am(X), [["i", "am", X]]).
semsin(is(X,Y), [[X, "is", Y]]).    % reduce is/are to xyz(X, Y, Z)? is(X,Y) = xyz(X, "is", Y).
semsin(are(X,Y), [[X, "are", Y]]).  % are(X,Y) = xyz(X, "are", Y).
semsin(repeat(X), [[X]]).
