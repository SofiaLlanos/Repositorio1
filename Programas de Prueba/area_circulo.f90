!Iniciamos el programa y le asignamos un nombre
program area_circulo
    implicit none
    integer::i,N
    real(8)::area,perimetro
    real(8),parameter::PI=3.141592653589793d0
    real(8),allocatable::R(:)

    !solicitando número de circulos
    write(6,*)'numero de circulos?' !En el comando write() el 6 se utiliza para
    read(5,*)N

    !localizando memoria
    allocate(R(N)); R=0.d0
    
    !leyendo datos
    do i=1,N
        write(6,*)'radio del circulo',i
        read(5,*)R(i)
    enddo

    !abro archivo para guardar datos
    open(1,file='area.dat',status='unknown')

    !realizo calculos
    do i=1,N
        perimetro=2.d0*PI*R(i)
        area=PI*R(i)**2
        write(1,'(a7,1x,i2,5x,a,F6.1,2(2x,a,1x,F10.5))')'circulo}',i,&
            	'R=',R(i),'area= ',area, 'perimetro= ', perimetro
    enddo

    !cierro archivo
    close(1)

    !deslocalizo memoria
    deallocate(R)


end program area_circulo