% TODO: add knolage base and opinion base (ex: picasso, niilism, fernando pessoa)...
% Semantic values
% Primitive semantic values
semval(i).
semval(you).
semval(greet).
semval(goodbye).
semval(agree).
semval(disagree).
semval(good).
semval(bad).
semval(right).
semval(wrong).
semval(approve).
semval(reprove).
semval(lgreet).
semval(thank).
semval(lthank).
semval(know).
semval(dknow).
semval(nopinion).
semval(question).

% Complex semantic values
semval([question, greet]).
semval([question, goodbye]).
semval([answer, greet]).
%semval([know, X]).
%semval([opinion, X]).

% Relative semantic value
semval(repeat(_)).

% Top-Down Lists
tdl(lgreet,[
  ["it is good", "it is nice", "i am pleased"],
  ["to"],
  ["meet", "see"],
  ["you"]]).

% Sentence Lists
sl(i,[["i"]]).
sl(you,[["you"]]).
sl(greet,[["hello"], ["hi"], ["hey"]]).
sl(goodbye, [["goodbye"],["bye"]]).
sl(agree, [["agree"],["acknowledge"],["recognize"],["concur"]]).
sl(disagree, [["disagree"],["differ"]]).
sl(good, [["good"],["great"],["superb"],["excellent"],["marvelous"]]).
sl(bad, [["bad"],["awful"],["dreadful"],["terrible"]]).
sl(right, [["right"],["true"],["legitimate"]]).
sl(wrong, [["wrong"],["false"],["inaccurate"],["mistaken"]]).
sl(approve, [["approve"],["accept"],["respect"]]).
sl(reprove, [["reprove"],["censure"],["condemn"]]).
sl(thank,[["thank", "you"],["thanks"]]).
sl(lthank,[["i", "really", "apreciate", "it"]]).
sl(know,[["know"],["realize"],["notice"],["recognize"]]).
sl(dknow,[
  ["i", "can't", "help", "you", "there"],
  ["i", "do", "not", "know", "that"]]).
sl(nopinion,[
  ["i", "have", "never", "given", "it", "much", "thought"],
  ["i", "do", "not", "have", "an", "opinion", "about", "that"]]).
sl(question,[
  ["how"],["where"],["what"],["why"],["when"],["can"],
  ["do", "you"],["are", "you"]]).
sl([question, greet],[
  ["how", "are", "you"]]).
sl([question, goodbye],[
  ["are", "you", "sure"],
  ["are", "you", "sure", "you", "do", "not", "have", "any", "other", "question"]]).

% Sentence combination
sc([answer, greet],[["i", "am"],X,Y,["for", "asking"]]) :-
  semsin(good, X), semsin(thank, Y).

% Sintax generators
% Top-Down generator
% True when S is a possible combination of words in TDL
topdowngen([],[]).
topdowngen([X|BS], S) :-
  member(W, X), split_string(W, " ", "", W1),
  topdowngen(BS, S1),
  append(W1, S1, S).

% Sentence list generator
% True when S is a sentence in SL
slgen(SL, S) :- member(S, SL).

% Combine semsin generator
% True when S is a sentence combination of sentences
scgen([],[]).
scgen([X|SC], S) :- scgen(SC, S1), append(X, S1, S).

% Semantic-Sintax relations
semsin(S, P) :- tdl(S, TSL), topdowngen(TSL, P), !.
semsin(S, P) :- sl(S, SL), slgen(SL, P), !.
semsin(S, P) :- sc(S, SC), scgen(SC, P), !.

% Relative Semantic-Sintax relations
semsin(repeat(X), [X]).

/* OTHER SEMANTICS USEFUL FOR THE PREDICATE "semantics" in semantic.pl */
% sepecific sentences list
ssl([greet], [["good", "morning"], ["good", "afternoon"],["good", "evening"]]).
ssl([greet, repeat(X)],[["i", "am", X], ["my", "name", "is", X]]).
ssl([question], [["do","you"], ["can","you"]]).

% ssemsin(SS, P), True when P as the semantics of list SS
ssemsin(SS, P) :- ssl(SS, SSL), slgen(SSL, P).
