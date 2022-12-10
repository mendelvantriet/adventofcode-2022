# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 8](https://adventofcode.com/2022/day/8)

## Preprocessing

    echo ":- module(input,
      [
          tree/3
      ]).
      " > input.pl && \
    cat input.txt | \
      sed -re 's/(.)/\1 /g' | \
      awk '{for(i=1; i<=NF; i++) {print NR,i,$i}}' - | \
      sed -r -e 's/ /,/g' -e 's/(.*)/tree(\1)./' | \
      tee -a input.pl

## Run

    swipl -s day08.pl -g 'main' -g halt
    swipl -s day08.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

