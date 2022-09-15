program test_kumamoto
implicit none
integer, parameter :: n = 200, m = 4
integer :: i, j, ios,flag
character(len=128) :: token(m)
character :: char_ary(n,m)
real :: a(n, m),x,max_lat,max_lon,min_lat,min_lon
x = 1000000
max_lat = 35
max_lon = 135
min_lat = 30
min_lon = 130

open(13,file='JMA_seismic_data_1923.dat',status='old')

do i = 1,21
    read(13,*)
end do

do i = 1, n
    do j = 1,m
    char_ary(i,j) = 'Z'
    end do
end do

do i = 1, n
    read(13, *) token(1 : m) 
    do j = 1, m
        read(token(j), *, iostat = ios) a(i, j)
        if (ios /= 0) a(i, j) = -1.0d+00
        if (ios /= 0) char_ary(i,j) = token(j)
    end do
end do

do i = 1, n
    flag = 0
    do j = 1,m
        if(max_lat>a(i,9) .and. min_lat<a(i,9) .and. max_lon> a(i,11) .and. min_lon< a(i,11))then
            flag =1
            if(a(i,j)/= -1.0d+00) then 
            write(*,fmt='(f10.3)',advance='no')(a(i, j))
            else
                write(*,fmt='(A10)',advance='no') char_ary(i,j)
            endif
        endif
    end do
    if(flag==1) write(*,*) ''
end do

! do i = 1, n
!     do j = 1,m

!     end do
! end do
close(13)

stop
end program test_kumamoto
