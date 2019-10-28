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
  aprove  | reprove
  thank   | discredit
  athank  | adiscredit  (answer to thank, answer to discredit)
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
