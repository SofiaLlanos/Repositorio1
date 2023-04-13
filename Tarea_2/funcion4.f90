subroutine funcion4(x, y, y1, f)
    real(8), intent(in) :: x, y, y1
    real(8), intent(out) :: f
    
    f = (x**10) - 5*(x**2)
    !f = -x * y1
    !f = -29*y -4*y1
    
end subroutine funcion4