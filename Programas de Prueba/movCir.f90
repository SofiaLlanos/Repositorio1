<<<<<<< HEAD
!Movimiento circular uniforme
PROGRAM movCir
    implicit none
    !declaration of variables
    real(8),parameter::PI=3.141592653589793d0
    real(8)::x0,y0,R,x,y,vx,vy,t,t0,tf,dt
    real(8)::theta,omega

    !lee informacion desde el usuario
    write(6,*)'velocidad angular?';read(5,*)omega

    if(omega.le.0.0)then !comprueba dato introducido
        write(6,*)'valor de omega no valido: ',omega; stop
    else
        write(6,*)
        write(6,*)'periodo del movimiento T= ',2.d0*PI/omega
        write(6,*)
    end if

    write(6,*)'centro de la trayectoria y radio (x0 y0 R)?'
    read(5,*)x0,y0,R

    if(R.le.0.0) then !Comprueba dato introducido
        write(6,*)'valor de R no valido: ',R; stop
    end if

    write(6,*)'timepo inicial, final e intervalo de tiempo (t0 tf dt)?'
    read(5,*)t0,tf,dt

    !Calculo de ecuaciones y guarda en un archivo
    open(11,file='moveCir.dat',status= 'unknown')
    t=t0
    
    do while(t.le.tf)
        theta=omega*(t-t0)
        x=x0+R*cos(theta)
        y=y0+R*sin(theta)
        vx=-omega*R*sin(theta)
        vy=omega*R*cos(theta)
        write(11,'(5(F10.5,1x))')t,x,y,vx,vy
        t=t+dt
    enddo
    close(11)

    write(6,*)
    write(6,*)'resultados en movCir.dat'
    write(6,*)

=======
!Movimiento circular uniforme
PROGRAM movCir
    implicit none
    !declaration of variables
    real(8),parameter::PI=3.141592653589793d0
    real(8)::x0,y0,R,x,y,vx,vy,t,t0,tf,dt
    real(8)::theta,omega

    !lee informacion desde el usuario
    write(6,*)'velocidad angular?';read(5,*)omega

    if(omega.le.0.0)then !comprueba dato introducido
        write(6,*)'valor de omega no valido: ',omega; stop
    else
        write(6,*)
        write(6,*)'periodo del movimiento T= ',2.d0*PI/omega
        write(6,*)
    end if

    write(6,*)'centro de la trayectoria y radio (x0 y0 R)?'
    read(5,*)x0,y0,R

    if(R.le.0.0) then !Comprueba dato introducido
        write(6,*)'valor de R no valido: ',R; stop
    end if

    write(6,*)'timepo inicial, final e intervalo de tiempo (t0 tf dt)?'
    read(5,*)t0,tf,dt

    !Calculo de ecuaciones y guarda en un archivo
    open(11,file='moveCir.dat',status= 'unknown')
    t=t0
    
    do while(t.le.tf)
        theta=omega*(t-t0)
        x=x0+R*cos(theta)
        y=y0+R*sin(theta)
        vx=-omega*R*sin(theta)
        vy=omega*R*cos(theta)
        write(11,'(5(F10.5,1x))')t,x,y,vx,vy
        t=t+dt
    enddo
    close(11)

    write(6,*)
    write(6,*)'resultados en movCir.dat'
    write(6,*)

>>>>>>> 3b882dfc7511e567a50f4c0bc2bb126cf822f68c
END PROGRAM movCir