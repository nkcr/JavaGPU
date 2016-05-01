## Aparapi set up

*LD_LIBRARY_PATH* must be set with the path containing JCuda's .so

```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/localuser/JavaGPU/Common/jcuda/
```

To compile, include the jar :

```
javac -cp ".:jcuda-0.7.5.jar" GPMatrix.java
```

To run, also include the jar :

```
java  -cp ".:jcuda-0.7.5.jar" GPMatrix 1000
```

To compile the kernel :

```
nvcc -ptx JCudaMatrix.cu -o JCudaMatrix.ptx
```
