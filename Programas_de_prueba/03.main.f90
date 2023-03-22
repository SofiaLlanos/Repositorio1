!Integra utilizando simpson-adaptativo
PROGRAM main_03
    implicit none
    integer::N
    real(8)::a,b,sum,freal,error,eps
  
    !Datos
    eps=1.d-13   !precision del calculo
    N=10        !valor incial del numero de puntos de la malla
    
    !resultado exacto de la integral
    freal=(sin(20.d0)/20.d0+2.d0*cos(20.d0)/20.d0**2 - &
         2.d0*sin(20.d0)/20.d0**3)*100.d0
    write(6,*)'freal= ',freal
  
    !limites de integracion
    a=0.d0; b=1.d0
  
    !llama subroutina 
    call adaptativo(a,b,N,eps,sum,error)
  
    write(6,*)'I= ',sum,'+-',error
    write(6,*)'N= ',N
    
  END PROGRAM main_03