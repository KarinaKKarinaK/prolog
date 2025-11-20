midrange([H|T], M) :- 
    midrange_helper(T, H, H, Mid),
    M is (Mid).

midrange_helper([], Min, Max, Mid) :-
    Mid is (Min + Max) // 2.

midrange_helper([H|T], CurrMin, CurrMax, Mid) :-
    NewMin is min(CurrMin, H),
    NewMax is max(CurrMax, H),
    midrange_helper(T, NewMin, NewMax, Mid).