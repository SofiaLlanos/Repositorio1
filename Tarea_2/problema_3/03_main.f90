program problema1
    implicit none
    integer:: i
    real(8):: Q, z, dz, sum1, sum2, integral
    real(8), parameter:: PI=3.141592653589793d0

    !calculamos Q
    call gauss_legendre_infty1((1.d0/5), 100, sum1)
    Q = 20.d0/sum1
    write(6,*)Q

    open(11, file = '03_main.dat', status = 'unknown')

    z = -100      
    dz = 200.d0/10000
    do i = 1,10000
        call gauss_legendre_infty2(z,(1.d0/5),100,sum2)
        z = z + dz
        integral = Q*sum2
        write(11,*)z, integral
    end do
    close(11)

end program problema1