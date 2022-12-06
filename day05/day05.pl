:- consult(stacks).
:- consult(moves).

main() :-
  findall(stack(StackNr, Stack), stack(StackNr, Stack), StacksBag),
  findall(move(Count, From, To), move(Count, From, To), MovesBag),
  move_crates(MovesBag, StacksBag, FinalState),
  top_crates(FinalState, Crates),
  print(Crates).

move_crates([], Stacks, Stacks).
move_crates([Move|T], Before, After) :-
  do_move(Move, Before, Next),
  move_crates(T, Next, After).

do_move(move(0, _, _), Stacks, Stacks).
do_move(move(Count, From, To), Before, After) :-
  move_from(From, Before, Next, Crate),
  move_to(Crate, To, Next, Next2),
  MinusOne is Count - 1,  
  do_move(move(MinusOne, From, To), Next2, After).

move_from(From, [stack(From, [Crate|Rest])|T], [stack(From, Rest)|T], Crate).
move_from(From, [H|T], [H|T2], Crate) :-
  move_from(From, T, T2, Crate).

move_to(Crate, To, [stack(To, Stack)|T], [stack(To, [Crate|Stack])|T]).
move_to(Crate, To, [H|T], [H|T2]) :-
  move_to(Crate, To, T, T2).

top_crates([], []).
top_crates([stack(_, [Crate|_])|T], [Crate|T2]) :-
  top_crates(T, T2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%

main2() :-
  findall(stack(StackNr, Stack), stack(StackNr, Stack), StacksBag),
  findall(move(Count, From, To), move(Count, From, To), MovesBag),
  move_multiple_crates(MovesBag, StacksBag, FinalState),
  top_crates(FinalState, Crates),
  print(Crates).

move_multiple_crates([], Stacks, Stacks).
move_multiple_crates([Move|T], Before, After) :-
  do_multi_move(Move, Before, Next),
  move_multiple_crates(T, Next, After).

do_multi_move(move(Count, From, To), Before, After) :-
  multi_move_from(Count, From, Before, Next, Crates),
  multi_move_to(Crates, To, Next, After).

multi_move_from(Count, From, [stack(From, Stack)|T], [stack(From, Rest)|T], Crates) :-
  append(Crates, Rest, Stack),
  proper_length(Crates, Count).

multi_move_from(Count, From, [H|T], [H|T2], Crates) :-
  multi_move_from(Count, From, T, T2, Crates).

multi_move_to(Crates, To, [stack(To, Stack)|T], [stack(To, NewStack)|T]) :-
  append(Crates, Stack, NewStack).

multi_move_to(Crates, To, [H|T], [H|T2]) :-
  multi_move_to(Crates, To, T, T2).



