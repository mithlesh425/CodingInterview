program main

use constants
implicit none
integer::i
real::km,fourier
real,dimension(256)::x,v
complex,dimension(256)::psi0,psi1,phi,diff

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

! Wavepacket for t = 1
do i=1,256
call ft(psi0,diff,x)
psi1(i) = psi0(i) + iota*dt*(diff(i)/(2*m)-v(i)psi0(i))
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

subroutine ft(psi0,diff,x)

end subroutine ft
