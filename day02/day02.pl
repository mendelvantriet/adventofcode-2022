:- consult(input).

main() :-
  findall(input(Elf, Me), input(Elf, Me), Bag),
  calculate_points(Bag, 0, Points),
  print(Points).

calculate_points([], R, R).
calculate_points([input(Elf, Me) | T], Acc, R) :-
  turn(Elf, Me, Points),
  AccPoints is Acc + Points,
  calculate_points(T, AccPoints, R).

shape(rock, 1).
shape(paper, 2).
shape(scissors, 3).

translation(a, rock).
translation(b, paper).
translation(c, scissors).
translation(x, rock).
translation(y, paper).
translation(z, scissors).

turn(Elf, Me, Points) :- draw(Elf, Me, Points).
turn(Elf, Me, Points) :- win(Elf, Me, Points).
turn(Elf, Me, Points) :- loss(Elf, Me, Points).

draw(Elf, Me, Points) :-
  translation(Elf, Rps),
  translation(Me, Rps),
  shape(Rps, P),
  Points is 3 + P.

win(Elf, Me, Points) :-
  translation(Elf, Rps_e),
  translation(Me, Rps_m),
  shape(Rps_m, P),
  shape(Rps_e, Q),
  P is 1 + Q,
  Points is 6 + P.

win(Elf, Me, Points) :-
  translation(Elf, Rps_e),
  translation(Me, Rps_m),
  shape(Rps_m, P),
  shape(Rps_e, Q),
  P is Q - 2,
  Points is 6 + P.

loss(Elf, Me, Points) :-
  translation(Elf, Rps_e),
  translation(Me, Rps_m),
  shape(Rps_m, P),
  shape(Rps_e, Q),
  P is Q - 1,
  Points is P.

loss(Elf, Me, Points) :-
  translation(Elf, Rps_e),
  translation(Me, Rps_m),
  shape(Rps_m, P),
  shape(Rps_e, Q),
  Q is P - 2,
  Points is P.

