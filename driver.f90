program driver 

integer, parameter :: MAXDIM = CPPFLAGS
real (kind=8) :: cpu_start, cpu_end
real (kind=8) :: trace
real (kind=8) :: matrixa(MAXDIM,MAXDIM), matrixb(MAXDIM,MAXDIM), matrixc(MAXDIM,MAXDIM)

real (kind=4) :: start, finish

  
do i = 1, MAXDIM 
   do j = 1, MAXDIM
      matrixa(j,i) = 1.0D0 / sqrt(dble(MAXDIM))
      matrixb(j,i) = 1.0D0 / sqrt(dble(MAXDIM))
   enddo
enddo

!Use fortran CPU_TIME subroutine 

call cpu_time(start)
call mmm(MAXDIM, matrixa, matrixb, matrixc);

call cpu_time(finish)

trace = 0.0;
do i=1, MAXDIM 
     trace = trace + matrixc(i,i)
enddo

mflops  = 2 * dble(MAXDIM)**3/ (finish-start) / 1.0e6
 
print *, MAXDIM, trace, finish-start,  mflops

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
