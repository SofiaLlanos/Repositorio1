program digitos_significativos
    implicit none
    integer::i
    real(8)::x,fx,gx

    !fx = sqrt(x**2 +1) - 1
    !gx = x - sin(x)
    x = 0
    open(11, file = 'Ejercicio_5.dat', status = 'unknown')

    do i = 0,100 !arreglar
        fx = (x**2) / (sqrt(x**2 + 1) + 1)
        gx = (x**2 + cos(x)**2 - 1) / (x + sin(x))
        x = x + 0.000001*i
        write(11,'(5(F10.8,1x))')x,fx,gx        
    enddo
    close(11)
    
end program digitos_significativos