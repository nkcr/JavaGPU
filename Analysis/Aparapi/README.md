## Aparapi set up

*LD_LIBRARY_PATH* must be set with the path containing aparapi's .so (`libaparapi_x86_64.so`)

```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/localuser/JavaGPU/Analysis/Aparapi/Matrix
```

To compile, include the jar :

```
javac -cp aparapi.jar MyProgram.java
```

To run, also include the jar :

```
java -cp aparapi.jar:. MyProgram
```
