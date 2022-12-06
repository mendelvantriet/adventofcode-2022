# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 3](https://adventofcode.com/2022/day/3)

## Preprocessing

    cat input.txt | sed -r -e "s/(.)/'\1'/g" -e "s/''/','/g" -e "s/(.*)/input([\1])/g" > input.pl

## Run

    swipl -s day03.pl -g 'main' -g halt
    swipl -s day03.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

