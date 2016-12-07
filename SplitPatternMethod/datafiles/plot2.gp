set term postscript color
set out "Barrier.ps"
set title "Step Potential"
set xlabel "x grid"
set ylabel "potential"

do for [i=2:50] {
	if (i > 19) {
		filename = sprintf("psi%d.",5*i)
	} else {
		filename = sprintf("psi %d.",5*i)
	}
	SlideTitle = sprintf("Timestep : %d",5*i)
	plot [-2:2] [-4:4] filename u 1:2 title SlideTitle w l,"potential.txt" u 1:2 title "barrier" w l
}



