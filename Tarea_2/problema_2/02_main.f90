program periodo
    implicit none
    integer:: i, N
    real(8), parameter:: PI=3.141592653589793d0
    real(8):: theta_max, a, b, sum, S, err,eps

    eps = 0.01
    N = 100
    I = 0.d0

    open(11, file = '02_main.dat', status = 'unknown')

    do i = 0, 180

        theta_max = (i*PI)/180
        a = 0; b = theta_max
        call simpson(theta_max, a, b, N, sum)
        S = sum/(2*PI)
        write(11, '(F10.5,1x,F10.5,1x,F10.5)')theta_max, S

    end do


    close(11)

end program periodo