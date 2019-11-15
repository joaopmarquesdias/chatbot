This bot's purpose is to help the user in matters related to both music and painting and it has knowledge about some painters and musicians.
The bot can be loaded by typing ['chatbot.pl']. in swipl environment.

Predicate 1: answers(S, AS)
  The argument S is a sentence in the form of
    [atom1, atom2|Atoms] or ["word1", "word2"|Words]
  The argument AS is a list of all answers in the form
    [ans(Phrase, Score), ...]
example:
  answers(["hello"],[ans(["hello"], 0), ans(["hi"], 0)|Answers).

Predicate 2 : bestanswer(S, A)
    The argument S is a sentence in the form of
      [atom1, atom2|Atoms] or ["word1", "word2"|Words]
    The argument A is the answer with the highest score
example:
  bestanswer(["hello"],ans(["hello", "it", "is", "good", "to", "meet", "you"], 0.8571428571428572)).

Predicate 3 : runifanswer(S, A)
  The argument S is a sentence in the form of
    [atom1, atom2|Atoms] or ["word1", "word2"|Words]
  The argument A is a random answer based on uniform distribution
example:
  runifanswer(["hello"],ans(["hello"], 0)).

Predicate 4 : rpropanswer(S, A)
  The argument S is a sentence in the form of
    [atom1, atom2|Atoms] or ["word1", "word2"|Words]
  The argument A is a random answer  taking into account the values of the scores
example:
  rpropanswer(["hello"],ans(["hi", "it", "is", "good", "to", "see", "you"], 0.8571428571428572)).

Predicate 5 : chat(X)
  Chat(X) is the predicate that starts a interactive conversation with the bot.
  Once started, the bot will answer the questions that the user gives him using
  the predicate runifanswer/2 that gives a random answer to the sentence from the database.
example:
  chat(X).
  Hello my name is joão
  Bot: hello it is nice to meet you joão

Predicate 6 : stats(H)
  The argument H is a conversation in the form of the history created by de chat/1.
  The history is in the form h([sentence|Sentences],[ans(Answer,Score)|Ans]).
  The stats prints details about the conversation such as :
     number of interventions
     total number of words in the conversation
     average number of words in each intervention
     10 most frequently used words
  The best way to use stats/1 is to call chat(H), stats(H). in the
  command line and when the conversation ends the stats will be printed.