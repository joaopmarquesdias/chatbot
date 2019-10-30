# chatbot
Brief description of the algorithm
1. [SI]  is the input sentence
2. [SM]  is the list of base semantics in [SI]              % analyze patterns, keywords and combinations of them
3. [NSM] is the normalized list of [SM]                     % analyze semantic combinations, patterns, reduce, replace...
4. [AS]  is the list of all possible answers based on [NSM] % use semsin and append
5. [AAS] is the list of analyzed answers of [AS]            % we give them scores, based on repetition, length...
6. [A]   is the answer with the best score from [AAS]
7. [A]   is the output sentence

# DOCUMENTATION
**database.pl**
semval(X)
> True when X is a semantic value

semsin(S, P)
> True when P is a syntactic phrase with semantic S

The predicates that "store" syntactic objects are
'''
tdl (Top-Down list)
sl  (Sentence list)
sc  (Sentence combination)
'''

The predicates that generate sentences are
'''
topdowngen
slgen
scgen
'''

**semantic.pl**
(...)
