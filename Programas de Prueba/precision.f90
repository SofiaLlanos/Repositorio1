program precision
    implicit none
    integer::i

    real(8)::prec,base,mantisa,minimoexponente,maximoexponente,maximo,minimo,x
    x=1
    X=i
    prec=EPSILON(x)
    base=RADIX(i)
    mantisa=DIGITS(x)
    minimoexponente=MINEXPONENT(x)
    maximoexponente=MAXEXPONENT(x)
    maximo=HUGE(x)
    minimo=TINY(x)

    write(6,*)
    write(6,*)prec
    write(6,*)base,mantisa
    write(6,*)minimoexponente,maximoexponente
    write(6,*)

end program precision
