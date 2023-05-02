program ayua
    implicit none
    integer:: i, N, L
    real(8), allocatable:: q(:), xy(:,:)

    N = 6
    L = 50

    allocate(q(N), xy(2, N))

    do i = 1, N
        q(i) = 10.d0**(-9)
    end do

    xy(1, 1) = 0             ; xy(2, 1) = 20
    xy(1, 2) = -10.d0*sqrt(3.d0); xy(2, 2) = 10
    xy(1, 3) = -10.d0*sqrt(3.d0); xy(2, 3) = -10
    xy(1, 4) = 0             ; xy(2, 4) = -20
    xy(1, 5) = 10.d0*sqrt(3.d0) ; xy(2, 5) = -10
    xy(1, 6) = 10.d0*sqrt(3.d0) ; xy(2, 6) = 10

    open(12, file = '01_input.dat', status = 'unknown')

    write(12,*)N
    write(12,*)L

    do i = 1, N
        write(12,*)q(1), xy(1,i), xy(2, i)
    end do

end program