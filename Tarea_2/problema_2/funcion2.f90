subroutine funcion(theta_max, theta,  f_theta)
    real(8), intent(in) :: theta_max, theta
    real(8), intent(out) ::  f_theta
    real(8), parameter :: PI=3.141592653589793d0

    f_theta = ((((sin(theta_max/2))**2) - ((sin(theta/2))**2))**(-1.d0/2))/(PI)
    
end subroutine funcion

subroutine funcion(theta_max, theta,  f_theta)
    real(8), intent(in) :: theta_max, theta
    real(8), intent(out) ::  f_theta
    real(8), parameter :: PI=3.141592653589793d0

    f_theta = 2*((((sin(theta_max/2))**2) - ((sin(theta/2))**2))**(1.d0/2))/(PI)
    
end subroutine funcion