This bot's purpose is to help the user in matters related to both music and painting and it has knowledge about some painters and musicians.







Predicate 5 : chat(X)
Chat(X) is the predicate that starts a interactive conversation with the bot.
Once started, the bot will answer the questions that the user gives him using
the predicate runifanswer/2 that gives a random answer to the sentence from the database.
Ex:
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
