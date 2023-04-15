subroutine RK4_3(x0, xf, y0, z0)
    implicit none
    integer::i , N
    real(8), intent(IN):: x0, xf, y0, z0
    real(kind(1.d0)):: x, y, z
    real(kind(1.d0)):: kz1, kz2, kz3, kz4, ky1, ky2, ky3, ky4, f1, f2, f3, f4, h
    REAL(8):: time1, time2
  
    CALL CPU_TIME(time1)

    !tama datos de paso (puntos de la malla en el intervalo dado)
    h = 0.001d0; N = (xf - x0)/h
    z = z0
    y = y0
    x = x0

    open(13, file = '3_04_main.dat', status = 'unknown')
    write(13, *)x, y

    do i = 1, N

       call funcion4_3(x, y, z, f1)
       ky1 = f1
       call funcion4_4(x, y, z, f1)
       kz1 = f1

       call funcion4_3((x + h/2), (y + (h*ky1)/2), (z + (h*kz1)/2), f2)
       ky2 = f2
       call funcion4_4((x + h/2), (y + (h*ky1)/2), (z + (h*kz1)/2), f2)
       kz2 = f2

       call funcion4_3((x + h/2), (y + (h*ky2)/2), (z + (h*kz2)/2), f3)
       ky3 = f3
       call funcion4_4((x + h/2), (y + (h*ky2)/2), (z + (h*kz2)/2), f3)
       kz3 = f3

       call funcion4_3((x + h), (y + (h*ky3)), (z + (h*kz3)), f4)
       ky4 = f4
       call funcion4_4((x + h), (y + (h*ky3)), (z + (h*kz3)), f4)
       kz4 = f4
       x = x + h
       y = y + h*(ky1+2.d0*ky2+2.d0*ky3+ky4)/6.d0     
       z = z + h*(kz1+2.d0*kz2+2.d0*kz3+kz4)/6.d0 
       write(13, *)x, y
       
    end do
    close(13)
  
    CALL CPU_TIME(time2)
    write (6,*) "tiempo de corrida:",time2-time1, " seg"
    
  end subroutine RK4_3