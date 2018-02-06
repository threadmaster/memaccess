#Plot Command File
#Data i file called "times"
set title "Performance with Increasing Dimension\nMatrix Multiplication"
set xlabel "Dimension"
set ylabel "Megaflops"
plot "times.dat" using 1:2  with points smooth unique title "No Optimization" 
replot "times.dat" using 1:3  with points smooth unique title "With -O3" 
#if you want logaxes then uncomment the next line
#set logscale y
replot
#commands below make files for inclusion in papers
set output "plot.ps"
set terminal postscript enhanced color landscape
replot
set output "plot.eps"
set terminal postscript enhanced eps color
replot
set output "plot.png"
set terminal png 
replot
