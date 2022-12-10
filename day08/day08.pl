:- use_module(input).

main() :-
  findall(tree(X, Y, Z), tree(X, Y, Z), Bag),
  visible(),
  findall(visible_tree(X, Y, Z), visible_tree(X, Y, Z), Bag2),  
  list_to_set(Bag2, VisibleTrees),

  length(Bag, NrTrees),
  length(VisibleTrees, NrVisibleTrees),
  format("Nr of trees: ~d", [NrTrees]), nl,
  format("Nr of visible trees: ~d", [NrVisibleTrees]), nl.

visible() :-
  visibility_from_north(1),
  visibility_from_east(1),
  visibility_from_south(1),
  visibility_from_west(1).

visibility_from_north(100).
visibility_from_north(C) :-
  is_visible_from_north(1, C, -1),
  Column is C + 1,
  visibility_from_north(Column).

visibility_from_east(100).
visibility_from_east(R) :-
  is_visible_from_east(R, 99, -1),
  Row is R + 1,
  visibility_from_east(Row).

visibility_from_south(100).
visibility_from_south(C) :-
  is_visible_from_south(99, C, -1),
  Column is C + 1,
  visibility_from_south(Column).

visibility_from_west(100).
visibility_from_west(R) :-
  is_visible_from_west(R, 1, -1),
  Row is R + 1,
  visibility_from_west(Row).

is_visible_from_north(_, _, 9).
is_visible_from_north(100, _, _).
is_visible_from_north(R, C, Highest) :-
  tree(R, C, Z),
  ( Z > Highest -> asserta(visible_tree(R, C, Z)); true),
  Row is R + 1,
  Max is max(Z, Highest),
  is_visible_from_north(Row, C, Max).

is_visible_from_east(_, _, 9).
is_visible_from_east(_, 0, _).
is_visible_from_east(R, C, Highest) :-
  tree(R, C, Z),
  ( Z > Highest -> asserta(visible_tree(R, C, Z)); true),
  Column is C - 1,
  Max is max(Z, Highest),
  is_visible_from_east(R, Column, Max).

is_visible_from_south(_, _, 9).
is_visible_from_south(0, _, _).
is_visible_from_south(R, C, Highest) :-
  tree(R, C, Z),
  ( Z > Highest -> asserta(visible_tree(R, C, Z)); true),
  Row is R - 1,
  Max is max(Z, Highest),
  is_visible_from_south(Row, C, Max).

is_visible_from_west(_, _, 9).
is_visible_from_west(_, 100, _).
is_visible_from_west(R, C, Highest) :-
  tree(R, C, Z),
  ( Z > Highest -> asserta(visible_tree(R, C, Z)); true),
  Column is C + 1,
  Max is max(Z, Highest),
  is_visible_from_west(R, Column, Max).


%%%%%%%%%%%%%%%%%%%%%%%%%%%


