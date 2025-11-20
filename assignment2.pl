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

exactlyThreeTower(X) :-
    tower(L),
    L = [X|_],
    length(L, 2).

% Exercise 3 ==============================================
The predicate xyz/3 and splits the list L into two lists (A and B) using a helper
predicate, xy/4, and here when these lists are combined in a specific way with recursion,
the elements get reordered or split according to the pattern defined in the recursion. 
xyz/3 decomposes the first list into two lists (A and B), where xy/4b is in charge of the 
matching and building of these lists by adding the elements to the front.
The recursion goes on by taking the "head" of L and managing the rearrangements until 
the entire list is processed into A and B.

% Exercise 4 ==============================================

square(X, Y) :- Y is X * X.

balance(A,B,C) :-
    permutation(A,BC),
    append(B,C,BC),
    sum_squares(B,SumB),
    sum_squares(C,SumC),
    SumB = SumC.

sum_squares(List,Sum) :-
    maplist(square,List,Squares),
    sum_list(Squares,Sum).

% Exercise 5 ==============================================
midrange([H|T], M) :- 
    midrange_helper(T, H, H, Mid),
    M is (Mid).

midrange_helper([], Min, Max, Mid) :-
    Mid is (Min + Max) // 2.

midrange_helper([H|T], CurrMin, CurrMax, Mid) :-
    NewMin is min(CurrMin, H),
    NewMax is max(CurrMax, H),
    midrange_helper(T, NewMin, NewMax, Mid).

% Exercise 6 ==============================================
album("Abbey Road",[artist("Lennon","John"),artist("McCartney","Paul")],
[genre("rock")],17,47,10).

album("Thriller",[artist("Jackson","Michael")],[genre("pop"),genre("funk")],9,42,9).
album("Random Access Memories",[artist("Daft","Guy-Manuel"),artist("Daft","Thomas")],
[genre("electronic")],13,74,8).

album("The Dark Side of the Moon",[artist("Waters","Roger"),artist("Gilmour","David")],
[genre("progressive rock")],10,43,10).

% Exercise 6.1
allAlbumTitles(L) :- findall(Title, album(Title, _, _, _, _, _), L).

% Exercise 6.2
A = ["Abbey Road", "Thriller", "Random Access Memories", "The Dark Side of the Moon"].

allAlbumTitlesSorted(Sorted) :-
    allAlbumTitles(L),
    sort(L, Sorted).

% Exercise 6.3
albumsByGenre(Genre, L) :-
    findall(Title,
        (album(Title, _, Genres, _, _, _), member(Genre, Genres)),
        L).

% ?- albumsByGenre(genre("rock"), L).
% L = ["Abbey Road"].

% Exercise 6.4
% albumsByRating(AlbumList,SortedTitles)
% succeeds if SortedTitles contains all album titles in AlbumList sorted by rating (highest first)
% so basically this sorts a list of albums by their rating, with teh highest first

albumsByRating(AlbumList, SortedTitles) :-
    findall(NegRating-Title, (
        member(Title, AlbumList),
        album(Title, _, _, _, _, Rating),
        NegRating is -Rating
    ), Pairs),
    keysort(Pairs, SortedNegPairs),
    pairs_values(SortedNegPairs, SortedTitles).

% Running the query
% ?- allAlbumTitlesSorted(A), albumsByRating(A, Sorted).
% A = ["Abbey Road", "Random Access Memories", "The Dark Side of the Moon", "Thriller"],
% Sorted = ["Abbey Road", "The Dark Side of the Moon", "Thriller", "Random Access Memories"].

% ?- allAlbumTitles(L), albumsByRating(L, Sorted).
% L = ["Abbey Road", "Thriller", "Random Access Memories", "The Dark Side of the Moon"],
% Sorted = ["Abbey Road", "The Dark Side of the Moon", "Thriller", "Random Access Memories"].

% ?- allAlbumTitles(L), albumsByRating(L, Sorted).
% L = ["Abbey Road", "Thriller", "Random Access Memories", "The Dark Side of the Moon"],
% Sorted = ["Abbey Road", "The Dark Side of the Moon", "Thriller", "Random Access Memories"].

% Exercise 6.5

countAlbumsByGenre(AlbumList,Genre,Count) :-
    findall(Name, (member(Name, AlbumList), album(Name, _, Genres, _, _, _), member(Genre, Genres)), Albums),
    length(Albums, Count).