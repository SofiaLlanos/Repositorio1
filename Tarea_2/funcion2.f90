subroutine funcion(theta_max, theta,  f_theta)
    real(8), intent(in) :: theta_max, theta
    real(8), intent(out) ::  f_theta

    f_theta = (((sin(theta_max/2))**2) - ((sin(theta/2))**2))**(-1.d0/2)
    
end subroutine funcion