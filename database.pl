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

% Sintax generator
singen(greet, S)    :- member(S, [["hello"]]).
singen(goodbye, S)  :- member(S, [["goodbye"]]).
singen(qgreet, S)   :- member(S, [["how", "are", "you?"]]).
singen(qgoodbye, S) :- member(S,
  [["are", "you", "sure", "you", "don't", "have", "any", "other", "question?"]]).
singen(approve, S)  :- member(S, [["i", "accept", "that"]]).
singen(reprove, S)  :- member(S, [["i", "censore", "that"]]).
singen(thank, S)    :- member(S, [["i", "really", "apreciate", "it"]]).
singen(athank, S)   :- member(S, [["no", "problem"], ["my", "pleasure"]]).
singen(know, S)     :- member(S, [["i", "know", "that"]]).
singen(dknow, S)    :- member(S, [["i", "can't", "help", "you", "there"]]).
singen(opinion, S)  :- member(S, [["i", "think", "that", "..."]]).
singen(nopinion, S) :- member(S, [["i've", "never", "given", "it", "much", "thought"]]).
singen(agree, S)    :- member(S, [["i", "agree"], ["exactly!"]]).
singen(disagree, S) :- member(S, [["i", "am", "not", "sure", "about", "that"]]).
singen(good, S)     :- member(S, [["good"], ["great"]]).
% we can use synonyms(good, X), to define semsin(good, [X])
singen(bad, S)      :- member(S, [["bad"], ["terrible"]]).
% we can use synonyms
singen(right, S)    :- member(S, [["right"]]).
% we can use synonyms
singen(wrong, S)    :- member(S, [["wrong"]]).
% we can use synonyms
singen(am(X), ["i", "am", X]).
singen(is(X,Y), [X, "is", Y]).    % reduce is/are to xyz(X, Y, Z)? is(X,Y) = xyz(X, "is", Y).
singen(are(X,Y), [X, "are", Y]).  % are(X,Y) = xyz(X, "are", Y).
singen(repeat(X), [X]).

% Semantic-Sintax relations
semsin(greet, S)      :- singen(greet, S).
semsin(goodbye, S)    :- singen(goodbye, S).
semsin(qgreet, S)     :- singen(qgreet, S).
semsin(qgoodbye, S)   :- singen(qgoodbye, S).
semsin(approve, S)    :- singen(approve, S).
semsin(reprove, S)    :- singen(reprove, S).
semsin(thank, S)      :- singen(thank, S).
semsin(athank, S)     :- singen(athank, S).
semsin(know, S)       :- singen(know, S).
semsin(dknow, S)      :- singen(dknow, S).
semsin(opinion, S)    :- singen(opinion, S).
semsin(nopinion, S)   :- singen(nopinion, S).
semsin(agree, S)      :- singen(agree, S).
semsin(disagree, S)   :- singen(disagree, S).
semsin(good, S)       :- singen(good, S).
semsin(bad, S)        :- singen(bad, S).
semsin(right, S)      :- singen(right, S).
semsin(wrong, S)      :- singen(wrong, S).
semsin(am(X), S)      :- singen(am(X), S).
semsin(is(X,Y), S)    :- singen(is(X,Y), S).
semsin(are(X,Y), S)   :- singen(are(X,Y), S).
semsin(repeat(X), S)  :- singen(repeat(X), S).
