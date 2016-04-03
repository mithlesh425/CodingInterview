program main

use constants
implicit none
integer::i
real::km,fourier
real,dimension(256)::x,v
complex,dimension(256)::psi0

!calculating the values of x and V grid
open(unit = 10,file = './datafiles/potential.txt')
x(1) = xmin;v(1) = 0.0
do i = 2,256
x(i) = x(i-1) + 0.02
if(x(i).ge.0)then
v(i) = 1.0
else
v(i) = 0.0
endif
write(10,*)x(i),v(i)
enddo

! Initial gaussian wave packet
open(unit = 11,file = './datafiles/temp')
do i=1,256
psi0(i) = ((2*alpha)/pi)**0.25 * exp((-1)*alpha*((x(i)-x0)**2)) * exp(iota*p0*(x(i)-x0))
write(11,*)x(i),(real(psi0(i))**2 - aimag(psi0(i))**2) !This is for plotting psi square vs x grid
enddo
end program main

function km(L,m,N)
real::L,m,N
if(m.lt.N/2.0) then 
km = (2.0*pi*m)/l
else if(m.ge.n/2.0) then
km = (2.0*pi*(m-N))/L
endif
return
end function km

function ft(m,psi,x)
use constants
complex::psi,res
integer::m
real::x
!x = x0
res = 0.0
do j = 0,m-1
psi = ((2*alpha)/pi)**0.25 * exp((-1)*alpha*((x-x0)**2)) * exp(iota*p0*(x-x0))
res = res + sqrt(N) * psi*exp((-1)*iota*km(m)*x)
x = x + 0.02
enddo
res = res * (km(m)**2) * (-1)
do j = 0,m-1

end function ft
