program caida_libre
    implicit none
    real(8)::h,y,vy,t,e,v0x,dt
    real(8),parameter::g=9.80665d0

    !Pedimos los parametros iniciales del problema 
    write(6,*)
    write(6,*)'Ingrese altura inicial de la particula h y la velocidad inicial v0x: '
    write(6,*)
    read(5,*)h,v0x
    write(6,*)
    write(6,*)'Ingrese numero e y el intervalo de tiempo dt:'
    read(5,*)e,dt
    
    !Determinamos las condiciones iniciales del problema
    y=h
    t=0
    vy=0
    !tf= sqrt((2*y)/g)

    open(11,file='Ejercicio_3.dat',status= 'unknown')

    do while (h>0) !Realizamos los calculos y los guardamos en un arcchivo 
        do while (y>0) !bajada             
            write(11,'(5(F10.5,1x))')t,y,v0x,vy
            t = t+dt
            vy = vy + g*dt
            y = y - vy*dt
        enddo
        vy = -e*vy
        y = 0
        do while (vy<0) !subida
            write(11,'(5(F10.5,1x))')t,y,v0x,vy
            t = t+dt
            vy = vy + g*dt
            y = y - vy*dt
        h = y
        enddo
    enddo
    close(11)
end program caida_libre