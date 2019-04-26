set datafile separator ","
set terminal svg font "Helvetica, 12"

set style line 1 lc rgb "#7158e2" lt 1 lw 1 pt 7 pi -1 ps 0.5
set style line 2 lc rgb "#55E6C1" lt 1 lw 1 pt 7 pi -1 ps 0.5

set xtics rotate by 90 offset 0,-1.3
set bmargin 3

set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1 lc rgb "#bbbbbb"

set yr [0:]

plot \
  'block_rw.log' using 1:xtic(3) with linespoints title "writes" ls 1,\
  '' using 2:xtic(3) with linespoints title "reads" ls 2