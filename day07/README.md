# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 7](https://adventofcode.com/2022/day/7)

## Preprocessing

    cat input.txt | sed -re 's/[ ]/'\'','\''/g' | sed -re 's/(.*)/line(['\''\1'\''])./' > input.pl

## Run

    swipl -s day07.pl -g 'main' -g halt
    swipl -s day07.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

