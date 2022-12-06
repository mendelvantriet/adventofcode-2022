# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 4](https://adventofcode.com/2022/day/4)

## Preprocessing

    cat input.txt | sed -r -e 's/([0-9]+)-([0-9]+)/range(\1,\2)/g' -e 's/(.*)/input(\1)./g' > input.pl

## Run

    swipl -s day04.pl -g 'main' -g halt
    swipl -s day04.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

