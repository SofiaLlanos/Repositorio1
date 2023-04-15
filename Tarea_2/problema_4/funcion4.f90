subroutine funcion4_1(x, f)
    real(8), intent(in) :: x
    real(8), intent(out) :: f

    f = (x**10) - 5*(x**2)

end subroutine funcion4_1

subroutine funcion4_2(x, y, f)
    real(8), intent(in) :: x, y
    real(8), intent(out) :: f

    f = -x * y
    
end subroutine funcion4_2

subroutine funcion4_3(x, y, z, f)
    real(8), intent(in) :: x, y, z
    real(8), intent(out) :: f

    f = z
    
end subroutine funcion4_3

subroutine funcion4_4(x, y, z, g)
    real(8), intent(in) :: x, y, z
    real(8), intent(out) :: g

    g = -29*y -4*z
    
end subroutine funcion4_4