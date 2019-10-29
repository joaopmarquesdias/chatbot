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

% Top-Down Lists
tdl(lgreet,[
  ["it is good", "it is nice", "I am pleased"],
  ["to"],
  ["meet", "see"],
  ["you!"]]).

% Sentence Lists
sl(greet,[["hello"], ["hi"], ["Hey"]]).
sl(goodbye, [["goodbye"],["bye"]]).
sl(agree, [["agree"],["acknowledge"],["recognize"],["concur"]]).
sl(disagree, [["disagree"],["differ"]]).
sl(good, [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
sl(bad, [["bad"],["awful"],["dreadful"],["terrible"]]).
sl(right, [["right"],["true"],["legitimate"]]).
sl(wrong, [["wrong"],["false"],["inaccurate"],["mistaken"]]).
sl(approve, [["approve"],["accept"],["respect"]]).
sl(reprove, [["reprove"],["censure"],["condemn"]]).
sl(thank,[
  ["i", "really", "apreciate", "it"],
  ["thank", "you"],["thanks"]]).
sl(dknow,[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
sl(nopinion,[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).

% Sintax generators
% Top-Down generator
% True when S is a possible combination of words in TDL
topdowngen([],[]).
topdowngen([X|BS], S) :-
  member(W, X), split_string(W, " ", "", W1),
  append(W1, S1, S),
  topdowngen(BS, S1).


% Sentence list generator
% True when S is a sentence in SL
slgen(SL, S) :- member(S, SL).

% Semantic-Sintax relations
semsin(greet, S)     :- sl(greet, TDL), slgen(TDL, S).
semsin(goodbye, S)   :- sl(goodbye, TDL), slgen(TDL, S).
semsin(agree, S)     :- sl(agree, TDL), slgen(TDL, S).
semsin(disagree, S)  :- sl(disagree, TDL), slgen(TDL, S).
semsin(good, S)      :- sl(good, TDL), slgen(TDL, S).
semsin(bad, S)       :- sl(bad, TDL), slgen(TDL, S).
semsin(right, S)     :- sl(right, TDL), slgen(TDL, S).
semsin(wrong, S)     :- sl(wrong, TDL), slgen(TDL, S).
semsin(approve, S)   :- sl(approve, TDL), slgen(TDL, S).
semsin(reprove, S)   :- sl(reprove, TDL), slgen(TDL, S).

semsin(lgreet, S)    :- tdl(lgreet, TDL), topdowngen(TDL, S).
semsin(thank, S)     :- sl(thank, SL), slgen(SL, S).
semsin(dknow, S)     :- sl(dknow, SL), slgen(SL, S).
semsin(nopinion, S)  :- sl(nopinion, SL), slgen(SL, S).

%semsin(opinion, S)   :- singen(opinion, S).
%semsin(athank, S)    :- singen(athank, S).
%semsin(know, S)      :- singen(know, S).
%semsin(qgreet, S)    :- singen(qgreet, S).
%semsin(qgoodbye, S)  :- singen(qgoodbye, S).

semsin(repeat(X), X).
