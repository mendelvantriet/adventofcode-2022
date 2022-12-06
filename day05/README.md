# Advent of Code 2022

[Advent of Code](https://adventofcode.com/about) [2022](https://adventofcode.com/2022) [day 5](https://adventofcode.com/2022/day/5)

## Preprocessing

    cat moves.txt | sed -r -e 's/move ([0-9]+) from ([0-9]+) to ([0-9]+)/move(\1,\2,\3)./g' > moves.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $1;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" > stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $2;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $3;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $4;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $5;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $6;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $7;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $8;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl
    echo -n "\n" >> stacks.pl
    cat stacks.txt | sed -r -e 's/.(.).(.?)/\1;/g' | awk -F ";" '{ORS=","; print $9;}' | sed -r -e 's/[, ]*([A-Z,]+),([0-9]?)[^0-9]*/stack(\2,[\1])./' -e "s/([A-Z]+)/'\1'/g" >> stacks.pl

## Run

    swipl -s day05.pl -g 'main' -g halt
    swipl -s day05.pl -g 'main2' -g halt

## Disclaimer

Because of the timely nature of this game, the quality of the produced code can be sub-optimal.

