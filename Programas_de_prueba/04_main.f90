!Integra usando cuadraturas de Gauss_Legendre
PROGRAM main_04
    implicit none
    integer::N
    real(8)::a,b,sum,freal,error
  
    !resultado exacto de la integral exp(-x) entre 0 y 1
    freal=1.d0-exp(-1.d0)
    write(6,*)'freal= ',freal; write(67,*)'# freal= ',freal
  
    !limites de integracion
    a=0.d0; b=1.d0
  
    !loop para diferentes N
    do N=1,100
  
       ! cuadratura Gaussiana
       call gauss_legendre(a,b,N,sum)
  
       error=abs(sum-freal)
       write(67,*)N,sum,error
       
    end do
  
    write(6,*)'I= ',sum,'+-',error
    write(6,*)'N= ',N-1
       
    
  END PROGRAM main_04