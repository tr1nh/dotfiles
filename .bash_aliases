alias h="history | grep"
alias w-solid='f(){ convert -size 300x300 xc:$1 $1.png; unset -f f; }; f'
alias w-gradient='sh -c '\''convert -size 300x300 gradient:$1-$2 -distort SRT 45 $1-$2.png'\'' _'
