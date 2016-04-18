set term postscript color 
set out "SimpleEuler.ps"
set title "Simple Euler"
plot [-40:40] [-40:40] "xandp.txt" using 1:2 title "P vs X" with lines
plot [0:10] [0:3000] "teandx.txt" using 1:2 title "2E vs t/T" with lines
plot [0:10] [:] "teandx.txt" using 1:3 title "X vs t/T" with lines
