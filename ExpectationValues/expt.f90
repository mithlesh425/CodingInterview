! T‎his is a fortran code for finding expectation values of the operators 

program main

use constants
implicit none
integer::i,j,m
real::km,t,absolute,num,den,expt 
real,dimension(1024)::x,v,k
complex,dimension(1024)::psi0,phi,diff,psit,psit2
complex::sumwave
character(20)::filename

num = 0.0
den = 0.0
open(unit =33,file = "kval.txt")

do i = 1,1024
k(i) = km(i)
write(33,*)i,k(i)
enddo

! Calculating the values of x and V grid
open(unit = 10,file = 'potential.txt')
do i = 1,1024
x(i) = xmin + (i-1)*dx
v(i) = 0.5*x(i)**2 !Force constant is 1
write(10,*)x(i),v(i)
enddo

! Initial gaussian wave packet
open(unit = 11,file = 'psi0.txt')
do i=1,1024
psi0(i) = ((alpha)/pi)**0.25 * exp((-1)*(alpha/2.0)*((x(i)-x0)**2)) * exp(iota*p0*(x(i)-x0))
write(11,*)x(i),absolute(psi0(i)) !This is for plotting psi square vs x grid
enddo

! For Position Operator
psit = psi0
do i=1,1024
num = num + conjg(psit(i))*x(i)*psit(i)*dx
enddo
expt = num
print*,"The expectation value of x operator is:",expt

!For V (Potential Energy Operator)
num = 0.0
psit = psi0
do i=1,1024
num = num + conjg(psi0(i))*v(i)*psit(i)*dx
enddo
expt = num
print*,"The expectation value of v operator is:",expt


!For p (Momentum Operator)
num = 0.0
psit = psi0
call fft(psit,1024,1)
do i=1,1024
psit(i) = psit(i) * k(i)
enddo
call fft(psit,1024,-1)
psit = psit/real(1024)
do i=1,1024
num = num + psit(i)*conjg(psi0(i))*dx
enddo
expt = num
print*,"The expectation value for p operator is:",expt

! For T (Kinetic Energy Operator)
num = 0.0
psit = psi0
call fft(psit,1024,1)
do i=1,1024
psit(i) = psit(i)*(k(i)**2/(2.0*mass))
enddo
call fft(psit,1024,-1)
do i = 1,1024
psit(i) = psit(i)/real(1024)
enddo
do i=1,1024
num = num + psit(i)*conjg(psi0(i))*dx
enddo
expt = num
print*,"The expectation value for T operator is:",expt



stop

end program main

!-------------------------------------------------------------End of main----------------------------------------------------

! Function to find Km
function km(m)
use constants
real::L,N,km
integer::m,m1
N = 1024.0
L = N * dx  
m1 = m-1

if(m1.lt.N/2) then 
 km = (2.0*pi*m1)/L
else if(m1.ge.N/2) then
 km = (2.0*pi*(m1-N))/L
endif
return
end function km

! Function to find psi squared
function absolute(psi)
complex::psi
absolute = real(psi)**2 + aimag(psi)**2
return 
end function absolute
