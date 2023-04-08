program periodo
    implicit none
    integer:: i, N
    real(8), parameter:: PI=3.141592653589793d0
    real(8):: theta_max, a, b, sum, S, err,eps

    eps = 0.01
    N = 100
    I = 0.d0

    open(11, file = '022_main.dat', status = 'unknown')

    do i = 80, 88

        theta_max = (i*PI)/180
        a = 0; b = theta_max
        call adaptativo2(theta_max, a, b, N, eps, sum, err)
        S = sum/(2*PI)
        write(11, '(F10.5,1x,F10.5,1x,F10.5)')theta_max, S, err

    end do

end program periodo