program problema1
    implicit none
    integer:: i
    real(8):: Q, z, dz, sum1, sum2
    real(8), parameter:: PI=3.141592653589793d0

    !calculamos Q
    call gauss_legendre_infty1(1,(1.d0/5),100,sum1)
    Q = 20.d0/sum1

    do i = 1,1000
        dz = 100.d0/1000
        z = 0
        call gauss_legendre_infty2(z,(1.d0/5),100,sum2)
        write(6,*)z,sum2
    end do




end program problema1