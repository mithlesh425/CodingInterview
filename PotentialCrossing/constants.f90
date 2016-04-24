module constants
integer(8),parameter::gridpts = 1024
real(8),parameter::pi = 2.0*asin(1.0)
real(8),parameter::dt = 8.0
real(8),parameter::xmin = -45.0
real(8),parameter::xmax = 45.0
real(8),parameter::x0 = 9.0
real(8),parameter::x1 = -4.364721325998E-2
real(8),parameter::x2 = 5.0012635420E-2
real(8),parameter::x3 =  -7.6042693477E-1
real(8),parameter::x4 =  8.1790045179E-1
real(8),parameter::Vasym =  3.61196179E-1
real(8),parameter::Vlow = 0.0
real(8),parameter::v1 = 4.0167971782296E-2
real(8),parameter::v2 = 4.79833373E-3
real(8),parameter::v3 =  9.8998917754E-1
real(8),parameter::v4 = 1.122019E-2
real(8),parameter::v5 =  7.9781762366E-1
real(8),parameter::b1 = 5.5
real(8),parameter::b2 = 4.9818195151
real(8),parameter::b3 =  2.3471780470
real(8),parameter::b4 = 1.0487590725
real(8),parameter::sigma = 0.3
real(8),parameter::b = 0.25/(sigma**2)
real(8),parameter::mu = 3474.057 ! This is the reduced mass of the system 
real(8),parameter::dx = (xmax-xmin)/real(gridpts)   !0.0439453125
complex(16),parameter::iota = (0.0,1.0)
end module constants 
