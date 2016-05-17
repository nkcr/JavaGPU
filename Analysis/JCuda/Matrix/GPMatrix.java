import java.util.Random;
import jcuda.*;
import jcuda.runtime.*;
import jcuda.driver.*;
import static jcuda.driver.JCudaDriver.*;

public class GPMatrix {

  public static int verbose = 0; // level 0,1,2
  public static int size;

  public static void main(String[] args) {

    // Params handling
    if(args.length < 1) {
      System.err.println("Needs size argument");
      System.exit(0);
    }
    size = Integer.valueOf(args[0]);

    // Matrix declaration
    double[] A = new double[size * size];
    double[] B = new double[size * size];
    double[] C = new double[size * size];

    matrixInit(A,B);

    // Enable exception
    JCudaDriver.setExceptionsEnabled(true);

    // Initialize the driver and create a context for the first device
    cuInit(0);
    CUdevice device = new CUdevice();
    cuDeviceGet(device, 0);
    CUcontext context = new CUcontext();
    cuCtxCreate(context, 0, device);

    // Load the CUDA kernel ptx file
    CUmodule module = new CUmodule();
    cuModuleLoad(module, "../JCudaMatrix.ptx");

    // Obtain a function pointer to the kernel function
    CUfunction function = new CUfunction();
    cuModuleGetFunction(function, module, "mul");

    // Allocate the device input data, and copy the host input data
    // to the device
    int ptrSize = size * size * Sizeof.DOUBLE;
    CUdeviceptr deviceInputA = new CUdeviceptr();
    cuMemAlloc(deviceInputA, ptrSize);
    cuMemcpyHtoD(deviceInputA, Pointer.to(A), ptrSize);

    CUdeviceptr deviceInputB = new CUdeviceptr();
    cuMemAlloc(deviceInputB, ptrSize);
    cuMemcpyHtoD(deviceInputB, Pointer.to(B), ptrSize);

    CUdeviceptr deviceOutput = new CUdeviceptr();
    cuMemAlloc(deviceOutput, ptrSize);

    // Set up the kernel parameters: A pointer to an array
    // of pointers which points to the actual values
    Pointer kernelParameters = Pointer.to(
      Pointer.to(deviceInputA),
      Pointer.to(deviceInputB),
      Pointer.to(deviceOutput),
      Pointer.to(new int[]{size})
    );

    // Kernel call parameters
    int blockSizeX = 256;
    int gridSizeX = (int)Math.ceil((double)size / blockSizeX);

    // --------------------------------
    long startTime = System.currentTimeMillis();
    // --- Start of benchmark zone --->
    cuLaunchKernel(function,
      gridSizeX, 1, 1,       // Grid dimension
      blockSizeX, 1, 1,     // Block dimension
      0, null,              // Shared memory size and stream
      kernelParameters, null // Kernel and extra parameters
    );
    cuCtxSynchronize();
    // <--- End of benchmark zone -----
    long stopTime = System.currentTimeMillis();
    // --------------------------------

    // Benchmark time elapsed computation
    long elapsedTime = stopTime - startTime;

    // Allocate the output memory and copy output from device to host
    // cuMemcpyDtoH(Pointer.to(C), deviceOutput, ptrSize);
    //
    // printMatrix(C, size);

    // Output
    if(verbose > 0) System.out.println("Time elapsed: " + elapsedTime/1000 + "s");
    System.out.println(elapsedTime/1000);

  }

  // Matrix random initialization of A and B
  public static void matrixInit(double[] A, double[] B) {
    Random r = new Random(1);
    for(int row=0; row < size; row++) {
      for(int col=0; col < size; col++) {
        A[ (row*size)+col ] = r.nextDouble();
        B[ (row*size)+col ] = r.nextDouble();
      }
    }
  }

  // Computes matrix multiplication C = AB
  public static void matrixMul(double[][] A, double[][] B, double[][] C) {
    for(int i=0; i < size; i++) {
      for(int j=0; j < size; j++) {
        double sum = 0.0;
        for(int k=0; k < size; k++) {
          sum += A[i][k] * B[k][j];
        }
        C[i][j] = sum;
        if(verbose > 1) System.out.print("\t" + C[i][j]);
      }
      if(verbose > 1) System.out.print("\n");
    }
  }

  // Displays the content of matrix A
  public static void printMatrix(double[] A, int size) {
    for(int row=0; row < size; row++) {
      for(int col=0; col < size; col++) {
        System.out.print("\t" + A[ (row*size)+col]);
      }
      System.out.print("\n");
    }
  }

}
