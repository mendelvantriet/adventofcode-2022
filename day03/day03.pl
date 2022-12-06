:- consult(input).

main() :-
  findall(Items, input(Items), Bag),
  displaced_items(Bag, DisplacedItems),
  items_to_points(DisplacedItems, Points),
  sum_list(Points, Sum),
  print(Sum).

displaced_items([], []).
displaced_items([H|T], [DisplacedItem|T2]) :-
  displaced_item(H, DisplacedItem),
  displaced_items(T, T2).

displaced_item(Items, Item) :-
  append(Compartment1, Compartment2, Items),
  same_length(Compartment1, Compartment2),
  intersection(Compartment1, Compartment2, Intersection),
  list_to_set(Intersection, [Item]).

items_to_points([], []).
items_to_points([H|T], [Point|T2]) :-
  item(H, Point),
  items_to_points(T, T2).

item(I, Prio) :-
  atom_string(I, S),
  string_upper(S, S),
  atom_codes(I, [Code]),
  Prio is Code - 38.

item(I, Prio) :-
  atom_string(I, S),
  string_lower(S, S),
  atom_codes(I, [Code]),
  Prio is Code - 96.

%%%%%%%%%%%%%%%%%%%%%%%%%%%

main2() :-
  findall(Items, input(Items), Bag),
  get_group_badges(Bag, Badges),
  items_to_points(Badges, Points),
  sum_list(Points, Sum),
  print(Sum).

get_group_badges([], []).
get_group_badges([A,B,C|T], [Item|T2]) :-
  intersection(A, B, Int),
  intersection(Int, C, Intersection),
  list_to_set(Intersection, [Item]),
  get_group_badges(T, T2).


