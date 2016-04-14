module constants
real,parameter::pi = 2.0*asin(1.0)
real,parameter::alpha = 1.0
real,parameter::x0 = 0.0
real,parameter::p0 = 0.0
real,parameter::mass = 1.0
real,parameter::xmin = -20.0
real,parameter::xmax = 20.0
real,parameter::dx = (xmax-xmin)/(1023.0)
complex,parameter::iota = (0.0,1.0)
end module constants 
