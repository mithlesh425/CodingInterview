modules = constants.f90 fft.f90
main = tdse

objects = $(modules) $(main).f90

tdse:${objects}
	gfortran ${objects} -o tdse

clean:
	rm ./datafiles/psi*.*
	rm ./datafiles/*.txt
