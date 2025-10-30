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
possesses_one_ring(froddo).
pure_heart(froddo) :- true. 

villain(sauron).
possesses_one_ring(sauron).
pure_heart(sauron) :- false. 

orc(gollum).
possesses_one_ring(gollum).
pure_heart(gollum) :- false.

elf(legolas).
pure_heart(legolas) :- true.
