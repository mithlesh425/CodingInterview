! Roll No: 140122003, Abhishek Pandey
! Program for solving harmonic oscillator problem
! using 3 different methods simple euler,improved euler and rk4
program harmonic
implicit none
real k,m ,kpos,mvel,k1,k2,k3,k4,m1,m2,m3,m4,pos0,pos1,vel0,&
vel1,omega,pi,period,h,p,t,x,f1,f2
integer::input,i,steps
pi=2.0*asin(1.0)
x=1.0
p=0.0
pos0=x
vel0=p
k=1.0
m=1.0
omega=sqrt(k/m)
period=2.0*Pi/omega
h=0.02*period
steps = 200

open(unit=10,file='xandp.txt')
open(unit=11,file='teandx.txt')

print*,"1. Simple Euler"
print*,"2. Improved Euler"
print*,"3. RK4 Method "
print*,"---------------Enter Your choice------------"
read*,input

select case(input)
case(1)
print*, "Simple Euler selected "
do i =1,steps
t=h*float(i)
kpos = pos0+h*f1(x,p)
mvel = vel0+h*f2(x,p)
pos1=kpos
vel1=mvel
x=pos1
p=vel1
pos0=pos1
vel0=vel1
write(10,*)x,p
write(11,*)t/period,pos0**2+vel0**2,pos0
enddo

case(2)
print*,"Improved Euler selected "
do i =1,steps
t=h*float(i)
k1=f1(x,p)
m1=f2(x,p)
k2=f1((x+h*k1),(p+h*m1))
m2=f2((x+h*k1),(p+h*m1))
kpos = pos0 + h*(k1+k2)/2.0
mvel = vel0 + h*(m1+m2)/2.0
pos1=kpos
vel1=mvel
x=pos1
p=vel1
pos0=pos1
vel0=vel1
write(10,*)x,p
write(11,*)t/period,pos0**2+vel0**2,pos0
enddo

case(3)
print*,"RK4 selected "
do i =1,steps
t=h*float(i)
k1 = h*f1(x,p)
m1 = h*f2(x,p)
k2 = h*f1((x+k1/2.0),(p+m1/2.0))
m2 = h*f2((x+k1/2.0),(p+m1/2.0))
k3 = h*f1((x+k2/2.0),(p+m2/2.0))
m3 = h*f2((x+k2/2.0),(p+m2/2.0))
k4 = h*f1((x+k3),(p+m3))
m4 = h*f2((x+k3),(p+m3))
kpos = pos0+(k1+2*k2+2*k3+k4)/6.0
mvel = vel0+(m1+2*m2+2*m3+m4)/6.0
pos1=kpos
vel1=mvel
x=pos1
p=vel1
pos0=pos1
vel0=vel1
write(10,*)x,p
write(11,*)t/period,pos0**2+vel0**2,pos0
enddo

case default
print*,"Please Enter a valid option. Exitting now ..." 
endselect

stop
end program harmonic

real function f2(x,p)
real k,m ,x, p
k=1.0
m=1.0
f2= -(k/m)*x
return
end

real function f1(x,p)
real k,m ,x, p
f1= p
return
end
