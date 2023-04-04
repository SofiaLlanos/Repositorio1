!creado por Jose Mejia Lopez
!El problema de dos cuerpos
MODULE modKepler
    real(8),parameter::PI=3.141592653589793d0
    
    integer::integral,imaginario
    real(8),save::E,L !Energia, Momento angular
    real(8),save::masaTot !masa total
    
  END MODULE modKepler
  !*****************************************************
  PROGRAM Kepler
    !las unidades deben ser:
    !    masas en terminos de la masa de la tierra
    !    posiciones en terminos de la distancia tierra-sol (unidades astronomicas)
    !    tiempo en aÃ±os
    USE modKepler
    implicit none
    !Declaration of variables
    !rc = posicion en coordenadas cartecianas
    integer::i,paso,i1,signo
    real(8)::rc(2,2),vc(2,2),masa(2) !variables cinematicas
    real(8)::v0(2),rcm0(2),vcm0(2),r0(2),rcm(2),r1(2),r2(2),mu
    real(8)::t,tf,deltat,drp,rp0,rpf,Es,Ecm,Ls,Lcm
    real(8)::deltath,th0,th,p_a,p_e,rpini,alfa,dias,horas,minutos
    real(8)::mag2_v0,r0v0,aradial,drp0,Tun
  
  
    !lee informacion desde el usuario
    write(6,*)'ua = unidades astronomicas (distancia promedio Tierra-Sol)'
    do i=1,2
       write(6,"(a,i1,a)")'datos de la particula ',i,' :'
       write(6,"(a)")'masa (en terminos de la masa de la Tierra) ?'
       read(5,*)masa(i)
       write(6,"(a)")'posicion y velocidad (x0 y0 v0x v0y) en ua y ua/aÃ±o ?'
       read(5,*)rc(i,:),vc(i,:)
    end do
  
    write(6,*)'tiempo final en aÃ±os ?'
    read(5,*)tf
    write(6,*)'intervalo de cambio en la distancia radial en ua?'
    read(5,*)drp0
  
    write(6,*)
  
    !magnitudes adimensionales con:
    !tiempo caracteristico T=sqrt(R^3/(2*G*mu))
    !masa caracteristica mu
    !distancia caracteristica R (1 unidad astronomica)
    mu=masa(1)*masa(2)/(masa(1)+masa(2)) !masa reducida
    masa=masa/mu !masas en funcion de mu 
    masaTot=masa(1)+masa(2) !masa total
  
    Tun=64.96255911d0*sqrt(1.d0/mu) !en aÃ±os
    write(6,"(a,F10.5,a)")'Tun= ',Tun,' aÃ±os'
    vc=vc*Tun
    tf=tf/Tun
  
    !transformo condiciones iniciales al sistema del centro de masa y relativo
    rcm0(:)=(masa(1)*rc(1,:)+masa(2)*rc(2,:))/masaTot !posicion inicial del CM
    r0(:)=rc(2,:)-rc(1,:) ! posicion relativa inicial
    vcm0(:)=(masa(1)*vc(1,:)+masa(2)*vc(2,:))/masaTot !velocidad inicial del CM
    v0(:)=vc(2,:)-vc(1,:) !velocidad relativa inicial
    rp0=sqrt(dot_product(r0,r0)) !distancia radial inicial
    th0=atan2(r0(2),r0(1)) !distancia angular inicial
  
    write(6,"(a,F8.3,a,F12.3)")'mu= ',mu,'  Mtot= ',masaTot*mu
    
    !Energia total y momento angular total iniciales del sistema
    Es=.5d0*masa(1)*dot_product(vc(1,:),vc(1,:)) + &
         .5d0*masa(2)*dot_product(vc(2,:),vc(2,:)) - &
         0.5d0*masa(1)*masa(2)/rp0
    Ls=masa(1)*(rc(1,1)*vc(1,2)-rc(1,2)*vc(1,1)) + &
         masa(2)*(rc(2,1)*vc(2,2)-rc(2,2)*vc(2,1))
    write(6,"(a,F14.6)")'Energia total del sistema: ',Es*mu/Tun**2
    write(6,"(a,F14.6)")'Momento angular total del sistema: ',Ls*mu/Tun
  
    !Energia y momento angular inicial del centro de masa
    Ecm=0.5d0*masaTot*dot_product(vcm0,vcm0)
    Lcm=masaTot*(rcm0(1)*vcm0(2)-rcm0(2)*vcm0(1))
  
    !Energia relativa y momento angular relativo del sistema
    mag2_v0=dot_product(v0,v0)
    L=r0(1)*v0(2)-r0(2)*v0(1) !a lo largo del eje Z, perpendicular al plano
    !                               de movimiento
    E=0.5d0*mag2_v0-0.5d0*masa(1)*masa(2)/rp0
  
    
    write(6,"(a,F14.6)")'Energia relativa: ',E*mu/Tun**2
    write(6,"(a,F14.6)")'Momento angular relativo: ',L*mu/Tun
  
    p_a=2.d0*L**2/masaTot
    p_e=sqrt(1.d0+8.d0*E*L**2/(masaTot**2))
  
    write(6,"(a,F15.6)")'excentricidad ',p_e
    write(6,"(a,F16.6)")'parametro a: ',p_a
  
    !direccion entre radio y velocidad
    r0v0=dot_product(r0,v0)
    if(mag2_v0.ne.0.d0)then
       alfa=acos(r0v0/(rp0*sqrt(mag2_v0)))
       write(6,"(a,f7.2)")'angulo inicial entre velocidad y posicion: ', &
            alfa*180.d0/PI
    end if
  
    !direccion radial inicial
    if(abs(r0v0).lt.1.d-9)then
       aradial=L**2/rp0**3-0.5d0*masaTot/rp0**2 ! d^2 r / dt^2 
       signo=int(aradial/abs(aradial))
    else
       signo=int(r0v0/abs(r0v0))
    end if
  
    !Calculo de ecuaciones y guarda en un archivo
    open(1,file='res_kepler.dat',status='unknown')
    write(1,"('# ',a,2x,a,8x,a,4x,a,4(8x,a))")'t(aÃ±os)','r(ua)','th', &
         'r analitico','x1','y1','x2','y2'
    
    t=0.d0; th=th0; rpini=rp0
    drp=drp0
    write(1,15)t,rp0,th0,rp0,rc(1,:),rc(2,:)
    FLUSH(1)
  
    imaginario=0; paso=0
    do
       i1=1
       rpf=rp0+drp*signo
       !condicion de colision
       if(rpf.le.0.d0)then
          tf=t*Tun
          write(6,"(a,F6.3,a,F6.3,a)")'r= ',rpf,&
               ', el sistema colisionÃ³ al tiempo',tf,' aÃ±os'
          dias=(tf-int(tf))*365.d0
          horas=(dias-int(dias))*24.d0
          minutos=(horas-int(horas))*60.d0
          write(6,"(i4,a,i3,a,i2,a,f5.2,a)")int(tf),' aÃ±os ',&
               int(dias),' dÃ­as ',int(horas),' horas ',minutos,' minutos'
          exit
       end if
  
       integral=1; call gauss_legendre(rp0,rpf,2000,deltat)
  
       if(imaginario.gt.0)i1=0
  
       select case(i1)
       case(0)
          drp=drp/10.d0; paso=paso+1; imaginario=0
          write(66,*)paso,drp,rp0,rpf
          if(paso.eq.6)then
             aradial=L**2/rp0**3-0.5d0*masaTot/rp0**2
             signo=int(aradial/abs(aradial))
          else
             cycle
          end if
       case(1)
          t=t+abs(deltat)
          integral=2; call gauss_legendre(rp0,rpf,1000,deltath)
          th=th+deltath*int(deltat/abs(deltat))
          rcm(:)=rcm0(:)+vcm0(:)*t
          r1(1)=rcm(1)-masa(2)*rpf*cos(th)/masaTot
          r1(2)=rcm(2)-masa(2)*rpf*sin(th)/masaTot
          r2(1)=rcm(1)+masa(1)*rpf*cos(th)/masaTot
          r2(2)=rcm(2)+masa(1)*rpf*sin(th)/masaTot
  
          write(1,15)t*Tun,rpf,th,p_a/(1.d0+p_e*cos(th)),r1,r2
          FLUSH(1)
          
          rp0=rpf; imaginario=0
          if(t.gt.tf)exit        
       end select
       
       if(paso.ne.0)then
          drp=drp0; paso=0
       end if
       
    end do
    
  15 format(f8.5,1x,f9.5,1x,f10.6,2x,f9.5,3x,4(1x,f9.5))
  
    write(6,*)
    write(6,*)'resultados en res_kepler.dat'
    write(6,*)
  
  
  END PROGRAM Kepler
  !************************************************
  SUBROUTINE funcion(x,f)
    !funcion que se va a integrar
    USE modKepler
    implicit none
    real(8),INTENT(IN)::x
    real(8),INTENT(OUT)::f
    real(8)::ff
  
    ff=2.d0*E-L**2/x**2+masaTot/x
  
  
    if(ff.le.0.d0)then
       f=0.d0; imaginario=1
       return
    end if
  
    select case(integral)
       case(1)
          f=1.d0/sqrt(ff)  !Dt
       case(2)
          f=L/(x**2*sqrt(ff)) !Dtheta
       case default
          write(6,*)'integral debe ser 1 o 2 y no ',integral
          stop
       end select
  
  END SUBROUTINE funcion
  
  