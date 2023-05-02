module mod1
    implicit none
    integer, save:: N
    real(8), parameter:: k = 8.9875517873681764*(10**9)
    real(8), save:: L
    real(8), save, allocatable:: q(:), xy(:,:) !xy(1,:) posicion x, xy(2,:) posicion en y
    
end module mod1