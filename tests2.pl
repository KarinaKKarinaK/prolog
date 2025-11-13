bike(library, cafeteria, 3).
bike(cafeteria, main_gate, 2).
bike(lab_building, library, 4).
walk(main_gate, admin_office, 5).
walk(library, lecture_hall, 6).
walk(lecture_hall, lab_building, 7).

route_by_bike(F, T) :- bike(F, T, _).

route(F, T) :- bike(F, T, _) ; walk(F, T, _).

% route(library, lecture_hall).
% route(library, main_gate).