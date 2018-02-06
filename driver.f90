program driver 

integer, parameter :: DIM=50
real (kind=8) :: cpu_start, cpu_end
real (kind=8) :: trace
real (kind=8) :: matrixa(DIM,DIM), matrixb(DIM,DIM), matrixc(DIM,DIM)

real (kind=4) :: start, finish

  
do i = 1, DIM 
   do j = 1, DIM
      matrixa(j,i) = 1.0D0 / sqrt(dble(DIM))
      matrixb(j,i) = 1.0D0 / sqrt(dble(DIM))
   enddo
enddo

!Use fortran CPU_TIME subroutine 

call cpu_time(start)
call mmm(DIM, matrixa, matrixb, matrixc);

call cpu_time(finish)

trace = 0.0;
do i=1, DIM 
     trace = trace + matrixc(i,i)
enddo

mflops  = 2 * dble(DIM)**3/ (finish-start) / 1.0e6
 
print *, DIM, trace, finish-start,  mflops

end program driver 

subroutine mmm( N, a, b, c )

real (kind=8) :: a(N,*) 
real (kind=8) :: b(N,*) 
real (kind=8) :: c(N,*) 
real (kind=8) :: temp
integer :: i, j, k

do i = 1, N
  do j = 1, N
     temp = 0.0
     do k = 1, N
        temp = temp + A(k,j) * B(i,k)
     enddo
     C(j,i) = temp
  enddo
enddo

end subroutine 
