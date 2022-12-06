:- consult(input).

main(E) :-
  max_elf(E),
  calories_summed(E, N),
  print(calories_summed(E, N)).


calories_summed(E, Sum) :-
  calories(E, Cs),
  sum(Sum, Cs).


max_elf(E) :-
  max_elf_acc(1, E).

max_elf_acc(E1, E3) :-
  calories_summed(E1, Cal1),
  calories_summed(E2, Cal2),
  E2 > E1,
  Cal2 > Cal1,
  max_elf_acc(E2, E3).

max_elf_acc(E, E).

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.


main2() :-
  findall(calories_summed(X, Y), calories_summed(X, Y), Bag),
  predsort(compare_calories, Bag, Sorted),
  top3(Sorted, Top),
  print(Top),
  get_calories(Top, Cs),
  sum(Sum, Cs),
  print(Sum).

top3([A, B, C | _], [A, B, C]).

get_calories([], []).
get_calories([calories_summed(_, Cs) | T1], [Cs|T2]) :-
  get_calories(T1, T2).

compare_calories(<, calories_summed(_, Cs1), calories_summed(_, Cs2)) :-
  Cs1 >= Cs2.
compare_calories(>, calories_summed(_, Cs1), calories_summed(_, Cs2)) :-
  Cs1 < Cs2.


