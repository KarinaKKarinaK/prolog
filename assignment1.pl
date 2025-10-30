fantasy_novel(lord_Of_the_Rings).
film_trilogy(lord_Of_the_Rings).
wrriten_by(j_r_r_Tolkien, lord_Of_the_Rings).
fantasy_writer(j_r_r_Tolkien).

# A being who possesses the One Ring becomes corrupted unless they are of pure heart.
corrupted(X) :- possesses_one_ring(X), \+ pure_heart(X).