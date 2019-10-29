% Make sure S1 and S2 are lists of words and a word is a string
% True if S1 and S2 are synonyms
synonyms(S1,S2) :- semsin(X, S1), semsin(X, S2).
