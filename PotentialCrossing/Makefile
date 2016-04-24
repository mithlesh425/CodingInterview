modules = constants.f90 fft.f90
main = potential

objects = $(modules) $(main).f90

$(main):${objects}
	gfortran ${objects} -o $(main)

clean:
	rm ./datafiles/*.txt 

plot:
	cd datafiles && gnuplot plot.gp && mv *.ps ../ 
