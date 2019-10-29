% TODO: implement [know, X], [opinion, X] and [answer, X] semantics

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
semval(dknow).
semval(nopinion).
semval(question).

% Complex semantic values
semval([question, greet]).
semval([question, goodbye]).
%semval([know, X]).
%semval([opinion, X]).
%semval([answer, X]).

% Relative semantic value
rsemval(repeat(_)).

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
sl(thank,[
  ["i", "really", "apreciate", "it"],
  ["thank", "you"],["thanks"]]).
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
semsin(i, S)         :- sl(i, TDL), slgen(TDL, S).
semsin(you, S)       :- sl(you, TDL), slgen(TDL, S).
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
semsin(lgreet, S)    :- semsin(greet, S1), tdl(lgreet, TDL),
  topdowngen(TDL, S2), append(S1, S2, S).
semsin(thank, S)     :- sl(thank, SL), slgen(SL, S).
semsin(dknow, S)     :- sl(dknow, SL), slgen(SL, S).
semsin(nopinion, S)  :- sl(nopinion, SL), slgen(SL, S).
semsin(question, S)  :- sl(question, SL), slgen(SL, S).
semsin([question, greet], S)   :- sl([question, greet], SL), slgen(SL, S).
semsin([question, goodbye], S) :- sl([question, goodbye], SL), slgen(SL, S).

% Relative Semantic-Sintax relations
rsemsin(repeat(X), X).
