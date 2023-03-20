<<<<<<< HEAD
program derivada_raiz_cuadrada
    implicit none
    integer::i
    real(8)::x,h,yp,err

    !f(x) = sqrt(x)
    !derivada analitica: (1/2)*x**(-1/2)
    !derivada numerica: (sqrt(x+h) - sqrt(x))/h

    x= 1.0

    do i = 2,14
        h= 10.d0**(-i)
        yp= (sqrt(x+h) - sqrt(x))/h
        err= abs(((1.d0/2)*x**(-1.d0/2)) - yp)/((1.d0/2)*x**(-1.d0/2))
        write(6,*)h,yp,err

    enddo
    
=======
program derivada_raiz_cuadrada
    implicit none
    integer::i
    real(8)::x,h,yp,err

    !f(x) = sqrt(x)
    !derivada analitica: (1/2)*x**(-1/2)
    !derivada numerica: (sqrt(x+h) - sqrt(x))/h

    x= 1.0

    do i = 2,14
        h= 10.d0**(-i)
        yp= (sqrt(x+h) - sqrt(x))/h
        err= abs(((1.d0/2)*x**(-1.d0/2)) - yp)/((1.d0/2)*x**(-1.d0/2))
        write(6,*)h,yp,err

    enddo
    
>>>>>>> 447a2baf74e5b032b19ccfcd0aad1b569ab1efeb
end program derivada_raiz_cuadrada