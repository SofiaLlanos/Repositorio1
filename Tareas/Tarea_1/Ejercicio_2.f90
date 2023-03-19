program ecuacion_cuadratica
    implicit none
    real(8)::x1,x2,a,b,c,x,y,determinante

    !Recibimos la información del usuario
    write(6,*)
    write(6,*)'Ingrese numeros a,b,c'
    write(6,*)
    read(5,*)a,b,c

    !Calculamos el determinante
    determinante= (b**2) - (4*a*c)

    if (determinante<0) then !Si el determinante es negativo entregamos solución compleja
        x= -b/(2*a)
        y= (sqrt(-determinante)/(2*a))
        write(6,*)
        write(6,*)'Soluciones complejas conjugadas: x1= ',x,'+',y,'i',', x2= ',x,'-',y,'i'
        write(6,*)
    else !Si el determinante es positivo o cero .7separamos en casos:
        if (b>=0) then !Si b >= 0 entonces racionalizamos x1
            x1= -2*c / (b + sqrt(b**2 - 4*a*c))
            x2= (-b - sqrt(b**2 - 4*a*c))/ (2*a)
            write(6,*)
            write(6,*)'Soluciones reales: x1= ',x1,', x2= ',x2
            write(6,*)
        else !Si b < 0 entonces racionalizamos x2
            x1= (-b + sqrt(b**2 - 4*a*c))/ (2*a)
            x2= 2*c / (-b + sqrt(b**2 - 4*a*c))
            write(6,*)
            write(6,*)'Soluciones reales: x1= ',x1,', x2= ',x2
            write(6,*)            

        end if
    end if

end program ecuacion_cuadratica