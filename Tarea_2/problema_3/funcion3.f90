subroutine funcion3_1(x, f)
    real(8), intent(in) :: x
    real(8), intent(out) ::  f
    real(8), parameter:: E = 2.71828182845904

    f = E**(-0.01*(x**2))

end subroutine funcion3_1

subroutine funcion3_2(z,x, f)
    real(8), intent(in) :: x,z
    real(8), intent(out) ::  f
    real(8), parameter:: E = 2.71828182845904

    f = (E**(-0.01*(x**2)))/sqrt(((x**2) + z**2))

end subroutine funcion3_2