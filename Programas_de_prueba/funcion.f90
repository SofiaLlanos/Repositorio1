!funcion que se va a integrar
SUBROUTINE funcion(x,f,u)
    implicit none
    real(8),INTENT(IN)::x,u
    real(8),INTENT(OUT)::f
    real(8)::d,dd
    
    !f=100.d0*cos(20.d0*x)*x**2
    d=0
    dd=0
  
    f= exp(-x**2)/sqrt(1+(u**2)/(x)**2)

  END SUBROUTINE funcion