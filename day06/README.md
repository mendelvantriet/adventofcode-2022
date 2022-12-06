# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 6](https://adventofcode.com/2022/day/6)

## Preprocessing

    cat input.txt | grep -o . | nl -s ',' | sed -r -e 's/[ ]*([0-9]+,[a-z]+)/input(\1)./'

## Run

    swipl -s day06.pl -g 'main' -g halt
    swipl -s day06.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

