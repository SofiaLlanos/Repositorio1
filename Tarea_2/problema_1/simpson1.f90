!calcula la integral usando el metodo Simpson
SUBROUTINE simpson(tipo,a,b,N,sum)
    implicit none
    integer,INTENT(INOUT)::N
    integer, INTENT(IN):: tipo
    real(8),INTENT(IN)::a,b
    real(8),INTENT(OUT)::sum
    integer::i
    real(8)::x,fx,h
    real(8),allocatable::w(:)
  
    !para asegurarnos que N sea par
    if(mod(N,2).ne.0)N=N+1
  
    !calculo h
    h=(b-a)/N
  
    !definos los pesos
    allocate(w(N+1)); w=4.d0
    w(1)=1.d0; w(N+1)=1.d0 
    do i=3,N,2
       w(i)=2.d0
    end do

    !calcula la integral
    sum=0.d0; x=a
    do i=1,N+1        
       if (tipo == 1) then
            call funcion1_1(x,fx)
       else if (tipo == 2) then
            call funcion1_2(x,fx)
       end if
        sum=sum+w(i)*fx
        x=a+i*h
    end do
    sum=sum*h/3.d0
    deallocate(w)
  
  END SUBROUTINE simpson