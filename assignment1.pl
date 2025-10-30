#  EXERCISE 1 ==========================================================
fantasy_novel(lord_Of_the_Rings).
film_trilogy(lord_Of_the_Rings).
wrriten_by(j_r_r_Tolkien, lord_Of_the_Rings).
fantasy_writer(j_r_r_Tolkien).

# A being who possesses the One Ring becomes corrupted unless they are of pure heart.
# (Write a rule with head corruptionCheck/2, returning true if the being remains uncorrupted and
# false otherwise.)
corruptionCheck(X) :- possesses_one_ring(X), \+ pure_heart(X).
# if corruptionCheck(X) is True it means X is corrupted

# A being who resists corruption may carry the Ring safely only if they do not use its power. [5
# pts] (Write a rule with head safeBearer/2, returning true if the being can safely bear the Ring
# and false otherwise; assume the rule is appended to the knowledge base that already includes
# corruptionCheck/2.)
safeBearer(X) :- \+ corruptionCheck(X).

# A being may destroy the Ring at mount Doom only if they are a safe bearer. [5 pts] (Write a rule
# with head canDestroy/2, returning true if the being can destroy the Ring and false otherwise;
# assume the rule is appended to the knowledge base that already includes the other two rules.)
canDestroy(X) :- safeBearer(X)

#  EXERCISE 2 ==========================================================
# Extend the knowledge base created in the previous exercise with facts accompanying the Lord of the
# Ring rules (i.e. the rules you written for 4 - 6 of Exercise 1). You are free to choose facts and the
# atoms of your choice, as long as the predicates could be matched. Include your queries and their results
# as a comment.
hobbit(froddo).
possesses_one_ring(froddo).
pure_heart(froddo) :- true. # has pure heart

villain(sauron).
possesses_one_ring(sauron).
pure_heart(sauron) :- false. # sauron is not of pure heart

orc(gollum).
possesses_one_ring(gollum).
pure_heart(gollum) :- false. # gollum is not of pure heart 

elf(legolas).
pure_heart(legolas) :- true. # legolas has pure heart

