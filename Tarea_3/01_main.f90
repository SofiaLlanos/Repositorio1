PROGRAM problema_01
    use mod1
    integer:: i
    !leemos los datos
    open(11, file = '01_input.dat', status = 'unknown')

    read(11, *)N
    read(11, *)L
    
    allocate(q(N), xy(2, N))

    do i = 1, N
        read(11, *)q(i),xy(1,i),xy(2,i)
    end do

    !realizamos el calculo del potencial



end program



