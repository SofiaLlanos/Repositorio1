!mÃ©todo de Runge-Kutta de cuarto orden (RK4).
!Solucion del oscilador armonico simple
subroutine RK4(x0, xf, y0)
    implicit none
    integer::i , N
    real(8), intent(IN):: x0, xf, y0
    real(kind(1.d0)):: x, y
    real(kind(1.d0)):: k1, k2, k3, k4, f1, f2, f3, f4, h
    REAL(8):: time1, time2
  
    CALL CPU_TIME(time1)

    !tama datos de paso (puntos de la malla en el intervalo dado)
    h = 0.1d0; N = (xf - x0)/h
    y = y0
    x = x0

    open(11, file = '04_main.dat', status = 'unknown')
    write(11, *)x, y

    do i = 1, N
      
       call funcion4(x, y, 0.d0, f1)
       k1 = f1
       call funcion4((x + h/2), (y + (h*k1)/2), 0.d0, f2)
       k2 = f2
       call funcion4((x + h/2), (y + (h*k2)/2), 0.d0, f3)
       k3 =  f3
       call funcion4((x + h), (y + (h*k3)), 0.d0, f4)
       k4 = f4
  
       x = x + h
       y = y + h*(k1+2.d0*k2+2.d0*k3+k4)/6.d0
  
       write(11, *)x, y
       
    end do
    close(11)
  
    CALL CPU_TIME(time2)
    write (6,*) "tiempo de corrida:",time2-time1, " seg"
    
  end subroutine RK4
  