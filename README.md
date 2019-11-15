Predicate 1: answers(S, AS)
  The argument S is a sentence in the form of
    [atom1, atom2|Atoms] or ["word1", "word2"|Words]
  The argument AS is a list of all answers in the form
    [ans(Phrase, Score), ...]

example:
  answers(["hello"],[ans(["hello"], 0), ans(["hi"], 0)|Answers).

% Predicate 2 : bestanswer(S, A)
    The argument S is a sentence in the form of
      [atom1, atom2|Atoms] or ["word1", "word2"|Words]
    The argument A is the answer with the highest score

example:
  bestanswer(["hello"],ans(["hello", "it", "is", "good", "to", "meet", "you"], 0.8571428571428572)).

% Predicate 3 : runifanswer(S, A)
  The argument S is a sentence in the form of
    [atom1, atom2|Atoms] or ["word1", "word2"|Words]
  The argument A is a random answer based on uniform distribution

example:
  runifanswer(["hello"],ans(["hello"], 0)).

% Predicate 4 : rpropanswer(S, A)
  The argument S is a sentence in the form of
    [atom1, atom2|Atoms] or ["word1", "word2"|Words]
  The argument A is a random answer  taking into account the values of the scores

example:
  rpropanswer(["hello"],ans(["hi", "it", "is", "good", "to", "see", "you"], 0.8571428571428572)).
