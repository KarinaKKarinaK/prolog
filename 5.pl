album("Abbey Road",[artist("Lennon","John"),artist("McCartney","Paul")],
[genre("rock")],17,47,10).

album("Thriller",[artist("Jackson","Michael")],[genre("pop"),genre("funk")],9,42,9).

album("Random Access Memories",[artist("Daft","Guy-Manuel"),artist("Daft","Thomas")],
[genre("electronic")],13,74,8).

album("The Dark Side of the Moon",[artist("Waters","Roger"),artist("Gilmour","David")],
[genre("progressive rock")],10,43,10).

allAlbumTitles(L) :- findall(Title, album(Title, _, _, _, _, _), L).
A = ["Abbey Road", "Thriller", "Random Access Memories", "The Dark Side of the Moon"].
allAlbumTitlesSorted(Sorted) :-
    allAlbumTitles(L),
    sort(L, Sorted).

albumsByGenre(Genre, L) :-
    findall(Title,
        (album(Title, _, Genres, _, _, _), member(Genre, Genres)),
        L).

albumsByRating(AlbumList,SortedTitles) :-
    findall(Rating-Title, (
        member(Title, AlbumList),
        album(Title, _, _, _, _, Rating)
    ), Pairs),
    sort(0, @>=, Pairs, SortedPairs),        
    pairs_values(SortedPairs, SortedTitles).