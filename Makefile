modules = constants
main = tdse

objects = $(modules).f90 $(main).f90

tdse:${objects}
	gfortran ${objects} -o tdse

clean:
	rm *.mod *.out
