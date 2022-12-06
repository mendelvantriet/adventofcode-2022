# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 2](https://adventofcode.com/2022/day/2)

## Preprocessing

    cat input.txt | tr '[:upper:]' '[:lower:]' | sed -r -e 's/([a-z]) ([a-z])/input(\1,\2)\./g' > input.pl

## Run

    swipl -s day02.pl -g 'main' -g halt
    swipl -s day02b.pl -g 'main' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

