program data
    implicit none
    
    open(11, file = 'Ejercicio_1.dat', status = 'unknown')
    write(11,'(5(F10.5,1x))')1990,18
    write(11,'(5(F10.5,1x))')1994,8.7
    write(11,'(5(F10.5,1x))')1998,10
    close(11)

end program data