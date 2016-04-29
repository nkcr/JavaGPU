### Java usage

```
javac -cp ".:jcuda-0.7.5.jar" GPMatrix.java
java  -cp ".:jcuda-0.7.5.jar" GPMatrix 1000
```

### Compile kernel

```
nvcc -ptx JCudaMatrix.cu -o JCudaMatrix.ptx
```

### Bash

Edit the content of "benchmark.sh" to change the number of iterations and steps.

`./benchmark.sh` will loop GPMatrix and output a csv result.

### GNU Plot

Edit "gnuplot" to tweak the plot settings.

```
gnuplot> load 'gnuplot.sh' && open plot.png
```
