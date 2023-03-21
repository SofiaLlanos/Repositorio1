set xrange [1985:2005]
set yrange [0:20]
set xlabel 'Ano'
set ylabel 'Sillas vacias'
set title 'Porcentaje de sillas vacias'
a = 1; b = 0; c = 5
fit a*x**2 + b*x + c 'C:\Users\Bibliotecas UC\Desktop\Repositorio1\Tarea_1\Ejercicio_1.dat' u 1:2 via a, b, c
