### Java usage

```
javac -cp ".:jcuda-0.7.5.jar" GPLevenshtein.java
java  -cp ".:jcuda-0.7.5.jar" GPLevenshtein 1000
```

### Compile kernel

```
nvcc -ptx JCudaLevenstein.cu -o JCudaLevenstein.ptx
```

### Bash

Edit the content of "benchmark.sh" to change the number of iterations and steps.

`./benchmark.sh` will loop GPMatrix and output a csv result.

### GNU Plot

Edit "gnuplot" to tweak the plot settings.

```
gnuplot> load 'gnuplot.sh' && open plot.png
```
