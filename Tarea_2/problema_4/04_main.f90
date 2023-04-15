program ecuaciones_diferenciales
    implicit none
    real(8):: x0, xf, y0, z0

    x0 = 0; xf = 1.8
    y0 = 1

    call RK4_1(x0, xf, y0)

    x0 = 0; xf = 5
    y0 = 1

    call RK4_2(x0, xf, y0)

    x0 = 0; xf = 6
    y0 = 1; z0 = 0

    call RK4_3(x0, xf, y0, z0)


    close(11)


    
end program ecuaciones_diferenciales