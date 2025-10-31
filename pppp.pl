% mammal(dog).
% mammal(cat).
% bird(eagle).
% bird(parrot).
% same_species(X, Y) :- mammal(X), mammal(Y), not(Y = X).
% same_species(X, Y) :- bird(X), bird(Y), not(Y = X).