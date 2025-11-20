album("Abbey Road",[artist("Lennon","John"),artist("McCartney","Paul")],
[genre("rock")],17,47,10).

album("Thriller",[artist("Jackson","Michael")],[genre("pop"),genre("funk")],9,42,9).
album("Random Access Memories",[artist("Daft","Guy-Manuel"),artist("Daft","Thomas")],
[genre("electronic")],13,74,8).

album("The Dark Side of the Moon",[artist("Waters","Roger"),artist("Gilmour","David")],
[genre("progressive rock")],10,43,10).

allAlbumTitles(L) :- findall(Title, album(Title, _, _, _, _, _), L).
