### Simple java launch

```
javac GPLevenshtein.java
java GPLevenshtein <file a> <file b>
java -Xrunhprof:cpu=samples,file=cpuprof.hprof GPLevenshtein <file a> <file b>
```

### Bash

Edit the content of "benchmark.sh" to change the number of iterations and steps.

`./benchmark.sh` will loop GPLevenshtein and output a csv result.

### GNU Plot

Edit "gnuplot" to tweak the plot settings.

```
gnuplot> load 'gnuplot.sh' && open plot.pdf
```
