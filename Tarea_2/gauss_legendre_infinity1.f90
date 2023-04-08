!Integra usando cuadraturas de Gauss_Legendre entre 0 e infinito
SUBROUTINE gauss_legendre_infty1(a,N,integral)
    implicit none
    integer,INTENT(IN)::N
    real(8),INTENT(IN)::a
    real(8),INTENT(OUT)::integral
    integer::k
    real(8)::fx,xi,wi
    real(8),ALLOCATABLE:: x(:),w(:)
  
    INTERFACE
       SUBROUTINE gauleg(x1,x2,x,w)
         IMPLICIT NONE
         INTEGER,PARAMETER::DP=kind(1.d0)
         REAL(DP),INTENT(IN)::x1,x2
         REAL(DP),INTENT(OUT)::x(:),w(:)
       END SUBROUTINE gauleg
    END INTERFACE
  
  
    allocate(x(N),w(N)) !localiza memoria
  
    call gauleg(-1.d0,1.d0,x,w) !puntos de la malla y pesos Gauss-Legendre
  
    ! cuadratura Gaussiana
    integral=0.d0
    do k=1,N
       xi=a*(x(k))/(1.d0-(x(k)**2))
        call funcion3_1(xi,fx)
       wi=(((1+x(k))**2)*a*w(k))/((1-x(k)**2)**2)
       integral=integral+wi*fx
    end do
    
    deallocate(x,w) !libera memoria
    
  END SUBROUTINE gauss_legendre_infty1
  
