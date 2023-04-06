SUBROUTINE funcion(tipo,x, f)
    implicit none
    real(8),INTENT(IN)::x,tipo
    real(8),INTENT(OUT)::f

    if (tipo == 1) then
        f = 3 * ((1 - x**3)**(-1.d0/3))
    else if (tipo == 2) then
        f = (3.d0/2)*(1 - (x**(3.d0/2)))**(-2.d0/3)
    end if

END SUBROUTINE
