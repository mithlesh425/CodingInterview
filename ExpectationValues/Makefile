modules = constants.f90 fft.f
main = expt

objects = $(modules) $(main).f90

tdse:${objects}
	gfortran ${objects} -o tdse

clean:
	rm *.txt
	rm *.mod
