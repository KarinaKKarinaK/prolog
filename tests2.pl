bike(library, cafeteria, 3).
bike(cafeteria, main_gate, 2).
bike(lab_building, library, 4).
walk(main_gate, admin_office, 5).
walk(library, lecture_hall, 6).
walk(lecture_hall, lab_building, 7).

route_by_bike(F, T) :- bike(F, T, _).

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
