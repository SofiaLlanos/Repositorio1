program digitos_significativos
    implicit none
    integer::i
    real(8)::x,fx,gx

    !fx = sqrt(x**2 +1) - 1
    !gx = x - sin(x)
    x = 0
    open(11, file = 'Ejercicio_5.dat', status = 'unknown')

    do i = 0,50 !arreglar
        fx = (x**2) / (sqrt(x**2 + 1.d0) + 1.d0) !racionalizamos
        gx = (x**3)/6 !expandimos por Taylor
        x = 0.000002*i
        write(11,'(5(F16.15,1x))')x,fx,gx        
    enddo
    close(11)
    
end program digitos_significativos