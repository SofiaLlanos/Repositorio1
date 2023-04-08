!calcula la integral usando el metodo de integracion adaptativa con Simpson
SUBROUTINE adaptativo2(theta_max,a,b,N,eps,sum,err)
    implicit none
    integer,INTENT(INOUT)::N
    real(8),INTENT(IN)::a,b,eps,theta_max
    real(8),INTENT(OUT)::sum,err
    integer::i
    real(8)::fx,h,S_i,T_i,sum_old
  
    !para asegurarnos que N sea par
    if(mod(N,2).ne.0)N=N+1
  
    !primer paso
    h=(b-a)/N
    S_i=0.d0; T_i=0.d0
    call funcion(theta_max,a,fx)
    S_i=S_i+fx
    call funcion(theta_max,b,fx)
    S_i=S_i+fx
    do i=2,N-2,2
       call funcion(theta_max,a+i*h,fx)
       S_i=S_i+2.d0*fx
    end do
    S_i=S_i/3.d0
    do i=1,N-1,2
       call funcion(theta_max,a+i*h,fx)
       T_i=T_i+fx
    end do
    T_i=T_i*2.d0/3.d0
    sum_old=h*(S_i+2.d0*T_i)
  
    !Realizo loop para calcular el error en la integral
    do 
       write(6,*)N,sum_old
       N=N*2
       h=(b-a)/N
       S_i=S_i+T_i
       T_i=0.d0
       do i=1,N-1,2
          call funcion(theta_max,a+i*h,fx)
          T_i=T_i+fx
       end do
       T_i=T_i*2.d0/3.d0
       sum=h*(S_i+2.d0*T_i)
       err=abs(sum-sum_old)/15.d0
       sum_old=sum
       if(err.lt.eps)exit
    end do
  
  
END SUBROUTINE adaptativo2