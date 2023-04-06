program main_01
    implicit none
    integer::N,j
    real(8)::a1,a2,b1,b2,suma_simpson,suma_gauss,I1,I2      
    
    !definimos los limites de integracion
    a1 = 0.d0; b1 = 2**(-1.d0/3); a2 = 0; b2 = (1.d0/2)**(2.d0/3)

    open(11, file = '01_main.dat', status = 'unknown')
    !loop para diferntes N
    do j = 2, 100, 2
        N = j    
        !integracion por simpson
        suma_simpson = 0
        call simpson(1,a1,b1,N,I1)
        suma_simpson = suma_simpson + I1
        call simpson(2,a2,b2,N,I2)
        suma_simpson = suma_simpson + I2
        write(11,'(F10.5,1x,I4)')suma_simpson,N
        !integracion por gauss-legendre
        suma_gauss = 0
        I2 = 0


    end do

end program main_01