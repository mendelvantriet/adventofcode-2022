# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 1](https://adventofcode.com/2022/day/1)

## Preprocessing

    cat input.txt|tr '\n' ',' | sed -e 's/,,/\n/g'|nl -s ',[' |sed -r -e 's/^(.+)$/calories(\1])./g' > input.pl

## Run

    swipl -s day01.pl -g 'main(A), print(A)' -g halt
    swipl -s day01.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

