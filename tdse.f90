program main

use constants
implicit none
integer::i,j,m,k
real::km,fourier,t
real,dimension(256)::x,v
complex,dimension(256)::psi0,psi1,phi,diff,psit,psit1,psit2
complex::sumwave

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
open(unit = 11,file = './datafiles/psi0')
do i=1,256
psi0(i) = ((2*alpha)/pi)**0.25 * exp((-1)*alpha*((x(i)-x0)**2)) * exp(iota*p0*(x(i)-x0))
write(11,*)x(i),(real(psi0(i))**2 - aimag(psi0(i))**2) !This is for plotting psi square vs x grid
enddo

! Wavepacket for t = 1
open(unit = 12,file = './datafiles/psi1')
do i=1,256

! Start of fourier transform
do m = 1,256
sumwave = 0.0
do j = 1,256
sumwave = sumwave + psi0(j)*exp((-1)*iota*km(m)*x(j))
enddo
sumwave = sumwave/(sqrt(256.0))
phi(m) = sumwave * (km(m)**2) * (-1)
enddo

do j = 1,256
sumwave = 0.0
do m = 1,256
sumwave = sumwave + phi(m)*exp(iota*km(m)*x(j))
enddo
sumwave = sumwave/(sqrt(256.0))
diff(j) = sumwave
enddo


psi1(i) = psi0(i) + iota*dt*(diff(i)/(2*mass)-v(i)*psi0(i))
write(12,*)x(i),(real(psi1(i))**2 - aimag(psi1(i))**2) !This is for plotting psi square vs x grid
enddo

! Extending psi at time t=0 to all times

psit = psi0
psit1 = psi1
t = 0.2
do k = 1,steps

! Start of fourier transform
do m = 1,256
sumwave = 0.0
do j = 1,256
sumwave = sumwave + psit(j)*exp((-1)*iota*km(m)*x(j))
enddo
sumwave = sumwave/(sqrt(256.0))
phi(m) = sumwave * (km(m)**2) * (-1)
enddo

do j = 1,256
sumwave = 0.0
do m = 1,256
sumwave = sumwave + phi(m)*exp(iota*km(m)*x(j))
enddo
sumwave = sumwave/(sqrt(256.0))
diff(j) = sumwave
enddo

! Finding next wave packet
do i=1,256
psit2(i) = psit(i) - (2.0*iota*dt)*((-1)*diff(i)/(2*mass) + v(i)*psit1(i))
if(mod(k,100).eq.0)then
print*,'Value of t:',t,'Wavefunction:',psit2(i)
endif
enddo

t = t+dt
psit = psit1
psit1 = psit2
enddo

end program main

!-------------------------------------------------------------End of main----------------------------------------------------

function km(m)
use constants
real::L,N,km
integer::m
N = 256.0
L = 256*0.02
if(m.lt.N/2.0) then 
km = (2.0*pi*m)/L
else if(m.ge.n/2.0) then
km = (2.0*pi*(m-N))/L
endif
return
end function km
