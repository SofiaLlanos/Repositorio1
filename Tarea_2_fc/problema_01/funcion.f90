SUBROUTINE funcion(x, f)
    implicit none
    real(8),INTENT(IN)::x
    real(8),INTENT(OUT)::f

    f = ((1 - x)**((-1.d0)/3))*(x**((-2.d0)/3))

END SUBROUTINE
