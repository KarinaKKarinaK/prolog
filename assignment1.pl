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

% 1. We can only state the difference between the two clauses only after we defined them, so the chnage that 
% made it work wasn putting teh comparison statement after both X and Y have been defined.

% mammal(dog).
% mammal(cat).
% bird(eagle).
% bird(parrot).
% same_species(X, Y) :- mammal(X), mammal(Y), not(Y = X).
% same_species(X, Y) :- bird(X), bird(Y), not(Y = X).

% We have changed the order of statements, putting the comparison statement at the end of each clause. 
% So that now not(Y = X). is evaluated after both X and Y have been defined.
% This way, Prolog can now correctly determine if X and Y are different after they have been assigned 
% values which is why the query can now run correctly and give the appropriate answer.

%Draw the search tree for the call same_species(dog, A). (from the adapted knowledge base
%after completing Exercise 2.2). For drawing the tree, an ASCII representation in Prolog code is
%acceptable. [6 pts]

% [trace]  ?-  same_species(dog, A).
%   Call: (12) same_species(dog, _33522) ? creep
%   Call: (13) mammal(dog) ? creep
%   Exit: (13) mammal(dog) ? creep
%   Call: (13) mammal(_33522) ? creep
%   Exit: (13) mammal(dog) ? creep
%^  Call: (13) not(dog=dog) ? creep
%^  Fail: (13) not(user:(dog=dog)) ? creep
%   Redo: (13) mammal(_33522) ? creep
%   Exit: (13) mammal(cat) ? creep
%^  Call: (13) not(cat=dog) ? creep
%^  Exit: (13) not(user:(cat=dog)) ? creep
%   Exit: (12) same_species(dog, cat) ? creep
%A = cat ;
%   Redo: (12) same_species(dog, _33522) ? creep
%   Call: (13) bird(dog) ? creep
%   Fail: (13) bird(dog) ? creep
%   Fail: (12) same_species(dog, _33522) ? creep
%false.

% The current search order within the rules may still cause unnecessary backtracking, especially
% when variables are uninstantiated. Reorder the goals *within each rule* (not the rules themselves)
% to make the program more efficient, and explain why this change improves performance. [5 pts]

mammal(cat).
mammal(dog).
bird(eagle).
bird(parrot).
same_species(X, Y) :- mammal(X), mammal(Y), not(X = Y).
same_species(X, Y) :- bird(X), bird(Y), not(X = Y ).

%[trace]  ?- same_species(dog, A).
%   Call: (12) same_species(dog, _8374) ? creep
%   Call: (13) mammal(dog) ? creep
%   Exit: (13) mammal(dog) ? creep
%   Call: (13) mammal(_8374) ? creep
%   Exit: (13) mammal(cat) ? creep
%^  Call: (13) not(cat=dog) ? creep
%^  Exit: (13) not(user:(cat=dog)) ? creep
%   Exit: (12) same_species(dog, cat) ? creep
% A = cat ;

% [trace]  ?- same_species(dog, A).
%    Call: (12) same_species(dog, _34562) ? creep
%    Call: (13) mammal(dog) ? creep
%    Exit: (13) mammal(dog) ? creep
%    Call: (13) mammal(_34562) ? creep
%    Exit: (13) mammal(cat) ? creep
% ^  Call: (13) not(dog=cat) ? creep
% ^  Exit: (13) not(user:(dog=cat)) ? creep
%    Exit: (12) same_species(dog, cat) ? creep
% A = cat ;
%    Redo: (13) mammal(_34562) ? creep
%    Exit: (13) mammal(dog) ? creep
% ^  Call: (13) not(dog=dog) ? creep
% ^  Fail: (13) not(user:(dog=dog)) ? creep
%    Redo: (12) same_species(dog, _34562) ? creep
%    Call: (13) bird(dog) ? creep
%    Fail: (13) bird(dog) ? creep
%    Fail: (12) same_species(dog, _34562) ? creep
% false.

% EXERCISE 5 ==========================================================
% Define a predicate first_two(List, X, Y) that succeeds when X and Y are the first two
% elements of List. Example query: ?- first_two([a,b,c,d], X, Y). [4 pts]

first_two([X, Y|_], X, Y).

% Query results:
%?- first_two([a,b,c,d], X, Y). 
%X = a,
%Y = b.

% Define a predicate last_two(List, X, Y) that succeeds when X and Y are the last two elements
% of a list of exactly four elements. Example query: ?- last_two([a,b,c,d], X, Y). [4 pts]

last_two([_, _, X, Y], X, Y).

%The query results:
%?- last_two([a,b,c,d], X, Y).
%X = c,
%Y = d.

% Define a predicate split_string(StringList, Prefix, Suffix) that succeeds when StringList
% is composed of two sublists, the first of length two (Prefix) and the rest (Suffix). Example
% query: ?- split_string([h,e,l,l,o], P, S). [4 pts]

split_string([X, Y | Suffix], [X, Y], Suffix).

% The query results:
%?- split_string([h,e,l,l,o], P, S).
%P = [h, e],
%S = [l, l, o].

%Define a predicate swap_pair(Pair, Swapped) that succeeds when Pair is a list of exactly two
%elements and Swapped is that list with the order reversed. Example query: ?- swap_pair([x,y],
%Z). [4 pts]