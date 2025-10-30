#  EXERCISE 1 ==========================================================
fantasy_novel(lord_Of_the_Rings).
film_trilogy(lord_Of_the_Rings).
wrriten_by(j_r_r_Tolkien, lord_Of_the_Rings).
fantasy_writer(j_r_r_Tolkien).

# A being who possesses the One Ring becomes corrupted unless they are of pure heart.
# (Write a rule with head corruptionCheck/2, returning true if the being remains uncorrupted and
# false otherwise.)
corruptionCheck(X, false) :- possesses_one_ring(X), \+ pure_heart(X).
corruptionCheck(X, true) :- \+ possesses_one_ring(X).

# A being who resists corruption may carry the Ring safely only if they do not use its power. [5
# pts] (Write a rule with head safeBearer/2, returning true if the being can safely bear the Ring
# and false otherwise; assume the rule is appended to the knowledge base that already includes
# corruptionCheck/2.)

