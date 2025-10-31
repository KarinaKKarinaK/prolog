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
%elements and Swapped is that list with the order reversed. Example query: ?- swap_pair([x,y], %Z). [4 pts]

swap_pair([X, Y], [Y, X]).

%Query results:
%?- swap_pair([x,y], Z).
%Z = [y, x].

% EXERCISE 6 ==========================================================
1. summer(X):-happy(X). 
2. summer(X):-warm(Y). 
3. warm(Y):-warm(Y). 
4. warm(a). 
5. happy(b).

%For each of the following cases construct a program P such that on query ?-summer(a):
%1. . . . directly runs into an infinite loop without returning any answer. [6 pts]

warm(Y):-warm(Y).
summer(X):-happy(X). 
summer(X):-warm(Y).  
warm(a). 
happy(b).   

% Explanation: Runs infinitely because the rule we placed first, whcih iswarm(Y):-warm(Y). 
causes Prolog to keep calling itself recursively without ever reaching a base case or a 
fact that can actually terminate the recursion

[trace]  ?- summer(a).
   Call: (12) summer(a) ? creep
   Call: (13) happy(a) ? creep
   Fail: (13) happy(a) ? creep
   Redo: (12) summer(a) ? creep
   Call: (13) warm(_16346) ? creep
   Call: (14) warm(_17080) ? creep
   Call: (15) warm(_17080) ? creep
   Call: (16) warm(_17080) ? creep
   Call: (17) warm(_17080) ? creep
   Call: (18) warm(_17080) ? creep
   Call: (19) warm(_17080) ? creep
   Call: (20) warm(_17080) ? creep
   Call: (21) warm(_17080) ? creep
   Call: (22) warm(_17080) ? creep
   Call: (23) warm(_17080) ? creep
   Call: (24) warm(_17080) ? creep
   Call: (25) warm(_17080) ? creep
   Call: (26) warm(_17080) ? creep
   Call: (27) warm(_17080) ? creep
   Call: (28) warm(_17080) ? creep
   Call: (29) warm(_17080) ? creep
   Call: (30) warm(_17080) ? creep
   Call: (31) warm(_17080) ? creep
   Call: (32) warm(_17080) ? creep
   Call: (33) warm(_17080) ? creep
   Call: (34) warm(_17080) ? creep
   Call: (35) warm(_17080) ? creep
   Call: (36) warm(_17080) ? creep
   Call: (37) warm(_100) ? creep
   Call: (38) warm(_100) ? creep
   Call: (39) warm(_100) ? creep
   Call: (40) warm(_100) ? creep
   Call: (41) warm(_100) ? creep
   Call: (42) warm(_100) ? creep
   Call: (43) warm(_100) ? creep
   Call: (44) warm(_100) ? creep
   Call: (45) warm(_100) ? creep
   Call: (46) warm(_100) ? creep
   Call: (47) warm(_100) ? creep
   Call: (48) warm(_100) ? creep
   Call: (49) warm(_100) ? creep
   Call: (50) warm(_100) ? creep
   Call: (51) warm(_100) ? creep
   Call: (52) warm(_100) ? creep
   Call: (53) warm(_100) ? creep
   Call: (54) warm(_100) ? creep
   Call: (55) warm(_100) ? creep
   Call: (56) warm(_100) ? creep
   Call: (57) warm(_100) ? creep
   Call: (58) warm(_100) ? creep
   Call: (59) warm(_100) ? creep
   Call: (60) warm(_100) ? creep
   Call: (61) warm(_100) ? creep
   Call: (62) warm(_100) ? creep
   Call: (63) warm(_100) ? creep
   Call: (64) warm(_100) ? creep
   Call: (65) warm(_100) ? creep
   Call: (66) warm(_100) ? creep
   Call: (67) warm(_100) ? creep
   Call: (68) warm(_100) ? creep
   Call: (69) warm(_100) ? creep
   Call: (70) warm(_100) ? creep
   Call: (71) warm(_100) ? creep
   Call: (72) warm(_100) ? creep
   Call: (73) warm(_100) ? creep
   Call: (74) warm(_100) ? creep
   Call: (75) warm(_100) ? creep
   Call: (76) warm(_100) ? creep
   Call: (77) warm(_100) ? creep
   Call: (78) warm(_100) ? creep
   Call: (79) warm(_100) ? creep
   Call: (80) warm(_100) ? creep
   Call: (81) warm(_100) ? creep
   Call: (82) warm(_100) ? creep
   Call: (83) warm(_100) ? creep
   Call: (84) warm(_100) ? creep
   Call: (85) warm(_100) ? creep
   Call: (86) warm(_100) ? creep
   Call: (87) warm(_100) ? creep
   Call: (88) warm(_100) ? creep
   Call: (89) warm(_100) ? creep
   Call: (90) warm(_100) ? creep
   Call: (91) warm(_100) ? creep
   Call: (92) warm(_100) ? creep
   Call: (93) warm(_100) ? creep
   Call: (94) warm(_100) ? creep
   Call: (95) warm(_100) ? creep
   Call: (96) warm(_100) ? creep
   Call: (97) warm(_100) ? creep
   Call: (98) warm(_100) ? creep
   Call: (99) warm(_100) ? creep
   Call: (100) warm(_100) ? creep
   Call: (101) warm(_100) ? 

% 2. . . . returns infinitely often the answer ‘true’. [6 pts]
warm(a). 
happy(b). 
summer(X):-warm(Y). 
summer(X):-happy(X). 
warm(Y):-warm(Y). 

% Explanation: This runs infinitely true because we first define warm(a) and warm (b) which is then 
used to satisfy the summer(X):-warm(Y). rule, which then leads to warm(Y):-warm(Y). being called
infinitely many times, each time returning warm(a) and warm(b) as valid answers for warm(Y). which 
then leads to summer(X) being true infinitely many times. So thsi arrangement  of clauses 
will cause Prolog to run infinitely often returning the answer true.


[trace]  ?- summer(a).
   Call: (12) summer(a) ? creep
   Call: (13) warm(_26898) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true ;
   Redo: (13) warm(_30812) ? creep
   Call: (14) warm(_31546) ? creep
   Exit: (14) warm(a) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true ;
   Redo: (14) warm(_31546) ? creep
   Call: (15) warm(_31546) ? creep
   Exit: (15) warm(a) ? creep
   Exit: (14) warm(a) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true ;
   Redo: (15) warm(_31546) ? creep
   Call: (16) warm(_31546) ? creep
   Exit: (16) warm(a) ? creep
   Exit: (15) warm(a) ? creep
   Exit: (14) warm(a) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true ;
   Redo: (16) warm(_31546) ? creep
   Call: (17) warm(_31546) ? creep
   Exit: (17) warm(a) ? creep
   Exit: (16) warm(a) ? creep
   Exit: (15) warm(a) ? creep
   Exit: (14) warm(a) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true ;
   Redo: (17) warm(_31546) ? creep
   Call: (18) warm(_31546) ? creep
   Exit: (18) warm(a) ? creep
   Exit: (17) warm(a) ? creep
   Exit: (16) warm(a) ? creep
   Exit: (15) warm(a) ? creep
   Exit: (14) warm(a) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true ;
   Redo: (18) warm(_31546) ? creep
   Call: (19) warm(_31546) ? creep
   Exit: (19) warm(a) ? creep
   Exit: (18) warm(a) ? creep
   Exit: (17) warm(a) ? creep
   Exit: (16) warm(a) ? creep
   Exit: (15) warm(a) ? creep
   Exit: (14) warm(a) ? creep
   Exit: (13) warm(a) ? creep
   Exit: (12) summer(a) ? creep
true 