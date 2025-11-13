
on(b, a).
on(c, b).
on(d, c).
above(X, Y) :- on(X, Y).
above(X, Y) :- on(X, Z), above(Z, Y).

% Exercise 2.1

% Exercise 2.2
atLeastThree(X) :- on(Y, X), on(Z, Y), on(_, Z).