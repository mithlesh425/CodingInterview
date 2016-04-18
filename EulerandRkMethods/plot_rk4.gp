set term postscript color 
set out "RK4.ps"
 set title "RK4"
plot [-1:1] [-1:1] "xandp.txt" using 1:2 title "P vs X" with lines
plot [0:1] [:] "teandx.txt" using 1:2 title "2E vs t/T" with lines
plot [0:1] [-1:1] "teandx.txt" using 1:3 title "X vs t/T" with lines
