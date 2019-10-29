# chatbot
Brief description of the algorithm
1. [SI]  is the input sentence
2. [SM]  is the list of base semantics in [SI]              % analyze patterns, keywords and combinations of them
3. [NSM] is the normalized list of [SM]                     % analyze semantic combinations, patterns, reduce, replace...
4. [AS]  is the list of all possible answers based on [NSM] % use semsin and append
5. [AAS] is the list of analyzed answers of [AS]            % we give them scores, based on repetition, length...
6. [A]   is the answer with the best score from [AAS]
7. [A]   is the output sentence

                           ***predicados de database.pl***

semval(X) - é verdade quando X é um valor semantico
antonyms(X, Y) - é verdade quando o valor semantico de X é contrario ao de Y
***Ver a utilidade destes dois predicados***
singen(SEM, SIN) - é verdade quando SIN é uma sintaxe que respeita o valor semantico de SEM
semsin(SEM, SIN) - é verdade quando SIN é uma sintaxe que respeita o valor semantico de SEM

                          ***predicados de semantic.pl***
