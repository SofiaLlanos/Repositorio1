program main_01
    implicit none
    integer::N,j
    real(8)::a,b,I1,I2        
    
    !definimos los limites de integracion
    a = 0.d0; b = 1.d0

    open(11, file = '01_main.dat', status = 'unknown')
    !loop para diferntes N
    do j = 2, 100, 2
        N = j    
        !integracion por simpson
        call simpson(a,b,N,I1)
        write(11,'(F10.5,1x,I4)')I1,N
        !integracion por gauss-legendre
        !para evitar las singularidades integramos la funcion inicial sobre [h, 1-h]
        call gauss_legendre(a,b,N,I2)

    end do

end program main_01