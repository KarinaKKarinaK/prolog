% EXERCISE 1 ==========================================================
fantasy_novel(lord_Of_the_Rings).
film_trilogy(lord_Of_the_Rings).
written_by(j_r_r_Tolkien, lord_Of_the_Rings).
fantasy_writer(j_r_r_Tolkien).

corruptionCheck(X) :- possesses_one_ring(X), \+ pure_heart(X).

safeBearer(X) :- \+ corruptionCheck(X).

canDestroy(X) :- safeBearer(X).

% EXERCISE 2 ==========================================================

hobbit(froddo).
hobbit(bilbo).
villain(sauron).
orc(gollum).
elf(legolas).

possesses_one_ring(R) :- hobbit(R); orc(R); villain(R).
pure_heart(R) :- hobbit(R); elf(R).

% queries
% ?- corruptionCheck(froddo).
% false.
% ?- corruptionCheck(sauron).
% true.
% ?- corruptionCheck(elf).
% false.
% safeBearer(hobbit).
% true.
% canDestroy(hobbit).
% true.


% EXERCISE 3 ==========================================================

% 1. false
% 2. true, Ring = power
% 3. false
% 4. true, X = a, Y = b, Z = c
% 5. true, X = layer(a), Y = b, Z = c
% 6. true, X = 3+4
% 7. false
% 8. true, none because there are no variables in the query
% 9. true, none because there are no variables in the query
% 10. true, Z = 10 and 10 =:= 10
% 11. true, none because there are no variables in the query
% 12. true, C = 5

% EXERCISE 4 ==========================================================

% 1. The call same_species(dog, A). will fail because not is expressed as \+ in prolog, not as not().

mammal(dog).
mammal(cat).
bird(eagle).
bird(parrot).
same_species(X, Y) :- mammal(X), mammal(Y), \+(Y = X).
same_species(X, Y) :- bird(X), bird(Y), \+(Y = X).

%Draw the search tree for the call same_species(dog, A). (from the adapted knowledge base
%after completing Exercise 2.2). For drawing the tree, an ASCII representation in Prolog code is
%acceptable. [6 pts]

% 1. We can only state the difference between the two clauses only after we defined them.
