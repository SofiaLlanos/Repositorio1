program ecuaciones_diferenciales
    implicit none
    real(8):: x0, xf, y0, y1_0

    x0 = 0; xf = 40
    y0 = 1; y1_0 = 0

    call RK4(x0, xf, y0)

    close(11)


    
end program ecuaciones_diferenciales