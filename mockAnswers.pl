:-use_module(library(lists)).


% child_mother(C, M) means C is a child of mother M.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

child_mother(amy, mary).
child_mother(arthur, mary).
child_mother(angel, jane).
child_mother(anton, rita).
child_mother(alan, rita).
child_mother(axel, susan).
child_mother(ann, tina).    


% age(C, A) means C is of age A.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

age(amy, 6).
age(arthur, 15).
age(angel, 16).
age(anton, 4).
age(alan, 8).
age(axel, 16).
age(ann, 4).

% employed(X) means X is employed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

employed( susan).
employed(rita).


%1i
%child is 14 or younger
%unemployed, child is older than 14 but younger than 16
ecb(M) :-
	child_mother(C, M),
	age(C, A),
	A < 14.
ecb(M) :-
	child_mother(C, M),
	age(C, A),
	A > 14,
	A < 16,
	\+employed(M).

%1ii - I found this tricky, had to consult the answer
mother_of_the_youngest(M):-
	setof(A/M, C^(child_mother(C, M), age(C, A)), Set),
	Set = [A/M|_].
	
%1iii
young_child_mother(C, M) :-
	child_mother(C, M),
	age(C, A),
	A =< 10.
mothers_of_young(LM) :-
	setof(M, C^young_child_mother(C, M), LM).

%2i
merge([], [], []).
merge([H1|L1], [H2|L2], [H1, H2|L]) :-
	merge(L1, L2, L).

%2ii
findElement(1, [E|_], E).
findElement(N, [_|L], E) :-
	N1 is (N - 1),
	findElement(N1, L, E).