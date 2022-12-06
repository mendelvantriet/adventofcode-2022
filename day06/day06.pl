:- consult(input).

main() :-
  findall(input(Position, Character), input(Position, Character), Bag),
  marker_position(Bag, Position),
  print(Position).

marker_position([I1,I2,I3,I4|_], Position) :-
  marker([I1,I2,I3,I4], Position).

marker_position([_|T], Position) :-
  marker_position(T, Position).

marker([input(_,C1), input(_,C2), input(_,C3), input(Position,C4)], Position) :-
  list_to_set([C1, C2, C3, C4], Set),
  same_length([C1, C2, C3, C4], Set).


%%%%%%%%%%%%%%%%%%%%%%%%%%%

main2() :-
  findall(input(Position, Character), input(Position, Character), Bag),
  message_marker_position(Bag, Position),
  print(Position).

message_marker_position(Input, Position) :-
  take(14, Input, Sequence),
  message_marker(Sequence, Position).

message_marker_position([_|T], Position) :-
  message_marker_position(T, Position).

take(1, [H|_], [H]).
take(N, [H|T], [H|R]) :-
  N > 1, !,
  M is N - 1,
  take(M, T, R).

message_marker(Sequence, Position) :-
  proper_length(Sequence, 14),
  raw_sequence(Sequence, Raw),
  list_to_set(Raw, Set),
  same_length(Raw, Set),
  last(Sequence, input(Position, _)).

raw_sequence([], []).
raw_sequence([input(_, C)|T], [C|T2]) :-
  raw_sequence(T, T2).

