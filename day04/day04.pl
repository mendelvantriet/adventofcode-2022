:- consult(input).

main() :-
  findall(input(Assignment1,Assignment2), input(Assignment1,Assignment2), Bag),
  assignments_to_lists(Bag, Pairs),
  fully_containing_assignment_pairs(Pairs, ContainingPairs),
  proper_length(ContainingPairs, Length),
  print(Length).

assignments_to_lists([], []).
assignments_to_lists([input(assignment(B1, E1), assignment(B2, E2))|T], [pair(List1, List2)|T2]) :-
  range(B1, E1, List1),
  range(B2, E2, List2),
  assignments_to_lists(T, T2).

range(End, End, [End]).
range(Begin, End, [Begin|T]) :-
  Next is Begin + 1,
  range(Next, End, T).

fully_containing_assignment_pairs([], []).
fully_containing_assignment_pairs([pair(A1, A2)|T], [pair(A1, A2)|T2]) :-
  fully_contains(A1, A2),
  fully_containing_assignment_pairs(T, T2).

fully_containing_assignment_pairs([_|T], T2) :-
  fully_containing_assignment_pairs(T, T2).

fully_contains(List1, List2) :-
  subset(List1, List2).
fully_contains(List1, List2) :-
  subset(List2, List1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%

main2() :-
  findall(input(Assignment1,Assignment2), input(Assignment1,Assignment2), Bag),
  assignments_to_lists(Bag, Pairs),
  overlapping_pairs(Pairs, OverlappingPairs),
  proper_length(OverlappingPairs, Length),
  print(Length).

overlapping_pairs([], []).

overlapping_pairs([pair(A1, A2)|T], [pair(A1, A2)|T2]) :-
  overlapping(A1, A2),
  overlapping_pairs(T, T2).

overlapping_pairs([_|T], T2) :-
  overlapping_pairs(T, T2).

overlapping(A, B) :-
  intersection(A, B, Intersection),
  proper_length(Intersection, L),
  L > 0.

