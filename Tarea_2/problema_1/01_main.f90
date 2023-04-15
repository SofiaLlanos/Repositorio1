program main_01
    implicit none
    integer::N,j,tipo
    real(8), parameter:: PI=3.141592653589793d0
    real(8)::a1,a2,b1,b2,suma_simpson,suma_gauss,I1,I2,S1,S2,error_simpson,error_gauss,freal
    
    !valor real de la integral
    freal = (2*PI)/sqrt(3.d0)

    !definimos los limites de integracion
    a1 = 0.d0; b1 = 2**(-1.d0/3)
    a2 = 0; b2 = (1.d0/2)**(2.d0/3)

    open(11, file = '01_main.dat', status = 'unknown')
    !loop para diferntes N
    do j = 2, 100, 2
        N = j    
        !integracion por simpson y gauss-legendre
        suma_simpson = 0        
        suma_gauss = 0
        !integramos la primera funcion
        tipo = 1
        call simpson(tipo,a1,b1,N,I1)        
        call gauss_legendre(tipo,a1,b1,N,S1)
        !integramos la segunda funcion
        tipo = 2
        call simpson(tipo,a2,b2,N,I2)        
        call gauss_legendre(tipo,a2,b2,N,S2)
        suma_simpson = I1 + I2
        suma_gauss = S1 + S2
        !obtenemos los errores
        error_gauss=abs(freal-suma_gauss)*100.d0/freal        
        error_simpson=abs(freal-suma_simpson)*100.d0/freal
        write(11,'(I4,1x,F12.10,1x,F10.8,1x,F12.10,1x,F10.8)')N,suma_simpson,error_simpson,suma_gauss,error_gauss

    end do

end program main_01