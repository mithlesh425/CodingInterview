set term postscript color
set out "Wavepackets.ps"
set title "Potential Crossings"
plot "psi000.txt" using 1:2 title "Ground" with lines,"psi000.txt" using 1:3 title "Excited" with lines
plot "1psi200.txt" using 1:2 title "Ground" with lines,"2psi200.txt" using 1:2 title "Excited" with lines
plot "1psi400.txt" using 1:2 title "Ground" with lines,"2psi400.txt" using 1:2 title "Excited" with lines
plot "1psi600.txt" using 1:2 title "Ground" with lines,"2psi600.txt" using 1:2 title "Excited" with lines
plot "1psi800.txt" using 1:2 title "Ground" with lines,"2psi800.txt" using 1:2 title "Excited" with lines
plot "1psi1000.txt" using 1:2 title "Ground" with lines,"2psi1000.txt" using 1:2 title "Excited" with lines
set out "PotentialCrossing.ps"
plot [-25:25][:] "potential.txt" using 1:2 title "V11" with lines, "potential.txt" using 1:3 title "V22" with lines, "potential.txt" using 1:4 title "V12" with lines
set out "DampingFunction.ps"
plot "Damping.txt" using 1:2 title "Damping Function" with lines 
