### Simple java launch

```
javac -cp aparapi.jar:. GPMatrix.java
java -cp aparapi.jar:. GPMatrix 1000
java -Xrunhprof:cpu=samples,file=cpuprof.hprof GPMatrix 1000
```

### Bash

Edit the content of "benchmark.sh" to change the number of iterations and steps.

`./benchmark.sh` will loop GPMatrix and output a csv result.

### GNU Plot

Edit "gnuplot" to tweak the plot settings.

```
gnuplot> load 'gnuplot.sh' && open plot.png
```
