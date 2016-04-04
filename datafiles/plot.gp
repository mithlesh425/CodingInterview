set term postscript color
set out "Barrier.ps"
set title "Step Potential"
set xlabel "x grid"
set ylabel "potential"

plot [-2:2] [-4:4] "psi 10." using 1:2 title "Timestep :10" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 20." using 1:2 title "Timestep :20" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 30." using 1:2 title "Timestep :30" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 40." using 1:2 title "Timestep :40" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 50." using 1:2 title "Timestep :50" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 60." using 1:2 title "Timestep :60" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 70." using 1:2 title "Timestep :70" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 80." using 1:2 title "Timestep :80" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi 90." using 1:2 title "Timestep :90" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi100." using 1:2 title "Timestep :100" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi110." using 1:2 title "Timestep :110" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi120." using 1:2 title "Timestep :120" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi130." using 1:2 title "Timestep :130" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi140." using 1:2 title "Timestep :140" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi150." using 1:2 title "Timestep :150" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi160." using 1:2 title "Timestep :160" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi170." using 1:2 title "Timestep :170" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi180." using 1:2 title "Timestep :180" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi190." using 1:2 title "Timestep :190" with lines,"potential.txt" using 1:2 title "barrier" with lines
plot [-2:2] [-4:4] "psi200." using 1:2 title "Timestep :200" with lines,"potential.txt" using 1:2 title "barrier" with lines

