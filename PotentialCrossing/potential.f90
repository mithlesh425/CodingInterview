program potential

    use constants
    implicit none
    integer(8)::i,step,m
    real(8)::j,absolute,p0,t,L,N,max,mask,xpos
    real(8),dimension(gridpts)::x,V11,V22,V12,V1ad,V2ad,f,k,D
    complex(16)::temp1,temp2
    complex(16),dimension(gridpts)::psi1,psi2,psig,psie
    character(50)::filename1,filename2

! The k grid values 
    N = real(gridpts)
    L = N * dx
    do i = 1,gridpts
        m = i-1
        if(m.lt.N/2.0) then 
            k(m) = (2.0*pi*m)/L
        else if(m.ge.n/2.0) then
            k(m) = (2.0*pi*(m-N))/L
        endif
    end do

! Initialising the potential and x grid 
    j = xmin
    open(unit = 10, file = "datafiles/potential.txt")
    do i = 1,gridpts
        x(i) = j
        j = j + dx
        V1ad(i) = v1*exp(b1*(x(i)-x1))/((1.0+exp(b1*(x(i)-x1)))**2) + v2*exp(b1*(x(i)-x1))/(1.0+exp(b1*(x(i)-x1)))
        V2ad(i) = Vasym - v3*exp(b2*(x(i)-x2))/((1.0+exp(b2*(x(i)-x2)))**2) - v4*exp(b2*(x(i)-x2))/(1.0+exp(b2*(x(i)-x2))) &
        - v5*exp(b3*(x(i)-x3))/((1.0+exp(b3*(x(i)-x3)))**2) - Vlow
        f(i) = 0.5*(1.0-tanh(b4*(x(i)-x4)))
        V11(i) = (1.0-f(i))*V1ad(i) + f(i)*V2ad(i)
        V22(i) = f(i)*V1ad(i) + (1.0-f(i))*V2ad(i)
        V12(i) = -1.0*sqrt(f(i)*(1.0-f(i)))*(V2ad(i)-V1ad(i))
        write(10,*)x(i),V11(i),V22(i),V12(i)
    end do
    close(10)

! The Damping function
    open(unit= 20,file = "datafiles/Damping.txt")
    do i = 1,gridpts
        if (x(i).lt.-30.0)then
            max = -45.0
            mask = -30.0
        else if (x(i).gt.10) then 
            max = 45.0
            mask = 10.0
        else 
            D(i) = 1.0
            cycle
        end if
        D(i) = sin(pi*(max-x(i))/(2.0*(max-mask)))
        write(20,*)x(i),D(i)
    end do 
    close(20)

! Wavefunction at time t = 0.0
     open (unit = 11,file = "datafiles/psi000.txt")
     xpos = 9.0
     p0 = -1.0*sqrt(2.0*mu*(0.029-V11(int((xpos-xmin)/dx)))) ! position of x = 9.0 in the grid
     do i = 1,gridpts
        psi1(i) = (1.0/(2*pi*sigma**2))**0.25 * exp(-1.0*b*(x(i)-x0)**2) * exp(iota*p0*(x(i)-x0))
        psi2(i) = 0.0
        write(11,*)x(i),absolute(psi1(i)),absolute(psi2(i))
     end do
     close(11)

     psig = psi1
     psie = psi2
! Propogation of the wave 
    t= 0.0
    do step = 2, 1000   ! Step 1 has already been done 
        ! Potential energy
        do i = 1,gridpts
            psig(i) = psig(i)*exp((-1)*iota*dt*V11(i)*0.25)
            psie(i) = psie(i)*exp((-1)*iota*dt*V22(i)*0.25)
        enddo

        do i = 1,gridpts
            temp1 = psig(i)
            temp2 = psie(i)
            psig(i) = cos(V12(i)*dt*0.50)*temp1 - iota*sin(V12(i)*dt*0.50)*temp2
            psie(i) = cos(V12(i)*dt*0.50)*temp2 - iota*sin(V12(i)*dt*0.50)*temp1
        enddo

        do i = 1, gridpts
            psig(i) = psig(i)*exp((-1)*iota*dt*V11(i)*0.25)
            psie(i) = psie(i)*exp((-1)*iota*dt*V22(i)*0.25) 
        end do

        ! Kinetic Energy Operator
        call fft(psig,gridpts,1)
        do i=1,gridpts
            psig(i) = psig(i) * exp((iota*dt*(k(i)**2.0) * (-1.0))/(2.0*mu))
        end do
        call fft(psig,gridpts,-1)
        psig = psig/real(gridpts)

        call fft(psie,gridpts,1)
        do i=1,gridpts
            psie(i) = psie(i) * exp((iota*dt*(k(i)**2.0) * (-1.0))/(2.0*mu))
        end do
        call fft(psie,gridpts,-1)
        psie = psie/real(gridpts)
        

        ! Potential energy + Damping function 
        do i = 1,gridpts
            psig(i) = psig(i)*exp((-1)*iota*dt*V11(i)*0.25)
            psie(i) = psie(i)*exp((-1)*iota*dt*V22(i)*0.25)
        enddo

        do i = 1,gridpts
            temp1 = psig(i)
            temp2 = psie(i)
            psig(i) = cos(V12(i)*dt*0.50)*temp1 - iota*sin(V12(i)*dt*0.50)*temp2
            psie(i) = cos(V12(i)*dt*0.50)*temp2 - iota*sin(V12(i)*dt*0.50)*temp1
        enddo

        do i = 1, gridpts
            psig(i) = psig(i)*exp((-1)*iota*dt*V11(i)*0.25) * D(i)
            psie(i) = psie(i)*exp((-1)*iota*dt*V22(i)*0.25) * D(i)
        end do



        ! Creating a file for each 200th step
        write(filename1,1)step
        1 format('datafiles/1psi',I0,'.txt')
        write(filename2,2)step
        2 format('datafiles/2psi',I0,'.txt')

        if(mod(step,200).eq.0)then
            open(unit = 5,file = filename1)
            open(unit = 6,file = filename2)
            do i=1,gridpts
                write(5,*)x(i),absolute(psig(i))
                write(6,*)x(i),absolute(psie(i))
            end do
            close(5)
            close(6)
        endif

        t = t + dt
    end do
end program potential


! Function to find psi squared
function absolute(psi)
complex(16)::psi
real(8)::absolute   
absolute = psi * conjg(psi)
return 
end function absolute
