% Exercise 1 ==============================================

bike(library, cafeteria, 3).
bike(cafeteria, main_gate, 2).
bike(lab_building, library, 4).
walk(main_gate, admin_office, 5).
walk(library, lecture_hall, 6).
walk(lecture_hall, lab_building, 7).

% Exercise 1.1
route_by_bike(F, T) :- bike(F, T, _).

% Exercise 1.2
route(F, T) :- bike(F, T, _) ; walk(F, T, _).

% Exercise 1.3
route(F, T, M) :- bike(F, T, M).
route(F, T, M) :- walk(F, T, M).

route(F, T, M) :-
    bike(F, X, M1),
    route(X, T, M2),
    M is M1 + M2.

route(F, T, M) :-
    walk(F, X, M1),
    route(X, T, M2),
    M is M1 + M2.

% routes(lab_building, lecture_hall, 10).

% Exercise 2 ==============================================

on(b, a).
on(c, b).
above(X, Y) :- on(X, Y).
above(X, Y) :- on(X, Z), above(Z, Y).

% Exercise 2.1
on(b, a).
on(c, b).
above(X, Y) :- on(X, Y).
above(X, Y) :- on(X, Z), above(Z, Y).

% ?- above(X, Y).
% X = b,
% Y = a .

% Exercise 2.2
atLeastThree(X) :-
    on(X, Y),    
    on(Y, Z),  
    on(Z, _). 

% atLeastThree(d).
% true.

% Exercise 2.3
atLeastThree_2(X) :- 
    setof(Y, above(X, Y), Ys), 
    length(Ys, L),
    L >= 3.

% atLeastThree_2(d).
% true.

% Exercise 2.4

on(a,b).
on(b,c).
on(c,d).
on(d,e).
on(e,table).
tower([X]) :- on(X,table).
tower([X,Y|T]) :- on(X,Y), tower([Y|T]).

exactlyThreeTower(X) :- tower(T), length(T, 4), on(X, table), on(X, T).

% Exercise 3 ==============================================

% Exercise 4 ==============================================

% Exercise 5 ==============================================

% Exercise 6 ==============================================

% Exercise 6.1

% Exercise 6.2

% Exercise 6.3

% Exercise 6.4

% Exercise 6.5