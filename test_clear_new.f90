program test_clear_new
implicit none
integer, parameter :: line_num = 109988, m = 4
integer :: i, j, ios,cnt= 0,a(line_num, m),skip_lines,n
character(len=128) :: token(m)
character :: char_ary(line_num,m)
skip_lines = 21
n  = line_num-skip_lines
open(13,file='JMA_seismic_data_2000.dat',status='old')

do i = 1,skip_lines
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

write(*,*)"yyyy   ","mm   ","dd  ","cnt"

do i = 1, n-1
    if(a(i,4) == a(i+1,4)) then 
        cnt = cnt + 1
    else
        do j = 2,m
        write(*,'(i5)',advance='no')a(i,j)
        end do
        write(*,'(i5)')cnt+1
        cnt = 0
    endif
end do

close(13)

stop
end program test_clear_new
