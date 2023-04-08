SUBROUTINE funcion1_1(x, f)
    implicit none
    real(8),INTENT(IN)::x
    real(8),INTENT(OUT)::f

    f = 3 * ((1 - x**3)**(-1.d0/3))

END SUBROUTINE
SUBROUTINE funcion1_2(x, f)
    implicit none
    real(8),INTENT(IN)::x
    real(8),INTENT(OUT)::f

    f = (3.d0/2)*(1 - (x**(3.d0/2)))**(-2.d0/3)

END SUBROUTINE