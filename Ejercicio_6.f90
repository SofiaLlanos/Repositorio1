program oscilador_cuantico
    implicit none
    integer::i,n(5)
    real(8)::b, En, promE
    real(8),parameter::h=6,62607015*10**(-34), w=1.3*10**(13), k=1,380649*10**(-23), T= 10.d0**4

    n = (/1, 2, 3, 4, 5/)
    !Definimos las variables beta y la energia
    b = 1/(k*T)
    En = h*w(n + 1/2)
    i = 0 !Utilizamos i como un parámetro contador
    !do i = 1,5
        !do while (i<n)



    
end program oscilador_cuantico