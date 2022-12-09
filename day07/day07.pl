:- consult(input).

main() :-
  findall(line(Tokens), line(Tokens), Bag),
  process_lines(Bag, [], Listings),
  
  proper_length(Listings, ListingsCount),
  size(['/'], S),
  format("Nr of listings: ~d", [ListingsCount]), nl,
  format("Total size of /: ~d", [S]), nl,

  findall(Dir, listing(Dir, _), Bag2),
  paths_sizes(Bag2, Sizes),
  filter_small_numbers(Sizes, 100000, NewSizes),
  sum_list(NewSizes, Sum),
  print(Sum).

process_lines([], _, []).
process_lines([Line|T], WD, Listings) :-
  command(Line, WD, WD2),
  process_lines(T, WD2, Listings).

process_lines(Lines, WD, [lst(WD, Children)|T2]) :-
  output(Lines, WD, Children, Rest),
  asserta(listing(WD, Children)),
  process_lines(Rest, WD, T2).

command(line(['$'|T]), WD, WD2) :-
  cd(T, WD, WD2).

command(line(['$'|T]), WD, WD) :-
  ls(T).

cd(['cd', '/'], _, ['/']).
cd(['cd', '..'], [_|T], T).
cd(['cd', Dir], WD, [Dir|WD]).

ls(['ls']).

output([Line|T], WD, [Name|T2], Rest) :-
  output_line(Line, WD, Name),
  output(T, WD, T2, Rest).
output(Rest, _, [], Rest).

output_line(line(['dir', Name]), WD, [Name|WD]) :-
  asserta(directory([Name|WD])).
output_line(line([Size, Name]), WD, [Name|WD]) :-
  atom_number(Size, SizeInt),
  asserta(file([Name|WD], SizeInt)).

size(F, Size) :-
  file(F, Size).

size(Dir, Total) :-
  listing(Dir, Children),
  paths_sizes(Children, Sizes),
  sum_list(Sizes, Total).

paths_sizes([], []).  
paths_sizes([H|T], [Size|T2]) :-
  size(H, Size),
  paths_sizes(T, T2).

filter_small_numbers([], _, []).
filter_small_numbers([H|T], Limit, [H|T2]) :-
  H =< Limit,
  filter_small_numbers(T, Limit, T2).

filter_small_numbers([H|T], Limit, T2) :-
  H > Limit,
  filter_small_numbers(T, Limit, T2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%

available(70000000).
needed(30000000).

main2() :-
  findall(line(Tokens), line(Tokens), Bag),
  process_lines(Bag, [], _),
  findall(Dir, listing(Dir, _), Bag2),
  paths_sizes(Bag2, Sizes),

  to_free_up(ToFree),
  filter_big_numbers(Sizes, ToFree, NewSizes),
  min_member(Min, NewSizes),
  
  format("Need to free up: ~d", [ToFree]), nl,
  format("Size of dir to be deleted: ~d", [Min]), nl.

to_free_up(FreeUp) :-
  size(['/'], Used),
  available(A),
  Unused is A - Used,
  format("Amount of unused space: ~d", [Unused]), nl,
  
  needed(N),
  FreeUp is N - Unused.

filter_big_numbers([], _, []).
filter_big_numbers([H|T], Limit, [H|T2]) :-
  H >= Limit,
  filter_big_numbers(T, Limit, T2).

filter_big_numbers([H|T], Limit, T2) :-
  H < Limit,
  filter_big_numbers(T, Limit, T2).


