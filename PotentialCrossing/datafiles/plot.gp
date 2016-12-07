set term postscript color
set out "Wavepackets.ps"
set title "Potential Crossings"
plot "psi000.txt" u 1:2 title "Ground" w l,"psi000.txt" u 1:3 title "Excited" w l
plot "1psi200.txt" u 1:2 title "Ground" w l,"2psi200.txt" u 1:2 title "Excited" w l
plot "1psi400.txt" u 1:2 title "Ground" w l,"2psi400.txt" u 1:2 title "Excited" w l
plot "1psi600.txt" u 1:2 title "Ground" w l,"2psi600.txt" u 1:2 title "Excited" w l
plot "1psi800.txt" u 1:2 title "Ground" w l,"2psi800.txt" u 1:2 title "Excited" w l
plot "1psi1000.txt" u 1:2 title "Ground" w l,"2psi1000.txt" u 1:2 title "Excited" w l
set out "PotentialCrossing.ps"
plot [-25:25][:] "potential.txt" u 1:2 title "V11" w l, "potential.txt" u 1:3 title "V22" w l, "potential.txt" u 1:4 title "V12" w l
set out "DampingFunction.ps"
plot "Damping.txt" u 1:2 title "Damping Function" w l 
