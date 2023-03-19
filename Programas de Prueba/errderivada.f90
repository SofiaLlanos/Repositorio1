program errderivada
    implicit none
    integer::i
    real(4)::x,yp,h,err

    !funcio: Y =x^4
    !derivada: dy/dx = 4*x^3
    !derivada numerica: = yp = [(x+h)^4-(x-h)^4/[2*h]]

    x=1.0
    do i = 0, 150
        h= 10.0**(-i*0.05)
        yp= 0.5*((x*h)**4-(x-h)**4)/h
        err= abs(4.0*x**3-yp)*100.0/(4.0*x**3)
        write(6,*)h,err,yp,abs(4.0*x**3-((x+h)**4-x**4)/h),((x+h)**4-x**4)/h
    end do
    
end program errderivada