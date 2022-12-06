:- consult(input).

main() :-
  findall(input(Abc, Xyz), input(Abc, Xyz), Bag),
  calculate_points(Bag, 0, Points),
  print(Points).

calculate_points([], R, R).
calculate_points([input(Abc, Xyz) | T], Acc, R) :-
  shape(Rps, Abc, _),
  turn(Ldw, Xyz, P1),
  action(Ldw, Rps, P2),
  AccPoints is Acc + P1 + P2,
  calculate_points(T, AccPoints, R).

shape(rock, a, 1).
shape(paper, b, 2).
shape(scissors, c, 3).

turn(lose, x, 0).
turn(draw, y, 3).
turn(win, z, 6).

action(lose, rock, Points) :- shape(scissors, _, Points).
action(lose, paper, Points) :- shape(rock, _, Points).
action(lose, scissors, Points) :- shape(paper, _, Points).
action(draw, Rps, Points) :- shape(Rps, _, Points).
action(win, rock, Points) :- shape(paper, _, Points).
action(win, paper, Points) :- shape(scissors, _, Points).
action(win, scissors, Points) :- shape(rock, _, Points).

