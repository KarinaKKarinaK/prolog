% EXERCISE 1 ==========================================================
fantasy_novel(lord_Of_the_Rings).
film_trilogy(lord_Of_the_Rings).
written_by(j_r_r_Tolkien, lord_Of_the_Rings).
fantasy_writer(j_r_r_Tolkien).

corruptionCheck(X) :- possesses_one_ring(X), \+ pure_heart(X).

safeBearer(X) :- \+ corruptionCheck(X).

canDestroy(X) :- safeBearer(X)

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